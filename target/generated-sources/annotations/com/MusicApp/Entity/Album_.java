package com.MusicApp.Entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Album.class)
public abstract class Album_ {

	public static volatile SingularAttribute<Album, MusicArtist> musicArtist;
	public static volatile SingularAttribute<Album, String> name;
	public static volatile SingularAttribute<Album, Long> id;

}

