package com.MusicApp.Entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(MusicArtist.class)
public abstract class MusicArtist_ {

	public static volatile ListAttribute<MusicArtist, Album> topAlbums;
	public static volatile SingularAttribute<MusicArtist, String> summary;
	public static volatile ListAttribute<MusicArtist, Track> topTracks;
	public static volatile SingularAttribute<MusicArtist, String> name;
	public static volatile SingularAttribute<MusicArtist, ArtistPhoto> photo;
	public static volatile SingularAttribute<MusicArtist, Long> id;
	public static volatile SingularAttribute<MusicArtist, CustomUser> user;
	public static volatile SingularAttribute<MusicArtist, String> url;

}

