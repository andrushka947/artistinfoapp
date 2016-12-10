package com.MusicApp.Entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Track.class)
public abstract class Track_ {

	public static volatile SingularAttribute<Track, MusicArtist> musicArtist;
	public static volatile SingularAttribute<Track, String> name;
	public static volatile SingularAttribute<Track, Long> id;
	public static volatile SingularAttribute<Track, String> album_url;
	public static volatile SingularAttribute<Track, String> lyrics;
	public static volatile SingularAttribute<Track, String> album_title;

}

