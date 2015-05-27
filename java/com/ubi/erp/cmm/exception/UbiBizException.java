package com.ubi.erp.cmm.exception;

@SuppressWarnings("serial")
public class UbiBizException extends RuntimeException {

	private final String msg;

	private final String errorType;

	public UbiBizException(String msg) {
		super(msg);
		this.msg = msg;
		this.errorType = "";
	}

	public UbiBizException(String msg, Throwable th) {
		super(msg, th);
		this.msg = msg;
		this.errorType = "";
	}

	public UbiBizException(String msg, String errorType) {
		super(msg);
		this.msg = msg;
		this.errorType = errorType;
	}

	public UbiBizException(String msg, String errorType, Throwable th) {
		super(msg, th);
		this.msg = msg;
		this.errorType = errorType;
	}

	public String getMsg() {
		return msg;
	}

	public String getErrorType() {
		return errorType;
	}
}
