package com.MusicApp.Entity;

import javax.persistence.*;

@Entity
@Table(name = "Top_tracks")
public class Track {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private long id;

    private String name;

    @Column(length = 400)
    private String lyrics;

    private String album_url;

    private String album_title;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "artist_id")
    private MusicArtist musicArtist;

    public Track() {}

    public Track(String name, String lyrics, String album_url, MusicArtist musicArtist) {
        this.name = name;
        this.lyrics = lyrics;
        this.album_url = album_url;
        this.musicArtist = musicArtist;
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

    public MusicArtist getMusicArtist() {
        return musicArtist;
    }

    public void setMusicArtist(MusicArtist musicArtist) {
        this.musicArtist = musicArtist;
    }

    public String getLyrics() {
        return lyrics;
    }

    public void setLyrics(String lyrics) {
        this.lyrics = lyrics;
    }

    public String getAlbum_url() {
        return album_url;
    }

    public void setAlbum_url(String album_url) {
        this.album_url = album_url;
    }

    public String getAlbum_title() {
        return album_title;
    }

    public void setAlbum_title(String album_title) {
        this.album_title = album_title;
    }



}
