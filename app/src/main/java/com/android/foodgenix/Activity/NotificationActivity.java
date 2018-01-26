package com.android.foodgenix.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.widget.NestedScrollView;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.TabHost;

import com.android.foodgenix.Adapter.NotificationItemAdapter;
import com.android.foodgenix.Adapter.RewardItemAdapter;
import com.android.foodgenix.Interface.OnLoadMoreListener;
import com.android.foodgenix.Model.Comment;
import com.android.foodgenix.Model.Like;
import com.android.foodgenix.Model.Post;
import com.android.foodgenix.Model.User;
import com.android.foodgenix.Model.Voucher;

import java.util.ArrayList;

public class NotificationActivity extends AppCompatActivity {

    public RecyclerView rvItemFollowing;
    public LinearLayoutManager mLayoutManager;
    public NotificationItemAdapter nAdapter;
    public ArrayList<Like> likeList;
    protected Handler handler;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notification);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        likeList = new ArrayList<>();
        handler = new Handler();
        rvItemFollowing = (RecyclerView)findViewById(R.id.rvItemFollowing);

        rvItemFollowing.setHasFixedSize(true);


        mLayoutManager = new LinearLayoutManager(this);
        loadData();
        // use a linear layout manager
        rvItemFollowing.setLayoutManager(mLayoutManager);

        // create an Object for Adapter
        nAdapter = new NotificationItemAdapter(this,likeList, rvItemFollowing);

        // set the adapter object to the Recyclerview
        rvItemFollowing.setAdapter(nAdapter);
        //  mAdapter.notifyDataSetChanged();


        if (likeList.isEmpty()) {
            rvItemFollowing.setVisibility(View.GONE);


        } else {
            rvItemFollowing.setVisibility(View.VISIBLE);

        }

        nAdapter.setOnLoadMoreListener(new OnLoadMoreListener() {
            @Override
            public void onLoadMore() {
                //add null , so the adapter will check view_type and show progress bar at bottom
                likeList.add(null);
                nAdapter.notifyItemInserted(likeList.size() - 1);

                handler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        //   remove progress item
                        likeList.remove(likeList.size() - 1);
                        nAdapter.notifyItemRemoved(likeList.size());
                        //add items one by one
                        int start = likeList.size();
                        int end = start + 20;

                        for (int i = start + 1; i <= end; i++) {
                            User user = new User(i+"", "stevenc"+i, "Steven C", ""+(i*20), ""+(i*20), ""+(i*20), "http://foodgenix.cvwahyumulia.com/user/"+((i%9)+1)+".jpg", "", "", "");
                            Post post = new Post(user, new ArrayList<Comment>(), "", "http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg", i,"Look at this photo!!!");
                            likeList.add(new Like(user,post));
                            nAdapter.notifyItemInserted(likeList.size());
                            nAdapter.notifyDataSetChanged();
                        }
                        nAdapter.setLoaded();
                        //or you can add all at once but do not forget to call mAdapter.notifyDataSetChanged();
                    }
                }, 1000);

            }
        });


        TabHost host = (TabHost)findViewById(R.id.tabHost);
        host.setup();

        //Tab 1
        TabHost.TabSpec spec = host.newTabSpec("you");
        spec.setContent(R.id.tab1);
        spec.setIndicator("You");
        host.addTab(spec);

        //Tab 2
        spec = host.newTabSpec("following");
        spec.setContent(R.id.tab2);
        spec.setIndicator("Following");
        host.addTab(spec);

        //rvItemFollowing
        Button btnHome = (Button) findViewById(R.id.btnHome);
        Button btnExplore = (Button) findViewById(R.id.btnExplore);
        Button btnProfile = (Button) findViewById(R.id.btnProfile);
        Button btnNotification = (Button) findViewById(R.id.btnNotification);
        Button btnVoucher = (Button) findViewById(R.id.btnVoucher);



//button home
        btnHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent notificationIntent = new Intent(NotificationActivity.this,MainActivity.class);
                finish();
                startActivity(notificationIntent);
            }
        });

//button explore
        btnExplore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(NotificationActivity.this, ExploreActivity.class);
                finish();
                startActivity(i);
            }
        });

//button profile
        btnProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(NotificationActivity.this, ProfileActivity.class);
                finish();
                startActivity(i);
            }
        });

//button Notification
        btnNotification.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


            }
        });

//button voucher
        btnVoucher.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(NotificationActivity.this, RewardActivity.class);
                finish();
                startActivity(i);
            }
        });
    }
    private void loadData() {

        for (int i = 1; i <= 20; i++) {
            User user = new User(i+"", "stevenc"+i, "Steven C", ""+(i*20), ""+(i*20), ""+(i*20), "http://foodgenix.cvwahyumulia.com/user/"+((i%9)+1)+".jpg", "", "", "");
            Post post = new Post(user, new ArrayList<Comment>(), "", "http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg", i,"Look at this photo!!!");
            likeList.add(new Like(user,post));

        }

    }
}
