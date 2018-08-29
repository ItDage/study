package com.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.study.entity.Comment;

@Service
public interface CommentService {

	int add(Comment comment);
	
	List<Comment> get(HashMap<Object, Object> map);

	int delete(String id);
	

}
