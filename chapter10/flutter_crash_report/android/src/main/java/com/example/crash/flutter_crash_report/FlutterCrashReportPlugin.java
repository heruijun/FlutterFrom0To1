package com.example.crash.flutter_crash_report;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.util.Log;

import com.example.crash.flutter_crash_report.okhttp.CommonOkHttpClient;

import org.json.JSONObject;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/**
 * FlutterCrashReportPlugin
 */
public class FlutterCrashReportPlugin implements MethodCallHandler {
    private final Context context;
    private static final String[] EMPTY_STRING_LIST = new String[]{};
    public static final MediaType JSON
            = MediaType.parse("application/json; charset=utf-8");

    private FlutterCrashReportPlugin(Context context) {
        this.context = context;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_crash_report");
        channel.setMethodCallHandler(new FlutterCrashReportPlugin(registrar.context()));
    }

    @Override
    public void onMethodCall(MethodCall methodCall, Result result) {
        if (methodCall.method.equals("deviceInfo")) {
            Map<String, Object> build = new HashMap<>();
            build.put("board", Build.BOARD);
            build.put("bootloader", Build.BOOTLOADER);
            build.put("brand", Build.BRAND);
            build.put("device", Build.DEVICE);
            build.put("display", Build.DISPLAY);
            build.put("fingerprint", Build.FINGERPRINT);
            build.put("hardware", Build.HARDWARE);
            build.put("host", Build.HOST);
            build.put("id", Build.ID);
            build.put("manufacturer", Build.MANUFACTURER);
            build.put("model", Build.MODEL);
            build.put("product", Build.PRODUCT);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                build.put("supported32BitAbis", Arrays.asList(Build.SUPPORTED_32_BIT_ABIS));
                build.put("supported64BitAbis", Arrays.asList(Build.SUPPORTED_64_BIT_ABIS));
                build.put("supportedAbis", Arrays.asList(Build.SUPPORTED_ABIS));
            } else {
                build.put("supported32BitAbis", Arrays.asList(EMPTY_STRING_LIST));
                build.put("supported64BitAbis", Arrays.asList(EMPTY_STRING_LIST));
                build.put("supportedAbis", Arrays.asList(EMPTY_STRING_LIST));
            }
            build.put("tags", Build.TAGS);
            build.put("type", Build.TYPE);
            build.put("isPhysicalDevice", !isEmulator());
            build.put("androidId", getAndroidId());

            Map<String, Object> version = new HashMap<>();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                version.put("baseOS", Build.VERSION.BASE_OS);
                version.put("previewSdkInt", Build.VERSION.PREVIEW_SDK_INT);
                version.put("securityPatch", Build.VERSION.SECURITY_PATCH);
            }
            version.put("codename", Build.VERSION.CODENAME);
            version.put("incremental", Build.VERSION.INCREMENTAL);
            version.put("release", Build.VERSION.RELEASE);
            version.put("sdkInt", Build.VERSION.SDK_INT);
            build.put("version", version);

            result.success(build);
        } else {
            onInitialisedMethodCall(methodCall, result);
        }
    }

    void onInitialisedMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method) {
            case "reportCrash":
                final Map<String, Object> exception = (Map<String, Object>) call.arguments;
                JSONObject obj = new JSONObject(exception);
                reportToServer(obj.toString());
                result.success(null);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void reportToServer(String json) {
        RequestBody body = RequestBody.create(JSON, json);
        Log.e("捕获到Flutter异常：", json);
        Request request = new Request.Builder()
                .url("http://172.20.10.3:3000/log")
                //.url("http://192.168.11.104:3000/log")
                .post(body)
                .build();
        CommonOkHttpClient.getOkHttpClient().newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("response onFailure", call.request().body().toString());
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                Log.e("response", response.body().string());
            }
        });
    }

    @SuppressLint("HardwareIds")
    private String getAndroidId() {
        return Settings.Secure.getString(context.getContentResolver(), Settings.Secure.ANDROID_ID);
    }

    /**
     * A simple emulator-detection based on the flutter tools detection logic and a couple of legacy
     * detection systems
     */
    private boolean isEmulator() {
        return (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"))
                || Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.startsWith("unknown")
                || Build.HARDWARE.contains("goldfish")
                || Build.HARDWARE.contains("ranchu")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || Build.PRODUCT.contains("sdk_google")
                || Build.PRODUCT.contains("google_sdk")
                || Build.PRODUCT.contains("sdk")
                || Build.PRODUCT.contains("sdk_x86")
                || Build.PRODUCT.contains("vbox86p")
                || Build.PRODUCT.contains("emulator")
                || Build.PRODUCT.contains("simulator");
    }
}
