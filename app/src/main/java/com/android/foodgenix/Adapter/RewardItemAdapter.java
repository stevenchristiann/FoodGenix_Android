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
import com.android.foodgenix.Model.Post;
import com.android.foodgenix.Model.Voucher;
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

public class RewardItemAdapter extends RecyclerView.Adapter {
    private final int VIEW_ITEM = 1;
    private final int VIEW_PROG = 0;
    private List<Voucher> voucherList;
    // Store the context for easy access
    private Activity mContext;
    // The minimum amount of items to have below your current scroll position
    // before loading more.
    private int visibleThreshold = 5;
    private int lastVisibleItem, totalItemCount;
    private boolean loading;
    private OnLoadMoreListener onLoadMoreListener;
    // Pass in the contact array into the constructor
    public RewardItemAdapter(Activity mContext,List<Voucher> voucherList, RecyclerView recyclerView) {
        this.mContext = mContext;
        this.voucherList = voucherList;

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
                    R.layout.custom_row_reward, parent, false);

            vh = new RewardItemViewHolder(v);
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
        if (holder instanceof RewardItemViewHolder) {
            Voucher voucher= voucherList.get(position);
            Glide.with(mContext).load(voucher.getImgUrl().trim()).into(((RewardItemViewHolder)holder).ivVoucher);
            ((RewardItemViewHolder)holder).txtDescVoucher.setText(voucher.getDesc());
            ((RewardItemViewHolder)holder).txtPrice.setText(String.valueOf(voucher.getPrice())+" coins");

        } else {
            ((ProgressViewHolder) holder).progressBar.setIndeterminate(true);
        }
    }

    public void setLoaded() {
        loading = false;
    }

    @Override
    public int getItemCount() {
        return voucherList.size();
    }

    public void setOnLoadMoreListener(OnLoadMoreListener onLoadMoreListener) {
        this.onLoadMoreListener = onLoadMoreListener;
    }

    @Override
    public int getItemViewType(int position) {
        return voucherList.get(position) != null ? VIEW_ITEM : VIEW_PROG;
    }
    public static class RewardItemViewHolder extends RecyclerView.ViewHolder {
        public ImageView ivVoucher;
        public TextView txtPrice;
        public TextView txtDescVoucher;
        public Button btnFollow;
        public Voucher voucher;

        public RewardItemViewHolder(View v) {
            super(v);
            ivVoucher = (ImageView)v.findViewById(R.id.imgViewReward);
            txtPrice = (TextView)v.findViewById(R.id.txtPrice);
            txtDescVoucher = (TextView)v.findViewById(R.id.txtDescVoucher);

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