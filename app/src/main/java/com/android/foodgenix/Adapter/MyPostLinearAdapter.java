package com.android.foodgenix.Adapter;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.android.foodgenix.Activity.CommentActivity;
import com.android.foodgenix.Activity.R;
import com.android.foodgenix.Interface.OnLoadMoreListener;
import com.android.foodgenix.Model.Post;
import com.bumptech.glide.Glide;
import com.bumptech.glide.request.RequestOptions;

import java.util.List;
/**
 * Created by MyLaptop on 11/1/2017.
 */

public class MyPostLinearAdapter extends RecyclerView.Adapter {
    private final int VIEW_ITEM = 1;
    private final int VIEW_PROG = 0;
    private List<Post> postList;
    // Store the context for easy access
    private Activity mContext;
    // The minimum amount of items to have below your current scroll position
    // before loading more.
    private int visibleThreshold = 5;
    private int lastVisibleItem, totalItemCount;
    private boolean loading;
    private OnLoadMoreListener onLoadMoreListener;
    // Pass in the contact array into the constructor
    public MyPostLinearAdapter(Activity mContext,List<Post> postList, RecyclerView recyclerView) {
        this.mContext = mContext;
        this.postList = postList;

        if (recyclerView.getLayoutManager() instanceof LinearLayoutManager) {

            final LinearLayoutManager gridLayoutManager = (LinearLayoutManager) recyclerView
                    .getLayoutManager();


            recyclerView
                    .addOnScrollListener(new RecyclerView.OnScrollListener() {
                        @Override
                        public void onScrolled(RecyclerView recyclerView,
                                               int dx, int dy) {
                            super.onScrolled(recyclerView, dx, dy);

                            totalItemCount = gridLayoutManager.getItemCount();
                            lastVisibleItem = gridLayoutManager.findLastVisibleItemPosition();

                            if (!loading
                                    && totalItemCount <= (lastVisibleItem + visibleThreshold)) {
                                // End has been reached
                                // Do something
                                if (onLoadMoreListener != null) {
                                    onLoadMoreListener.onLoadMore();
                                }
                                loading = true;
                            }
                        }
                    });
        }
    }
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent,int viewType) {
        RecyclerView.ViewHolder vh;
        if (viewType == VIEW_ITEM) {

            View v = LayoutInflater.from(parent.getContext()).inflate(
                    R.layout.item_mypost_layout, parent, false);

            vh = new MyPostLinearViewHolder(v);
        } else {
            View v = LayoutInflater.from(parent.getContext()).inflate(
                    R.layout.progressbar, parent, false);

            vh = new ProgressViewHolder(v);
        }
        return vh;
    }
    @SuppressLint("ResourceAsColor")
    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (holder instanceof MyPostLinearViewHolder) {
            Post post= postList.get(position);
            Glide.with(mContext).load(post.getUserPosted().getPhoto_url().trim()).apply(new RequestOptions().circleCrop()).into(((MyPostLinearViewHolder)holder).profilePicture);
            ((MyPostLinearViewHolder)holder).userName.setText(post.getUserPosted().getUsername());
            Glide.with(mContext).load(post.getImg().trim()).into(((MyPostLinearViewHolder)holder).img);
            String status = "<b>"+post.getUserPosted().getUsername()+"</b> "+post.getCaption();
            ((MyPostLinearViewHolder)holder).status.setText(Html.fromHtml(status));
            ((MyPostLinearViewHolder)holder).totalLike.setText(post.getTotalLike()+" Likes");
            ((MyPostLinearViewHolder)holder).txtUname.setText(post.getComments().get(0).getUser().getUsername());
            ((MyPostLinearViewHolder)holder).txtComment.setText(post.getComments().get(0).getTxtComment());
            ((MyPostLinearViewHolder)holder).btnShare.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Toast.makeText(mContext, "Share Picture coming soon...", Toast.LENGTH_SHORT).show();
                }
            });
            ((MyPostLinearViewHolder)holder).btnComment.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Toast.makeText(mContext, "Comment Picture coming soon...", Toast.LENGTH_SHORT).show();
                    Intent commentIntent = new Intent(mContext, CommentActivity.class);
                    mContext.startActivity(commentIntent);
                }
            });
            ((MyPostLinearViewHolder)holder).btnUnlike.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Toast.makeText(mContext, "Like Picture coming soon...", Toast.LENGTH_SHORT).show();
                }
            });

        } else {
            ((ProgressViewHolder) holder).progressBar.setIndeterminate(true);
        }
    }

    public void setLoaded() {
        loading = false;
    }

    @Override
    public int getItemCount() {
        return postList.size();
    }

    public void setOnLoadMoreListener(OnLoadMoreListener onLoadMoreListener) {
        this.onLoadMoreListener = onLoadMoreListener;
    }

    @Override
    public int getItemViewType(int position) {
        return postList.get(position) != null ? VIEW_ITEM : VIEW_PROG;
    }
    public static class MyPostLinearViewHolder extends RecyclerView.ViewHolder {
        public ImageView profilePicture;
        public TextView userName;
        public TextView location;
        public ImageView img;
        public TextView status;
        public TextView totalLike;
        public TextView txtUname;
        public TextView txtComment;
        public ImageButton btnUnlike,btnComment,btnShare;
        public Post post;

        public MyPostLinearViewHolder(View v) {
            super(v);
            profilePicture = (ImageView)v.findViewById(R.id.profilePicture);
            userName= (TextView)v.findViewById(R.id.userName);
            location= (TextView)v.findViewById(R.id.location);
            img= (ImageView)v.findViewById(R.id.img);
            status= (TextView)v.findViewById(R.id.status);
            totalLike= (TextView)v.findViewById(R.id.totalLike);
            txtUname= (TextView)v.findViewById(R.id.txtUname);
            txtComment= (TextView)v.findViewById(R.id.txtComment);
            btnUnlike = (ImageButton)v.findViewById(R.id.btnUnlike);
            btnComment = (ImageButton)v.findViewById(R.id.btnComment);
            btnShare = (ImageButton)v.findViewById(R.id.btnShare);
        }
    }
    public static class ProgressViewHolder extends RecyclerView.ViewHolder {
        public ProgressBar progressBar;

        public ProgressViewHolder(View v) {
            super(v);
            progressBar = (ProgressBar) v.findViewById(R.id.progressBar1);
        }
    }

}