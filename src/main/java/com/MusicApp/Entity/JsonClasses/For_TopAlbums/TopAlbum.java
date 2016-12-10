package com.MusicApp.Entity.JsonClasses.For_TopAlbums;

import com.MusicApp.Entity.JsonClasses.For_TopAlbums.Album;

public class TopAlbum {
    private Album[] album;

    public TopAlbum(){}

    public Album[] getAlbum() {
        return album;
    }

    public void setAlbum(Album[] album) {
        this.album = album;
    }
}
