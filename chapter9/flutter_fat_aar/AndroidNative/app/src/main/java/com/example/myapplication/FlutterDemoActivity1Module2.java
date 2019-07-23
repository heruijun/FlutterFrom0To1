package com.example.myapplication;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.FrameLayout;
import io.flutter.facade.Flutter;

public class FlutterDemoActivity1Module2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        View flutterView = Flutter.createView(
                FlutterDemoActivity1Module2.this,
                getLifecycle(),
                "other"
        );
        FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT);
        addContentView(flutterView, layout);
    }
}
