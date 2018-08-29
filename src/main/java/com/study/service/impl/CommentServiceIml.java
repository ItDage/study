package com.study.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dao.CommentDao;
import com.study.entity.Comment;
import com.study.service.CommentService;

@Service
public class CommentServiceIml implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	
	@Override
	public int add(Comment comment) {
		// TODO Auto-generated method stub
		return commentDao.add(comment);
	}


	@Override
	public List<Comment> get(HashMap<Object, Object> map) {
		// TODO Auto-generated method stub
		return commentDao.get(map);
	}


	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return commentDao.delete(id);
	}

}
