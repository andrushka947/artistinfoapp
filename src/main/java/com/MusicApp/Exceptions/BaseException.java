package com.MusicApp.Exceptions;

public class BaseException extends RuntimeException {

    public BaseException(String message) {
        super(message);
        System.out.println("BaseException error");
    }
}
