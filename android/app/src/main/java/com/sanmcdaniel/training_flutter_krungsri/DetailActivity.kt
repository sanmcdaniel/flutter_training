package com.sanmcdaniel.training_flutter_krungsri

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import kotlinx.android.synthetic.main.activity_detail.*

class DetailActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        val content = intent.getStringExtra("content")
        header.text = content

        sayhi_btn.setOnClickListener {
            Toast.makeText(applicationContext, content, Toast.LENGTH_LONG).show()
        }

        val toolbar = toolbar_custom as Toolbar
        setSupportActionBar(toolbar)
        supportActionBar!!.setDisplayHomeAsUpEnabled(true)
        toolbar.setNavigationOnClickListener { finish() }
    }
}
