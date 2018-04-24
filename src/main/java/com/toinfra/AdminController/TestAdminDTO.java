package com.toinfra.AdminController;

public class TestAdminDTO {

	private String name;
	private String age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public TestAdminDTO(String name, String age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	
	
}
