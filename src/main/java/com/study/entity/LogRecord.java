package com.study.entity;

import org.springframework.stereotype.Component;

@Component
public class LogRecord {

	private int id;
	private String name;
	private String url;
	private String scan_time;
	private String mail;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getScan_time() {
		return scan_time;
	}
	public void setScan_time(String scan_time) {
		this.scan_time = scan_time;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	@Override
	public String toString() {
		return "LogRecord [id=" + id + ", name=" + name + ", url=" + url + ", scan_time=" + scan_time + ", mail=" + mail
				+ "]";
	}
	
	
	
}
