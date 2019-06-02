//package com.example.crash.flutter_crash_report;
//
//import android.app.Activity;
//import android.os.Bundle;
//import io.fabric.sdk.android.Fabric;
//import com.crashlytics.android.Crashlytics;
//
//public class CrashActivity extends Activity {
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
//        super.onCreate(savedInstanceState);
//        Fabric.with(this, new Crashlytics());
//
//        throw (FlutterException) getIntent().getSerializableExtra("exception");
//
//    }
//}
