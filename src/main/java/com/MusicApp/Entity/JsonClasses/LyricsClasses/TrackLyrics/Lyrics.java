package com.MusicApp.Entity.JsonClasses.LyricsClasses.TrackLyrics;

import com.google.gson.annotations.SerializedName;

public class Lyrics {

    @SerializedName(value = "lyrics_id")
    private String id;

    @SerializedName(value = "lyrics_body")
    private String body;

    public Lyrics () {}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
