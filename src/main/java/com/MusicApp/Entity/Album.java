package com.MusicApp.Entity;

import javax.persistence.*;

@Entity
@Table(name = "Top_albums")
public class Album {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "name")
    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "artist_id")
    private MusicArtist musicArtist;

    public Album() {}

    public Album(String name, MusicArtist musicArtist) {
        this.name = name;
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
}
