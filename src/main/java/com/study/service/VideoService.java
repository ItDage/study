package com.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.study.entity.History;
import com.study.entity.User;
import com.study.entity.Video;

@Service
public interface VideoService {

	/**
	 * 点击导航栏获得视频信息
	 * @param map
	 * @return
	 */
	List<Video> getVideo(HashMap<Object, Object> map);
	
	/**
	 * 更新视频信息, 插入浏览记录, 更新浏览量等
	 * @param video
	 * @return
	 */
	int update(Video video, User user);
	
	List<History> getAllVideoHistory(HashMap<Object, Object> map);
	
	List<Video> getVideoHistory(HashMap<Object, Object> map);
	
	int updateVideoHistory(History history);

}