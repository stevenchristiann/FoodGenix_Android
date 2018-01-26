package com.android.foodgenix.Activity;

import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.request.RequestOptions;

import java.io.File;

public class ShareActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_share);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);


        ImageView imgView = (ImageView)findViewById(R.id.uploadedImage);
        TextView shareBtn = (TextView)findViewById(R.id.btnShare);
        TextView txtTag = (TextView)findViewById(R.id.tagPeople);
        TextView txtLocation = (TextView)findViewById(R.id.addLocation);
        Button backBtn = (Button)findViewById(R.id.btnBack);

        Uri data= Uri.parse(getIntent().getStringExtra("photoUrl"));
        Glide.with(this).load(data).into(imgView);

        shareBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(ShareActivity.this, "Share picture coming soon...", Toast.LENGTH_SHORT).show();
            }
        });

        txtLocation.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(ShareActivity.this, "Add location coming soon...", Toast.LENGTH_SHORT).show();
            }
        });

        txtTag.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(ShareActivity.this, "Tag people coming soon...", Toast.LENGTH_SHORT).show();
            }
        });

        backBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}
