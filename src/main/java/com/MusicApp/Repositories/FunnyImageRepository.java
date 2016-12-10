package com.MusicApp.Repositories;

import com.MusicApp.Entity.FunnyImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FunnyImageRepository extends JpaRepository<FunnyImage, Long> {

    @Query("SELECT i FROM FunnyImage i")
    List<FunnyImage> getAllImages();

    @Query("SELECT i FROM FunnyImage i WHERE i.id = :id")
    FunnyImage getPhotoById(long id);

    @Query("SELECT i FROM FunnyImage i WHERE i.path = :path")
    FunnyImage deletePhotoByPath(String path);
}
