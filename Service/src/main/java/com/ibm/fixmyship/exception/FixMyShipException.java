package com.ibm.fixmyship.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
public class FixMyShipException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public FixMyShipException(String message) {
        super(message);
    }

    public FixMyShipException(String message, Throwable cause) {
        super(message, cause);
    }
}
