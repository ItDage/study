package com.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.entity.History;
import com.study.entity.Video;

@Mapper
public interface VideoDao {
	
	int addHistory(HashMap<Object, Object> map);

	List<Video> getVideo(HashMap<Object, Object> map);

	int update(Video video);

	List<Video> getVideoHistory(HashMap<Object, Object> map);

	List<History> getAllVideoHistory(HashMap<Object, Object> map);
	
	int updateVideoHistory(History history);

}
