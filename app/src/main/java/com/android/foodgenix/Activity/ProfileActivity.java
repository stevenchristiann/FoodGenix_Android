package com.android.foodgenix.Activity;

import android.content.Intent;
import android.os.Handler;
import android.support.v4.widget.NestedScrollView;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.TabHost;
import android.widget.TabWidget;
import android.widget.TextView;
import android.widget.Toast;

import com.android.foodgenix.Activity.R;
import com.android.foodgenix.Adapter.ExploreItemAdapter;
import com.android.foodgenix.Adapter.LikedPostAdapter;
import com.android.foodgenix.Adapter.MyPostGridAdapter;
import com.android.foodgenix.Adapter.MyPostLinearAdapter;
import com.android.foodgenix.Interface.OnLoadMoreListener;
import com.android.foodgenix.Model.Comment;
import com.android.foodgenix.Model.Post;
import com.android.foodgenix.Model.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import es.dmoral.toasty.Toasty;

public class ProfileActivity extends AppCompatActivity {
    private RecyclerView mRecyclerView1, mRecyclerView2, mRecyclerView3;
    private MyPostGridAdapter mAdapter;
    private LikedPostAdapter lAdapter;
    private MyPostLinearAdapter pAdapter;
    private StaggeredGridLayoutManager mLayoutManager;
    private LinearLayoutManager mLayoutManager2;
    private StaggeredGridLayoutManager mLayoutManager1;
    private List<String> imageList1, imageList3;
    private List<Post> postList;
    private TextView tvFollower, tvFollowing;
    private NestedScrollView nestedSV;
    protected Handler handler;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        final User myUser = new User("1", "johnKoe", "John Koe", "120", "355", "350","http://foodgenix.cvwahyumulia.com/user/1.jpg", "", "12", "Yes");
        tvFollower = (TextView)findViewById(R.id.follower);
        tvFollowing= (TextView)findViewById(R.id.following);
        tvFollower.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toasty.error(ProfileActivity.this, "Follower list coming soon...", Toast.LENGTH_LONG, true).show();
            }
        });
        tvFollowing.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toasty.error(ProfileActivity.this, "Following list coming soon...", Toast.LENGTH_LONG, true).show();
            }
        });
        TabHost host = (TabHost)findViewById(R.id.tabHost);
        host.setOnTabChangedListener(new TabHost.OnTabChangeListener() {
            @Override
            public void onTabChanged(String s) {
                nestedSV.smoothScrollTo(0,0);
            }
        });
        host.setup();
        nestedSV = (NestedScrollView)findViewById(R.id.nestedSV);

        //Tab 1
        TabHost.TabSpec spec = host.newTabSpec("grid");
        spec.setContent(R.id.grid);
        spec.setIndicator("", getResources().getDrawable(R.drawable.grid));
        host.addTab(spec);

        //Tab 2
        spec = host.newTabSpec("list");
        spec.setContent(R.id.list);
        spec.setIndicator("", getResources().getDrawable(R.drawable.list));
        host.addTab(spec);

        //Tab 3
        spec = host.newTabSpec("love");
        spec.setContent(R.id.loved);
        spec.setIndicator("", getResources().getDrawable(R.drawable.love));
        host.addTab(spec);

        TabWidget widget = host.getTabWidget();
        for(int i = 0; i < widget.getChildCount(); i++) {
            View v = widget.getChildAt(i);

            // Look for the title view to ensure this is an indicator and not a divider.
            TextView tv = (TextView)v.findViewById(R.id.title);
            if(tv == null) {
                continue;
            }
            v.setBackgroundResource(R.drawable.tab_indicator);
        }
        mRecyclerView1 = (RecyclerView) findViewById(R.id.rvItem);
        mRecyclerView3 = (RecyclerView) findViewById(R.id.rvItem2);
        mRecyclerView2 = (RecyclerView) findViewById(R.id.rvItem1);
        imageList1 = new ArrayList<String>();
        imageList3 = new ArrayList<String>();
        postList = new ArrayList<Post>();
        handler = new Handler();

        loadData();
        loadLikedData();
        loadPost(myUser);


        Button btnHome = (Button) findViewById(R.id.btnHome);
        Button btnExplore = (Button) findViewById(R.id.btnExplore);
        Button btnProfile = (Button) findViewById(R.id.btnProfile);
        Button btnNotification = (Button) findViewById(R.id.btnNotification);
        Button btnVoucher = (Button) findViewById(R.id.btnVoucher);



