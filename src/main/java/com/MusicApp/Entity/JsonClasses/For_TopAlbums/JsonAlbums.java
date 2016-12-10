package com.MusicApp.Entity.JsonClasses.For_TopAlbums;

import com.google.gson.annotations.SerializedName;

public class JsonAlbums {
    @SerializedName("topalbums")
    private TopAlbum topAlbums;

    public JsonAlbums(){}

    public TopAlbum getTopAlbums() {
        return topAlbums;
    }

    public void setTopAlbums(TopAlbum topAlbums) {
        this.topAlbums = topAlbums;
    }
}
