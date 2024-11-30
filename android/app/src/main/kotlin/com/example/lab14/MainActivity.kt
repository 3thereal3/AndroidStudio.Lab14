package com.example.lab14

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.example.native_camera_app/hello"
        ).setMethodCallHandler { call, result ->
            if (call.method == "getHelloMessage") {
                result.success("Hi, Mom!")
            } else {
                result.notImplemented()
            }
        }
    }
}
