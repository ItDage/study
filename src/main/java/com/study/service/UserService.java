package com.study.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.study.entity.User;


@Service
public interface UserService {

	/**
	 * 获得用户信息
	 * @param user
	 * @return
	 */
	public List<User> getUser(HashMap<Object, Object> map);

	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public int add(User user, HttpServletRequest request);

	/**
	 * 根据用户id激活邮箱,并不能根据用户名激活
	 * @param id
	 * @return
	 */
	public int activeMail(String id);
	
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int update(User user);
	
	/**//**
	 * 为用户增加普通角色
	 * @param user
	 * @return
	 *//*
	public int addRole(User user);

	*//**更新信息
	 * @param user
	 * @return
	 *//*
	public int update(User user);
	
	*//**
	 * 登录专用
	 * @param user
	 * @return
	 *//*
	public User login(User user);
	
	*//**
	 * 根据用户id激活邮箱,并不能根据用户名激活
	 * @param id
	 * @return
	 *//*
	public int activeMail(String id);
	*/
	
	/*
	 * 清除未邮箱验证的人
	 * @return
	 **/
	public int delete(String id);
}
