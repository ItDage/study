package com.study.entity;

import org.springframework.stereotype.Component;

@Component
public class Navigation {

	private int id;
	private String name;
	private String first_nav_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFirst_nav_name() {
		return first_nav_name;
	}
	public void setFirst_nav_name(String first_nav_name) {
		this.first_nav_name = first_nav_name;
	}
	@Override
	public String toString() {
		return "Navigation [id=" + id + ", name=" + name + ", first_nav_name=" + first_nav_name + "]";
	}
	
	
}
