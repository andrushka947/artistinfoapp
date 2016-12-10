package com.MusicApp.Repositories;

import com.MusicApp.Entity.CustomUser;
import com.MusicApp.Entity.MusicArtist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ArtistRepository extends JpaRepository<MusicArtist, Long> {

    @Query("SELECT a FROM MusicArtist a")
    List<MusicArtist> getAllArtists();

    @Query("SELECT a FROM MusicArtist a WHERE a.name = :name")
    MusicArtist getArtistByName(@Param("name")String name);

    @Query("SELECT a FROM MusicArtist a WHERE a.user = :user")
    List<MusicArtist> getArtistsByUser(@Param("user")CustomUser user);

}
