package com.study.entity;

import org.springframework.stereotype.Component;

@Component
public class History {

	private int id; //主键,唯一
	private int v_id;//视频id
	private String mail;//用户
	private String scan_time;//上次观看的时间
	private int page_no;
	
	
	public int getPage_no() {
		return page_no;
	}
	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getV_id() {
		return v_id;
	}
	public void setV_id(int v_id) {
		this.v_id = v_id;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getScan_time() {
		return scan_time;
	}
	public void setScan_time(String scan_time) {
		this.scan_time = scan_time;
	}
	
}
