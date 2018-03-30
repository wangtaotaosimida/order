package com.jsjk.util;

import java.util.List;

public class BaseJsons <T>{
	private int status;
	private String message;
	private List<T> vaules;
	

	public List<T> getVaules() {
		return vaules;
	}
	public void setVaules(List<T> vaules) {
		this.vaules = vaules;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public BaseJsons(int status, String message, List<T> vaules) {
		this.status = status;
		this.message = message;
		this.vaules = vaules;
	}
	public BaseJsons() {
	}
	
	
}
