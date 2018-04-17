package com.art.design.common.exception;

public class SystemException extends RuntimeException{

	private static final long serialVersionUID = 4688265645408766759L;

	public SystemException(String message, Throwable cause) {
		super(message, cause);
	}

	public SystemException(String message) {
		super(message);
	}

	public SystemException(Throwable cause) {
		super(cause);
	}

}
