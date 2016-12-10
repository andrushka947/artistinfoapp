package com.MusicApp.ServiceImplAndService;

import com.MusicApp.Entity.FunnyImage;
import com.MusicApp.Repositories.FunnyImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class FunnyImageServiceImpl implements FunnyImageService {

    @Autowired
    private FunnyImageRepository funnyImageRepository;

    @Override
    @Transactional
    public void addImage(FunnyImage funnyImage) {
        funnyImageRepository.save(funnyImage);
    }

    @Override
    @Transactional(readOnly = true)
    public List<FunnyImage> getAllImages() {
        return funnyImageRepository.getAllImages();
    }

    @Override
    @Transactional
    public FunnyImage getPhotoById(long id) {
        return funnyImageRepository.getPhotoById(id);
    }

    @Override
    @Transactional
    public void deletePhotoByPath(String path) {
        funnyImageRepository.deletePhotoByPath(path);
    }

    @Override
    @Transactional
    public long count(){
        return funnyImageRepository.count();
    }

}
