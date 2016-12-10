package com.MusicApp.Entity;

import javax.persistence.*;

@Entity
@Table(name = "FunnyImages")
public class FunnyImage {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private long path;

    public FunnyImage(){}

    public FunnyImage(long path) {
        this.id = id;
        this.path = path;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getPath() {
        return path;
    }

    public void setPath(long path) {
        this.path= path;
    }
}
