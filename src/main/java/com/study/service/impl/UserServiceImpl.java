package com.study.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dao.UserDao;
import com.study.entity.User;
import com.study.service.UserService;
import com.study.util.SendEmailUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public List<User> getUser(HashMap<Object, Object> map) {
		// TODO Auto-generated method stub
		return userDao.getUser(map);
	}

	@Override
	public int add(User user, HttpServletRequest request) {
		int add = userDao.add(user);
		int id = user.getId();
		String localAddr = "localhost";
		int localPort = request.getLocalPort();
		String ip = localAddr + ":" + localPort;
		
		String contextPath = request.getContextPath();
		String activeUrl = "http://" + ip + contextPath + "/user/activeMail?id=" + id;
		try{
			SendEmailUtil.sendSimpleMail(user.getMail(), "点此进行验证  "+ activeUrl +"  如不是本人操作,请勿点击该链接", "注册验证");
		}catch(Exception e){
			//发送异常,删除刚刚注册的用户
			delete(String.valueOf(id));
			return 2;
		}
		return add;
	}

	@Override
	public int activeMail(String id) {
		// TODO Auto-generated method stub
		return userDao.activeMail(id);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return userDao.delete(id);
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return userDao.update(user);
	}
}
