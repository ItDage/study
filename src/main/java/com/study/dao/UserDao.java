package com.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.entity.User;


@Mapper
public interface UserDao {

	public List<User> getUser(HashMap<Object, Object> map);

	public int add(User user);

	public int activeMail(String id);

	public int delete(String id);

	public int update(User user2);

	/*public int addRole(User user);

	public int update(User user);
	
	public User login(User user);
	
	public int activeMail(String id);

	public int delete();*/
}
