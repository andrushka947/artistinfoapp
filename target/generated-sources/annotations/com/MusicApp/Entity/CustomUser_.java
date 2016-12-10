package com.MusicApp.Entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(CustomUser.class)
public abstract class CustomUser_ {

	public static volatile SingularAttribute<CustomUser, String> password;
	public static volatile SingularAttribute<CustomUser, UserRole> role;
	public static volatile ListAttribute<CustomUser, MusicArtist> artists;
	public static volatile SingularAttribute<CustomUser, Long> id;
	public static volatile SingularAttribute<CustomUser, String> login;
	public static volatile SingularAttribute<CustomUser, String> email;

}

