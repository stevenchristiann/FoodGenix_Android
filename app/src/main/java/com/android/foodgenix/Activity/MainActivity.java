package com.android.foodgenix.Activity;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.TextView;

import com.android.foodgenix.Adapter.MyPostLinearAdapter;
import com.android.foodgenix.Interface.OnLoadMoreListener;
import com.android.foodgenix.Model.Comment;
import com.android.foodgenix.Model.Post;
import com.android.foodgenix.Model.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    public static final int PICK_IMAGE = 1;
    private TextView tvEmptyView;
    private RecyclerView mRecyclerView;
    private MyPostLinearAdapter mAdapter;
    private LinearLayoutManager mLayoutManager;

    private Button btnAdd;
    private Button btnHome;
    private Button btnExplore;
    private Button btnProfile;
    private Button btnNotification;
    private Button btnVoucher;

    private List<Post> homeList;


    // Store the context for easy access
    private Context mContext;


    protected Handler handler;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        tvEmptyView = (TextView) findViewById(R.id.empty_view);
        mRecyclerView = (RecyclerView) findViewById(R.id.rvItemHome);
        homeList = new ArrayList<Post>();
        handler = new Handler();

        btnAdd = (Button) findViewById(R.id.btnAdd);
        btnHome = (Button) findViewById(R.id.btnHome);
        btnExplore = (Button) findViewById(R.id.btnExplore);
        btnProfile = (Button) findViewById(R.id.btnProfile);
        btnNotification = (Button) findViewById(R.id.btnNotification);
        btnVoucher = (Button) findViewById(R.id.btnVoucher);

        loadData();

        //button add photo
        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (checkSelfPermission(android.Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) {
                    openGallery();
                }
                else
                {
                    ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.READ_EXTERNAL_STORAGE}, 123);
                }
            }
        });

        //button home
        btnHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
            }
        });

        //button explore
        btnExplore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, ExploreActivity.class);
                finish();
                startActivity(i);
            }
        });

        //button profile
        btnProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, ProfileActivity.class);
                finish();
                startActivity(i);
            }
        });

        //button Notification
        btnNotification.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent notificationIntent = new Intent(MainActivity.this,NotificationActivity.class);
                finish();
                startActivity(notificationIntent);

            }
        });

        //button voucher
        btnVoucher.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, RewardActivity.class);
                finish();
                startActivity(i);
            }
        });
        // use this setting to improve performance if you know that changes
        // in content do not change the layout size of the RecyclerView
        mRecyclerView.setHasFixedSize(true);

        mLayoutManager = new LinearLayoutManager(this);

        // use a linear layout manager
        mRecyclerView.setLayoutManager(mLayoutManager);

        // create an Object for Adapter
        mAdapter = new MyPostLinearAdapter(this,homeList, mRecyclerView);

        // set the adapter object to the Recyclerview
        mRecyclerView.setAdapter(mAdapter);
        //  mAdapter.notifyDataSetChanged();


        if (homeList.isEmpty()) {
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
                homeList.add(null);
                mAdapter.notifyItemInserted(homeList.size() - 1);

                handler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        //   remove progress item
                        homeList.remove(homeList.size() - 1);
                        mAdapter.notifyItemRemoved(homeList.size());
                        //add items one by one
                        int start = homeList.size();
                        int end = start + 20;

                        for (int i = start + 1; i <= end; i++) {
                            ArrayList<Comment> coms = new ArrayList<>();
                            coms.add(new Comment(new User("1", "endangSetyati"+i, "Endang Setyati", "120", "355", "350","http://foodgenix.cvwahyumulia.com/user/"+((i%8)+2)+".jpg", "", "12", "Yes"), "Bagus Juga lumayan",new Date()));
                            homeList.add(new Post(new User("1", "endangSetyati"+i, "Endang Setyati", "120", "355", "350","http://foodgenix.cvwahyumulia.com/user/"+((i%8)+2)+".jpg", "", "12", "Yes"), coms, "Surabaya","http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg", i*2,"Ini Post ku yang ke "+i));
                            mAdapter.notifyItemInserted(homeList.size());
                            mAdapter.notifyDataSetChanged();
                        }
                        mAdapter.setLoaded();
                        //or you can add all at once but do not forget to call mAdapter.notifyDataSetChanged();
                    }
                }, 2000);

            }
        });

    }
    public void openGallery()
    {
        Intent getIntent = new Intent(Intent.ACTION_GET_CONTENT);
        getIntent.setType("image/*");

        Intent pickIntent = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
        pickIntent.setType("image/*");

        Intent chooserIntent = Intent.createChooser(getIntent, "Select Image");
        chooserIntent.putExtra(Intent.EXTRA_INITIAL_INTENTS, new Intent[] {pickIntent});

        startActivityForResult(chooserIntent, PICK_IMAGE);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data)
    {
        if (resultCode == RESULT_OK && requestCode == PICK_IMAGE) {
            //TODO: action
            Uri photoUrl = data.getData();
            Intent i = new Intent(this, ShareActivity.class);
            i.putExtra("photoUrl", photoUrl.toString());
            startActivity(i);
        }
    }

    // load initial data
    private void loadData() {

        for (int i = 1; i <= 20; i++) {
            ArrayList<Comment> coms = new ArrayList<>();
            coms.add(new Comment(new User("1", "user"+i, "User New", "120", "355", "350","http://foodgenix.cvwahyumulia.com/user/"+((i%8)+2)+".jpg", "", "12", "Yes"), "Bagus Juga lumayan",new Date()));
            homeList.add(new Post(new User("1", "user"+i, "User New", "120", "355", "350","http://foodgenix.cvwahyumulia.com/user/"+((i%8)+2)+".jpg", "", "12", "Yes"), coms, "Surabaya","http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg", i*2,"Ini Post ku yang ke "+i));

        }

    }




}
