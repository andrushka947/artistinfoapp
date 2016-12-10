package com.MusicApp.Entity.JsonClasses.For_TopTracks;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.annotations.SerializedName;

public class Image {
    private String size;

    @SerializedName("#text")
    private String url;

    public Image(){}

    public Image(String url, String size) {
        this.size = size;
        this.url = url;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @JsonProperty("#text")
    public String getUrl() {
        return url;
    }

    @JsonProperty("#text")
    public void setUrl(String url) {
        this.url = url;
    }
}
