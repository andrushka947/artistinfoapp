package com.MusicApp.Entity.JsonClasses.LyricsClasses.TrackId;

import com.google.gson.annotations.SerializedName;

public class Track {

    @SerializedName("track_id")
    private int id;

    public Track() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
