package com.MusicApp.Entity.JsonClasses.For_ArtistGeneral;

import com.MusicApp.Entity.JsonClasses.For_TopTracks.Image;

public class Artist {

    private String name;

    private String url;

    private Image[] image;

    private Bio bio;

    public Artist(){}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Image[] getImage() {
        return image;
    }

    public void setImage(Image[] image) {
        this.image = image;
    }

    public Bio getBio() {
        return bio;
    }

    public void setBio(Bio bio) {
        this.bio = bio;
    }

}
