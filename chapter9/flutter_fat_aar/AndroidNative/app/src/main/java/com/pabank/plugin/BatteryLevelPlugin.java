package com.pabank.plugin;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.support.annotation.NonNull;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

/**
 * 获取电量信息
 */
public class BatteryLevelPlugin implements MethodChannel.MethodCallHandler {

    private static final String CHANNEL = "pabank.flutter.plugin/battery";
    private FlutterView flutterView;

    private BatteryLevelPlugin(FlutterView flutterView) {
        this.flutterView = flutterView;
    }

    public static void registerWith(FlutterView flutterView) {
        final MethodChannel channel = new MethodChannel(flutterView, CHANNEL);
        channel.setMethodCallHandler(new BatteryLevelPlugin(flutterView));
    }

    @Override
    public void onMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {
        switch (methodCall.method) {
            case "getBatteryLevel":
                int batteryLevel = getBatteryLevel();
                if (batteryLevel != -1) {
                    result.success(batteryLevel);
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null);
                }
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) flutterView.getContext().getSystemService(Context.BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(flutterView.getContext().getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }
}
