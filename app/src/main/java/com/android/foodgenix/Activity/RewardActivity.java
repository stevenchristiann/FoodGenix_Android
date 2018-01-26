package com.android.foodgenix.Activity;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;
import com.android.foodgenix.Activity.R;
import com.android.foodgenix.Adapter.MyPostLinearAdapter;
import com.android.foodgenix.Adapter.RewardItemAdapter;
import com.android.foodgenix.Interface.OnLoadMoreListener;
import com.android.foodgenix.Model.Comment;
import com.android.foodgenix.Model.Post;
import com.android.foodgenix.Model.User;
import com.android.foodgenix.Model.Voucher;

import java.util.ArrayList;
import java.util.Date;

public class RewardActivity extends AppCompatActivity {
    LinearLayoutManager mLayoutManager;
    ArrayList<Voucher> voucherList;
    RecyclerView mRecyclerView;
    RewardItemAdapter rAdapter;
    protected Handler handler;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reward);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        mRecyclerView = (RecyclerView)findViewById(R.id.rvItem);
        voucherList = new ArrayList<>();
        handler = new Handler();
        Button btnHome = (Button) findViewById(R.id.btnHome);
        Button btnExplore = (Button) findViewById(R.id.btnExplore);
        Button btnProfile = (Button) findViewById(R.id.btnProfile);
        Button btnNotification = (Button) findViewById(R.id.btnNotification);
        Button btnVoucher = (Button) findViewById(R.id.btnVoucher);

        loadData();

//button home
        btnHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(RewardActivity.this, MainActivity.class);
                finish();
                startActivity(i);

            }
        });

//button explore
        btnExplore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(RewardActivity.this, ExploreActivity.class);
                finish();
                startActivity(i);
            }
        });

//button profile
        btnProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(RewardActivity.this, ProfileActivity.class);
                finish();
                startActivity(i);
            }
        });

//button Notification
        btnNotification.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent notificationIntent = new Intent(RewardActivity.this,NotificationActivity.class);
                finish();
                startActivity(notificationIntent);

            }
        });

//button voucher
        btnVoucher.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });


        TabHost host = (TabHost)findViewById(R.id.tabHost);
        host.setup();

        //Tab 1
        TabHost.TabSpec spec = host.newTabSpec("Buy Voucher");
        spec.setContent(R.id.buyvoucher);
        spec.setIndicator("Buy Voucher");
        host.addTab(spec);

        //Tab 2
        spec = host.newTabSpec("My Voucher");
        spec.setContent(R.id.myvoucher);
        spec.setIndicator("My Voucher");
        host.addTab(spec);

        TabWidget widget = host.getTabWidget();
        for(int i = 0; i < widget.getChildCount(); i++) {
            View v = widget.getChildAt(i);

            // Look for the title view to ensure this is an indicator and not a divider.
            TextView tv = (TextView)v.findViewById(android.R.id.title);
            if(tv == null) {
                continue;
            }
            v.setBackgroundResource(R.drawable.tab_indicator);
        }
        mRecyclerView.setHasFixedSize(true);

        mLayoutManager = new LinearLayoutManager(this);

        // use a linear layout manager
        mRecyclerView.setLayoutManager(mLayoutManager);

        // create an Object for Adapter
        rAdapter = new RewardItemAdapter(this,voucherList, mRecyclerView);

        // set the adapter object to the Recyclerview
        mRecyclerView.setAdapter(rAdapter);
        //  mAdapter.notifyDataSetChanged();


        if (voucherList.isEmpty()) {
            mRecyclerView.setVisibility(View.GONE);


        } else {
            mRecyclerView.setVisibility(View.VISIBLE);

        }

        rAdapter.setOnLoadMoreListener(new OnLoadMoreListener() {
            @Override
            public void onLoadMore() {
                //add null , so the adapter will check view_type and show progress bar at bottom
                voucherList.add(null);
                rAdapter.notifyItemInserted(voucherList.size() - 1);

                handler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        //   remove progress item
                        voucherList.remove(voucherList.size() - 1);
                        rAdapter.notifyItemRemoved(voucherList.size());
                        //add items one by one
                        int start = voucherList.size();
                        int end = start + 20;

                        for (int i = start + 1; i <= end; i++) {
                            voucherList.add(new Voucher("http://foodgenix.cvwahyumulia.com/voucher/"+((i%2)+1)+".jpg",2*i,"Free Rp50.000"));
                            rAdapter.notifyItemInserted(voucherList.size());
                            rAdapter.notifyDataSetChanged();
                        }
                        rAdapter.setLoaded();
                        //or you can add all at once but do not forget to call mAdapter.notifyDataSetChanged();
                    }
                }, 1000);

            }
        });
    }
    private void loadData() {

        for (int i = 1; i <= 20; i++) {
            voucherList.add(new Voucher("http://foodgenix.cvwahyumulia.com/voucher/"+((i%2)+1)+".jpg",2*i,"Free Rp25.000"));

        }

    }
}
