package com.study.entity;

import org.springframework.stereotype.Component;

/**
 * 用户收藏视频的类
 * @author Administrator
 *
 */
@Component
public class Collection {

	@Override
	public String toString() {
		return "Collection [id=" + id + ", v_id=" + v_id + ", mail=" + mail + ", coll_time=" + coll_time + ", page_no="
				+ page_no + "]";
	}
	private String id; //主键,唯一
	private String v_id;//视频id
	private String mail;//用户
	private String coll_time;//上次观看的时间
	private int page_no;
	
	
	public int getPage_no() {
		return page_no;
	}
	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getV_id() {
		return v_id;
	}
	public void setV_id(String v_id) {
		this.v_id = v_id;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getColl_time() {
		return coll_time;
	}
	public void setColl_time(String coll_time) {
		this.coll_time = coll_time;
	}
	
}
