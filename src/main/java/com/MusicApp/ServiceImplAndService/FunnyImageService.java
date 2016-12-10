package com.MusicApp.ServiceImplAndService;

import com.MusicApp.Entity.FunnyImage;

import java.util.List;

public interface FunnyImageService {
    List<FunnyImage> getAllImages();
    FunnyImage getPhotoById(long id);
    void addImage(FunnyImage funnyImage);
    long count();
    void deletePhotoByPath(String path);
}
