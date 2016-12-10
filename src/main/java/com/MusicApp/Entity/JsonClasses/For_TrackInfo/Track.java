package com.MusicApp.Entity.JsonClasses.For_TrackInfo;

public class Track {

    private String name;

    private Album album;

    public Track() {}

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
