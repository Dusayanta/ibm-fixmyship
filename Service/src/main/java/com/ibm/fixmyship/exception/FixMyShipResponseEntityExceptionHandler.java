package com.ibm.fixmyship.exception;

import com.ibm.fixmyship.payload.ApiResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

class FixMyShipResponseEntityExceptionHandler extends ResponseEntityExceptionHandler {

	@ExceptionHandler(FixMyShipException.class)
	public final ResponseEntity<ApiResponse> handleFixMyShipException(FixMyShipException ex, WebRequest req) {
		ApiResponse res = new ApiResponse(false, req.getDescription(false));
		return new ResponseEntity<>(res, HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@ExceptionHandler(BadRequestException.class)
	public final ResponseEntity<ApiResponse> handleBadRequestException(BadRequestException ex, WebRequest req) {
		ApiResponse res = new ApiResponse(false, req.getDescription(false));
		return new ResponseEntity<>(res, HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@ExceptionHandler(ResourceNotFoundException.class)
	public final ResponseEntity<ApiResponse> handleResourceNotFoundException(ResourceNotFoundException ex,
			WebRequest req) {
		ApiResponse res = new ApiResponse(false, req.getDescription(false));
		return new ResponseEntity<>(res, HttpStatus.NOT_FOUND);
	}
}