package com.study.entity;

import org.springframework.stereotype.Component;

@Component
public class Video {

	private int id; //主键,唯一
	private String name;//视频名
	private String src;//视频地址
	private String image;//视频封面图片
	private String level;//视频所属的难易度
	private String chapter;//视频所属的章节
	private String period;//视频所属的课时
	private String first_nav_name;//视频所属的一级导航名
	private String second_nav_name;//视频所属的二级导航名
	private String teacher;//视频所属的讲师
	private int page_view;//视频观看量
	private int page_no;
	private String scan_time;
	private String coll_time;
	private String type;//1--->代表最新视频   2--->代表最热视频
	
	
	public String getColl_time() {
		return coll_time;
	}
	public void setColl_time(String coll_time) {
		this.coll_time = coll_time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getScan_time() {
		return scan_time;
	}
	public void setScan_time(String scan_time) {
		this.scan_time = scan_time;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getFirst_nav_name() {
		return first_nav_name;
	}
	public void setFirst_nav_name(String first_nav_name) {
		this.first_nav_name = first_nav_name;
	}
	public String getSecond_nav_name() {
		return second_nav_name;
	}
	public void setSecond_nav_name(String second_nav_name) {
		this.second_nav_name = second_nav_name;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public int getPage_view() {
		return page_view;
	}
	public void setPage_view(int page_view) {
		this.page_view = page_view;
	}
	@Override
	public String toString() {
		return "Video [id=" + id + ", name=" + name + ", src=" + src + ", image=" + image + ", level=" + level
				+ ", chapter=" + chapter + ", period=" + period + ", first_nav_name=" + first_nav_name
				+ ", second_nav_name=" + second_nav_name + ", teacher=" + teacher + ", page_view=" + page_view
				+ ", page_no=" + page_no + ", scan_time=" + scan_time + ", type=" + type + "]";
	}
	
}
