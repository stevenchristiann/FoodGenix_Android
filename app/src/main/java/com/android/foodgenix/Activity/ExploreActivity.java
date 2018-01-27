package com.android.foodgenix.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.request.RequestOptions;
import com.android.foodgenix.Adapter.ExploreItemAdapter;
import com.android.foodgenix.Interface.OnLoadMoreListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ExploreActivity extends AppCompatActivity {


    private TextView tvEmptyView;
    private RecyclerView mRecyclerView;
    private ExploreItemAdapter mAdapter;
    private StaggeredGridLayoutManager mLayoutManager;

    private List<String> imageList;


    protected Handler handler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_explore);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);


        tvEmptyView = (TextView) findViewById(R.id.empty_view);
        mRecyclerView = (RecyclerView) findViewById(R.id.rvExplore);
        imageList = new ArrayList<String>();
        handler = new Handler();

        loadData();

        Button btnHome = (Button) findViewById(R.id.btnHome);
        Button btnExplore = (Button) findViewById(R.id.btnExplore);
        Button btnProfile = (Button) findViewById(R.id.btnProfile);
        Button btnNotification = (Button) findViewById(R.id.btnNotification);
        Button btnVoucher = (Button) findViewById(R.id.btnVoucher);



//button home
        btnHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ExploreActivity.this, MainActivity.class);
                finish();
                startActivity(i);
            }
        });

//button explore
        btnExplore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });

//button profile
        btnProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ExploreActivity.this, ProfileActivity.class);
                finish();
                startActivity(i);
            }
        });

//button Notification
        btnNotification.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent notificationIntent = new Intent(ExploreActivity.this,NotificationActivity.class);
                finish();
                startActivity(notificationIntent);

            }
        });

//button voucher
        btnVoucher.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ExploreActivity.this, RewardActivity.class);
                finish();
                startActivity(i);
            }
        });
        // use this setting to improve performance if you know that changes
        // in content do not change the layout size of the RecyclerView
        mRecyclerView.setHasFixedSize(true);

        mLayoutManager = new StaggeredGridLayoutManager(3,StaggeredGridLayoutManager.VERTICAL);

        // use a linear layout manager
        mRecyclerView.setLayoutManager(mLayoutManager);

        // create an Object for Adapter
        mAdapter = new ExploreItemAdapter(this,imageList, mRecyclerView);

        // set the adapter object to the Recyclerview
        mRecyclerView.setAdapter(mAdapter);
        //  mAdapter.notifyDataSetChanged();


        if (imageList.isEmpty()) {
            mRecyclerView.setVisibility(View.GONE);
            tvEmptyView.setVisibility(View.VISIBLE);

        } else {
            mRecyclerView.setVisibility(View.VISIBLE);
            tvEmptyView.setVisibility(View.GONE);
        }

        mAdapter.setOnLoadMoreListener(new OnLoadMoreListener() {
            @Override
            public void onLoadMore() {
                //add null , so the adapter will check view_type and show progress bar at bottom
                imageList.add(null);
                mAdapter.notifyItemInserted(imageList.size() - 1);

                handler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        //   remove progress item
                        imageList.remove(imageList.size() - 1);
                        mAdapter.notifyItemRemoved(imageList.size());
                        //add items one by one
                        int start = imageList.size();
                        int end = start + 21;

                        for (int i = start + 1; i <= end; i++) {
                            imageList.add("http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg");
                            mAdapter.notifyItemInserted(imageList.size());

                        }
                        mAdapter.setLoaded();
                        //or you can add all at once but do not forget to call mAdapter.notifyDataSetChanged();
                    }
                }, 1000);

            }
        });
        Random rand = new Random();
        String[] url = new String[3];
        for(int i=0;i<3;i++){
            url[i] = "http://foodgenix.cvwahyumulia.com/image/"+((rand.nextInt(100)%22)+1)+".jpg";
        }
        setPromoteImage(url);
    }

    private void setPromoteImage(String... url){
        ImageView ivPromote1 = (ImageView)findViewById(R.id.ivPromote1);
        ImageView ivPromote2 = (ImageView)findViewById(R.id.ivPromote2);
        ImageView ivPromote3 = (ImageView)findViewById(R.id.ivPromote3);
        Glide.with(this).load(url[0]).apply(new RequestOptions().centerCrop().diskCacheStrategy(DiskCacheStrategy.ALL)).into(ivPromote1);
        Glide.with(this).load(url[1]).apply(new RequestOptions().centerCrop().diskCacheStrategy(DiskCacheStrategy.ALL)).into(ivPromote2);
        Glide.with(this).load(url[2]).apply(new RequestOptions().centerCrop().diskCacheStrategy(DiskCacheStrategy.ALL)).into(ivPromote3);
    }

    // load initial data
    private void loadData() {

        for (int i = 1; i <= 21; i++) {
            imageList.add("http://foodgenix.cvwahyumulia.com/image/"+((i)+1)+".jpg");

        }

    }
}
