package com.MusicApp.Entity.JsonClasses.For_TopTracks;

public class Track {

    private String name;

    private String url;

    private Image[] image;

    public Track(){}

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

}
