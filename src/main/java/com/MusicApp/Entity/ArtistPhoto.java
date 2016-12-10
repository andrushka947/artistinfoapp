package com.MusicApp.Entity;

import javax.persistence.*;

@Entity
@Table(name = "ArtistPhotos")
public class ArtistPhoto {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private long id;

    @OneToOne()
    @JoinColumn(name = "artist_id")
    private MusicArtist musicArtist;

    @Column(name = "path")
    private String path;

    public ArtistPhoto() {}

    public ArtistPhoto(MusicArtist musicArtist, String path) {
        this.musicArtist = musicArtist;
        this.path = path;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setContext(String path) {
        this.path = path;
    }

    public MusicArtist getMusicArtist() {
        return musicArtist;
    }

    public void setMusicArtist(MusicArtist musicArtist) {
        this.musicArtist = musicArtist;
    }

}
