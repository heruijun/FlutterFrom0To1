package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    // 跳转到Flutter模块1
    public void toModule1(View view) {
        Intent intent = new Intent(this, FlutterDemoActivity1Module1.class);
        startActivity(intent);
    }

    // 跳转到Flutter模块2
    public void toModule2(View view) {
        Intent intent = new Intent(this, FlutterDemoActivity1Module2.class);
        startActivity(intent);
    }

    // 跳转到原生界面
    public void toNormal(View view) {
        Intent intent = new Intent(this, NormalActivity.class);
        startActivity(intent);
    }
}