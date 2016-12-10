package com.MusicApp.ServiceImplAndService;


import com.MusicApp.Entity.CustomUser;
import com.MusicApp.Entity.MusicArtist;

import java.util.List;

public interface ArtistService {
    void addArtist(MusicArtist musicArtist);
    List<MusicArtist> getAllArtists();
    MusicArtist getArtistByName(String name);
    MusicArtist getArtistById(long id);
    List<MusicArtist> getArtistsByUser(CustomUser user);
    void delete(MusicArtist musicArtist);
    void delete(long id);
}
