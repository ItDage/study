package com.study.entity;

import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Component;

/**
 * 用户收藏视频的类
 * @author Administrator
 *
 */
@Component
public class Comment {

	private String id; //主键,唯一
	@NotNull
	private String v_id;//视频id
	private String mail;//用户
	private String comment_time;//发表评论的时间
	@NotNull
	private String content;
	private int page_no;
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
	public String getComment_time() {
		return comment_time;
	}
	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPage_no() {
		return page_no;
	}
	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", v_id=" + v_id + ", mail=" + mail + ", comment_time=" + comment_time
				+ ", content=" + content + ", page_no=" + page_no + "]";
	}
	
	
	
	
	
}
