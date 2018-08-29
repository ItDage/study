package com.study.entity;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;

/**
 * 用户类
 * @author Administrator
 *
 */
@Component
public class User {

	private int id;
	@Length(min = 1, max = 10, message = "用户名长度在10个长度以内")
	private String username;
	//密码最少6位,最多12位
	@Length(min = 6, max = 12)
	private String password;
	//年龄最小0,最大100岁
	//@Size(min = 0, max = 100)
	private int age;
	//@Size(min = 0, max = 1)
	private int gender;
	@Email(message = "不是一个合法的邮箱!")
	private String mail;
	//@Length(min = 11, max = 11)
	private String tel;
	private String image;
	private int state;
	private int lock_state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getLock_state() {
		return lock_state;
	}
	public void setLock_state(int lock_state) {
		this.lock_state = lock_state;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", age=" + age + ", gender="
				+ gender + ", mail=" + mail + ", tel=" + tel + ", image=" + image + ", state=" + state + ", lock_state="
				+ lock_state + "]";
	}
	
}
