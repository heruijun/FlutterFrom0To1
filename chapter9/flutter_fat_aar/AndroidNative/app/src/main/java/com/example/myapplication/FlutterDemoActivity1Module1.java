package com.example.myapplication;

import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;
import com.pabank.creditcart.BankService.service.BankService;
import com.pabank.creditcart.loader.ServiceLoader;
import com.pabank.plugin.BatteryLevelPlugin;
import fleamarket.taobao.com.xservicekit.handler.MessageResult;
import fleamarket.taobao.com.xservicekit.service.ServiceEventListner;
import io.flutter.facade.Flutter;
import io.flutter.view.FlutterView;

import java.util.HashMap;
import java.util.Map;

public class FlutterDemoActivity1Module1 extends AppCompatActivity {

    private FlutterView flutterView;
    private FrameLayout fl;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_normal);
        ServiceLoader.load();

        flutterView = Flutter.createView(
                FlutterDemoActivity1Module1.this,
                getLifecycle(),
                "creditcard"
        );
        fl = findViewById(R.id.frame_layout);
        fl.addView(flutterView);
        showFlutterView(flutterView);

        // 注册插件
        BatteryLevelPlugin.registerWith(flutterView);

//        flutterView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
//            @Override
//            public void onViewAttachedToWindow(View v) {
//                final Handler handler = new Handler();
//                handler.postDelayed(new Runnable() {
//                    @Override
//                    public void run() {
//                        test();
//                    }
//                }, 2000);
//            }
//
//            @Override
//            public void onViewDetachedFromWindow(View v) {
//                Log.e("ooo", "ooo");
//            }
//        });
    }

    private void showFlutterView(FlutterView flutterView) {
        flutterView.addFirstFrameListener(new FlutterView.FirstFrameListener() {
            @Override
            public void onFirstFrame() {
                flutterView.removeFirstFrameListener(this);
                fl.setVisibility(View.VISIBLE);
            }
        });
    }

    private void test() {
        // 发送消息给Flutter
//        BankService.MessageToFlutter(new MessageResult<Map>() {
//            @Override
//            public void success(Map var1) {
//                System.out.println("从Native发送消息成功！");
//            }
//
//            @Override
//            public void error(String var1, String var2, Object var3) {
//                System.out.println("从Native发送消息失败！");
//            }
//
//            @Override
//            public void notImplemented() {
//                System.out.println("从Native发送消息未实现！");
//            }
//        }, "Flutter真棒！");

        HashMap<String, String> map = new HashMap<String, String>();
        map.put("user", "小明");
        BankService.getService().emitEvent("test", map);
    }

    @Override
    protected void onPostResume() {
        super.onPostResume();

//        BankService.getService().addEventListner("test", new ServiceEventListner() {
//            @Override
//            public void onEvent(String name, Map params) {
//                System.out.println("从Flutter接受广播");
//            }
//        });

        final Handler handler = new Handler();
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                test();
            }
        }, 2000);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
