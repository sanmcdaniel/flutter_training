package com.sanmcdaniel.training_flutter_krungsri

import android.content.Intent
import android.os.Bundle
import android.widget.Toast

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, "native_call").setMethodCallHandler { call, result ->
      if (call.method == "show_view") {
        val text = (call.arguments)
        if(text is String) {
          val intent = Intent(applicationContext, DetailActivity::class.java)
          intent.putExtra("content",text)
          startActivity(intent)
        }
      }


    }
  }
}
