package com.example.avatar_dialog
import io.flutter.embedding.android.FlutterActivity
import android.view.View
import android.app.ActionBar

import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.os.Bundle;
class MainActivity: FlutterActivity() {
    override fun onWindowFocusChanged(hasFocus:Boolean){
        super.onWindowFocusChanged(hasFocus);

        window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_IMMERSIVE
                or View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                or View.SYSTEM_UI_FLAG_FULLSCREEN)
    }
}