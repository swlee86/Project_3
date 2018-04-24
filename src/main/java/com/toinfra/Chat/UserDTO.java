package com.toinfra.Chat;

import java.util.List;

public class UserDTO {
	
	private String ip;
	private List<String> message;
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	
	public List<String> getMessage() {
		return message;
	}
	public void setMessage(List<String> message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "UserDTO [ip=" + ip + ", message=" + message + "]";
	}
	
	
}
