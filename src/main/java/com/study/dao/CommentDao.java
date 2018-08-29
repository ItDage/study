package com.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.entity.Comment;

@Mapper
public interface CommentDao {

	int add(Comment comment);

	 List<Comment> get(HashMap<Object, Object> map);

	int delete(String id);

}
