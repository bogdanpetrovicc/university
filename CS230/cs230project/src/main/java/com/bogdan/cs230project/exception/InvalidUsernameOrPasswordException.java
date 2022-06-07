package com.bogdan.cs230project.exception;

public class InvalidUsernameOrPasswordException extends RuntimeException {

    public InvalidUsernameOrPasswordException(String message) {
        super(message);
    }
}