//button home
        btnHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ProfileActivity.this, MainActivity.class);
                finish();
                startActivity(i);

            }
        });

//button explore
        btnExplore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ProfileActivity.this, ExploreActivity.class);
                finish();
                startActivity(i);
            }
        });

//button profile


//button Notification
        btnNotification.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent notificationIntent = new Intent(ProfileActivity.this,NotificationActivity.class);
                finish();
                startActivity(notificationIntent);

            }
        });

//button voucher
        btnVoucher.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ProfileActivity.this, RewardActivity.class);
                finish();
                startActivity(i);
            }
        });

        Button btnOption = (Button) findViewById(R.id.btnOption);
        btnOption.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toasty.error(ProfileActivity.this, "User option coming soon...", Toast.LENGTH_LONG, true).show();
            }
        });
        // use this setting to improve performance if you know that changes
        // in content do not change the layout size of the RecyclerView
        mRecyclerView1.setHasFixedSize(true);
        mRecyclerView3.setHasFixedSize(true);
        mRecyclerView2.setHasFixedSize(true);

        mLayoutManager = new StaggeredGridLayoutManager(3,StaggeredGridLayoutManager.VERTICAL);
        mLayoutManager1 = new StaggeredGridLayoutManager(3,StaggeredGridLayoutManager.VERTICAL);
        mLayoutManager2 = new LinearLayoutManager(this);

        // use a linear layout manager
        mRecyclerView1.setLayoutManager(mLayoutManager);
        mRecyclerView1.setNestedScrollingEnabled(false);

        mRecyclerView3.setLayoutManager(mLayoutManager1);
        mRecyclerView3.setNestedScrollingEnabled(false);


        mRecyclerView2.setLayoutManager(mLayoutManager2);
        mRecyclerView2.setNestedScrollingEnabled(false);

        // create an Object for Adapter
        mAdapter = new MyPostGridAdapter(this,imageList1, mRecyclerView1);
        lAdapter = new LikedPostAdapter(this,imageList3, mRecyclerView3);
        pAdapter = new MyPostLinearAdapter(this,postList,mRecyclerView2);

        // set the adapter object to the Recyclerview
        mRecyclerView1.setAdapter(mAdapter);
        mRecyclerView3.setAdapter(lAdapter);
        mRecyclerView2.setAdapter(pAdapter);
        //  mAdapter.notifyDataSetChanged();


        if (imageList1.isEmpty()) {
            mRecyclerView1.setVisibility(View.GONE);
            //tvEmptyView.setVisibility(View.VISIBLE);

        } else {
            mRecyclerView1.setVisibility(View.VISIBLE);
            //tvEmptyView.setVisibility(View.GONE);
        }
        if (imageList3.isEmpty()) {
            mRecyclerView3.setVisibility(View.GONE);
            //tvEmptyView.setVisibility(View.VISIBLE);

        } else {
            mRecyclerView3.setVisibility(View.VISIBLE);
            //tvEmptyView.setVisibility(View.GONE);
        }
        if (postList.isEmpty()) {
            mRecyclerView2.setVisibility(View.GONE);
            //tvEmptyView.setVisibility(View.VISIBLE);

        } else {
            mRecyclerView2.setVisibility(View.VISIBLE);
            //tvEmptyView.setVisibility(View.GONE);
        }
        mAdapter.setOnLoadMoreListener(new OnLoadMoreListener() {
            @Override
            public void onLoadMore() {
                //add null , so the adapter will check view_type and show progress bar at bottom
                imageList1.add(null);
                mAdapter.notifyItemInserted(imageList1.size() - 1);

                handler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        //   remove progress item
                        imageList1.remove(imageList1.size() - 1);
                        mAdapter.notifyItemRemoved(imageList1.size());
                        //add items one by one
                        int start = imageList1.size();
                        int end = start + 21;

                        for (int i = start + 1; i <= end; i++) {
                            imageList1.add("http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg");
                            mAdapter.notifyItemInserted(imageList1.size());

                        }
                        mAdapter.setLoaded();
                        //or you can add all at once but do not forget to call mAdapter.notifyDataSetChanged();
                    }
                }, 1000);

            }
        });

        lAdapter.setOnLoadMoreListener(new OnLoadMoreListener() {
            @Override
            public void onLoadMore() {
                //add null , so the adapter will check view_type and show progress bar at bottom
                imageList3.add(null);
                lAdapter.notifyItemInserted(imageList3.size() - 1);

                handler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        //   remove progress item
                        imageList3.remove(imageList3.size() - 1);
                        lAdapter.notifyItemRemoved(imageList3.size());
                        //add items one by one
                        int start = imageList3.size();
                        int end = start + 21;

                        for (int i = end; i >= start + 1; i--) {
                            imageList3.add("http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg");
                            lAdapter.notifyItemInserted(imageList3.size());

                        }
                        lAdapter.setLoaded();
                        //or you can add all at once but do not forget to call mAdapter.notifyDataSetChanged();
                    }
                }, 1000);

            }
        });

        pAdapter.setOnLoadMoreListener(new OnLoadMoreListener() {
            @Override
            public void onLoadMore() {
                //add null , so the adapter will check view_type and show progress bar at bottom
                postList.add(null);
                pAdapter.notifyItemInserted(postList.size() - 1);

                handler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        //   remove progress item
                        postList.remove(postList.size() - 1);
                        pAdapter.notifyItemRemoved(postList.size());
                        //add items one by one
                        int start = postList.size();
                        int end = start + 21;

                        for (int i = end; i >= start + 1; i--) {
                            ArrayList<Comment> coms = new ArrayList<>();
                            coms.add(new Comment(myUser, "Bagus Juga lumayan",new Date()));
                            postList.add(new Post(new User("1", "endangSetyati"+i, "Endang Setyati", "120", "355", "350","http://foodgenix.cvwahyumulia.com/user/"+((i%9)+1)+".jpg", "", "12", "Yes"), coms, "Surabaya","http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg", i*2,"Ini Post ku yang ke "+i));
                            pAdapter.notifyItemInserted(postList.size());

                        }
                        pAdapter.setLoaded();
                        //or you can add all at once but do not forget to call mAdapter.notifyDataSetChanged();
                    }
                }, 1000);

            }
        });
        //nestedSV.smoothScrollTo(0,0);
    }
    private void loadData() {

        for (int i = 1; i <= 21; i++) {
            imageList1.add("http://foodgenix.cvwahyumulia.com/image/"+((i)+1)+".jpg");

        }

    }
    private void loadLikedData() {

        for (int i = 21; i >= 1; i--) {
            imageList3.add("http://foodgenix.cvwahyumulia.com/image/"+((i)+1)+".jpg");

        }

    }

    private void loadPost(User myUser) {

        for (int i = 21; i >= 1; i--) {
            ArrayList<Comment> coms = new ArrayList<>();
            coms.add(new Comment(myUser, "Bagus Juga lumayan",new Date()));
            postList.add(new Post(new User("1", "endangSetyati"+i, "Endang Setyati", "120", "355", "350","http://foodgenix.cvwahyumulia.com/user/"+((i%9)+1)+".jpg", "", "12", "Yes"), coms, "Surabaya","http://foodgenix.cvwahyumulia.com/image/"+((i%22)+1)+".jpg", i*2,"Ini Post ku yang ke "+i));

        }

    }

}
