package com.MusicApp.ServiceImplAndService;

import com.MusicApp.Entity.CustomUser;
import com.MusicApp.Entity.MusicArtist;
import com.MusicApp.Repositories.ArtistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ArtistServiceImpl implements ArtistService {

    @Autowired
    private ArtistRepository artistRepository;

    @Transactional
    @Override
    public void addArtist(MusicArtist musicArtist) {
        artistRepository.save(musicArtist);
    }

    @Transactional
    @Override
    public List<MusicArtist> getAllArtists() {
        return artistRepository.getAllArtists();
    }

    @Transactional
    @Override
    public MusicArtist getArtistByName(String name) {
        return artistRepository.getArtistByName(name);
    }

    @Transactional
    @Override
    public MusicArtist getArtistById(long id) {
        return artistRepository.getOne(id);
    }


    @Transactional
    @Override
    public List<MusicArtist> getArtistsByUser(CustomUser user) {
        return artistRepository.getArtistsByUser(user);
    }

    @Transactional
    @Override
    public void delete(MusicArtist musicArtist) {
        artistRepository.delete(musicArtist);
    }

    @Transactional
    @Override
    public void delete(long id) {
        artistRepository.delete(id);
    }
}
