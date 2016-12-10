package com.MusicApp.Entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "MusicArtists")
public class MusicArtist {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false)
    private long id;

    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private CustomUser user;

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "musicArtist")
    private ArtistPhoto photo;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "musicArtist")
    //@JoinColumn(name = "top_albums")
    private List<Album> topAlbums;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "musicArtist")
    //@JoinColumn(name = "top_tracks")
    private List<Track> topTracks;

    private String url;

    @Column(length = 3000)
    private String summary;

    public MusicArtist() {}

    public MusicArtist(String name, ArtistPhoto photo, String url, String summary) {
        this.name = name;
        this.photo = photo;
        this.summary = summary;
        this.url = url;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArtistPhoto getPhoto() {
        return photo;
    }

    public void setPhoto(ArtistPhoto photo) {
        this.photo = photo;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public CustomUser getUser() {
        return user;
    }

    public void setUser(CustomUser customUser) {
        this.user = customUser;
    }

    public List<Album> getTopAlbums() {
        return topAlbums;
    }

    public void setTopAlbums(List<Album> topAlbums) {
        this.topAlbums = topAlbums;
    }

    public List<Track> getTopTracks() {
        return topTracks;
    }

    public void setTopTracks(List<Track> topTracks) {
        this.topTracks = topTracks;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
