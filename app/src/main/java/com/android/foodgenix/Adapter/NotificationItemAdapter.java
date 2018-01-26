
package com.android.foodgenix.Adapter;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.media.Image;
import android.net.Uri;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.android.foodgenix.Activity.ShareActivity;
import com.android.foodgenix.Model.Like;
import com.android.foodgenix.Model.Post;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.request.RequestOptions;
import com.android.foodgenix.Interface.OnLoadMoreListener;

import org.w3c.dom.Text;

import java.net.URI;
import java.util.List;
import com.android.foodgenix.Activity.R;
/**
 * Created by MyLaptop on 11/1/2017.
 */

public class NotificationItemAdapter extends RecyclerView.Adapter {
    private final int VIEW_ITEM = 1;
    private final int VIEW_PROG = 0;
    private List<Like> likeList;
    // Store the context for easy access
    private Activity mContext;
    // The minimum amount of items to have below your current scroll position
    // before loading more.
    private int visibleThreshold = 5;
    private int lastVisibleItem, totalItemCount;
    private boolean loading;
    private OnLoadMoreListener onLoadMoreListener;
    // Pass in the contact array into the constructor
    public NotificationItemAdapter(Activity mContext,List<Like> likeList, RecyclerView recyclerView) {
        this.mContext = mContext;
        this.likeList = likeList;

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
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        RecyclerView.ViewHolder vh;
        if (viewType == VIEW_ITEM) {

            View v = LayoutInflater.from(parent.getContext()).inflate(
                    R.layout.item_you_layout, parent, false);

            vh = new NotificationItemViewHolder(v);
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
        if (holder instanceof NotificationItemViewHolder) {
            Like like= likeList.get(position);
            Glide.with(mContext).load(like.getUser().getPhoto_url().trim()).apply(new RequestOptions().circleCrop()).into(((NotificationItemViewHolder)holder).ivProf);
            Glide.with(mContext).load(like.getPost().getImg().trim()).apply(new RequestOptions().centerCrop()).into(((NotificationItemViewHolder)holder).ivTarget);
            String htmlString = "<b>"+like.getUser().getUsername()+"</b> has liked your photo.";
            ((NotificationItemViewHolder)holder).txtNotif.setText(Html.fromHtml(htmlString));

        } else {
            ((ProgressViewHolder) holder).progressBar.setIndeterminate(true);
        }
    }

    public void setLoaded() {
        loading = false;
    }

    @Override
    public int getItemCount() {
        return likeList.size();
    }

    public void setOnLoadMoreListener(OnLoadMoreListener onLoadMoreListener) {
        this.onLoadMoreListener = onLoadMoreListener;
    }

    @Override
    public int getItemViewType(int position) {
        return likeList.get(position) != null ? VIEW_ITEM : VIEW_PROG;
    }
    public static class NotificationItemViewHolder extends RecyclerView.ViewHolder {
        public Like like;
        public TextView txtNotif;
        public ImageView ivProf;
        public ImageView ivTarget;
        public NotificationItemViewHolder(View v) {
            super(v);
            txtNotif = (TextView)v.findViewById(R.id.txtNotif);
            ivProf = (ImageView)v.findViewById(R.id.profilePicture);
            ivTarget = (ImageView)v.findViewById(R.id.ivTarget);
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