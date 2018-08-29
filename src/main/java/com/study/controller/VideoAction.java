package com.study.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.entity.Collection;
import com.study.entity.Comment;
import com.study.entity.History;
import com.study.entity.Result;
import com.study.entity.User;
import com.study.entity.Video;
import com.study.service.CollectionService;
import com.study.service.CommentService;
import com.study.service.VideoService;

@Controller
@RequestMapping("/video")
public class VideoAction {

	@Autowired
	private Result result;
	@Autowired
	private VideoService videoService;
	@Autowired
	private CollectionService collectionService;
	@Autowired
	private CommentService commentService;

	@RequestMapping("/play")
	public String play(int id, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			// 未登录,不可以观看视频,返回到首页
			return "redirect:/index.jsp";
		} else {
			// 已经登录,可以看视频
			HashMap<Object, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("limit", 0);
			List<Video> list = videoService.getVideo(map);
			map.remove("id");
			map.remove("limit");
			map.put("mail", user.getMail());
			map.put("v_id", id);
			List<Collection> list2 = collectionService.get(map);
			if(list2.size() > 0){
				//该用户收藏了该视频
				request.setAttribute("collection", 1);
			}else{
				request.setAttribute("collection", 0);
			}
			//该视频的评论
			HashMap<Object, Object> map2 = new HashMap<>();
			map2.put("v_id", id);
			map2.put("limit", 0);
			List<Comment> list3 = commentService.get(map2);
			request.setAttribute("commentList", list3);
			
			request.setAttribute("video", list.get(0));
			//更新视频浏览量,添加浏览记录
			Video video = new Video();
			video.setId(id);
			video.setPage_view(1);
			videoService.update(video, user);
			
		}
		return "WEB-INF/jsp/play";
	}

	/**
	 * 获取视频的总数量
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getCount")
	public Result getCount(HttpServletRequest request) {
		HashMap<Object, Object> map = new HashMap<>();
		map.put("limit", 0);
		List<Video> list = videoService.getVideo(map);
		result.setCode(200);
		result.setMsg("获取视频数量成功！");
		result.setData(null);
		result.setCount(list.size());
		return result;
	}

	/**
	 * 根据视频id获取视频信息
	 * 
	 * @param video
	 * @return
	 */
/*	@RequestMapping("/getVideoInfo")
	public Result getVideoInfo(Video video) {
		HashMap<Object, Object> map = new HashMap<>();
		map.put("id", video.getId());
		
		return result;
	}*/
	
	@ResponseBody
	@RequestMapping("/scan_history")
	public Result scanHistory(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if(user.getMail() != null){
			HashMap<Object, Object> map = new HashMap<>();
			map.put("v_id", 0);
			List<History> list2 = videoService.getAllVideoHistory(map);
			HashMap<Object, Object> map2 = new HashMap<>();
			map2.put("mail", user.getMail());
			String limit = request.getParameter("limit");
			String page = request.getParameter("page_no");
			//获取分页数据
			Integer page_no = Integer.valueOf(page);
			page_no = (page_no - 1) * 10;
			map2.put("page_no", page_no);
			map2.put("limit", Integer.valueOf(limit));
			List<Video> list = videoService.getVideoHistory(map2);
			result.setCode(200);
			result.setCount(list2.size());
			result.setData(list);
		}
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("/index/getVideoInfo")
	public Result getIndexVideoInfo(HttpServletRequest request) {
		System.out.println(request.getRequestURL());
		User user = (User)request.getSession().getAttribute("user");
		HashMap<Object, Object> map = new HashMap<>();
		map.put("order1", 1);
		map.put("limit", 1);
		map.put("page_no", 0);
		//主页视频排行的10条数据
		List<Video> list = videoService.getVideo(map);
		result.setData(list);
		
		//实战推荐
		if(user == null){
			//没登录,则推荐的是浏览量最多的数据
			List<Video> list3 = list.subList(0, 5);
			result.setData1(list3);
		}else{
			//根据其观看的历史最后一个一级导航推荐
			HashMap<Object, Object> map2 = new HashMap<>();
			map2.put("mail", user.getMail());
			map2.put("limit", 5);
			map2.put("page_no", 0);
			List<Video> list2 = videoService.getVideoHistory(map2);
			if(list2.size() > 0){
				Video video = list2.get(0);
				HashMap<Object, Object> map3 = new HashMap<>();
				map3.put("first_nav_name", video.getFirst_nav_name());
				map3.put("order1", 1);
				map3.put("limit", 5);
				map3.put("page_no", 0);
				List<Video> list3 = videoService.getVideo(map3);
				result.setData1(list3);
			}else{
				result.setData1(list.subList(0, 5));
			}
		}
		
		//最新上架的10条数据
		map.remove("order1");
		map.put("order2", 1);
		List<Video> list2 = videoService.getVideo(map);
		result.setData2(list2);
		//技能提升,难度为高级的10条数据
		HashMap<Object, Object> map2 = new HashMap<>();
		map2.put("level", 3);
		map2.put("limit", 1);
		map2.put("page_no", 0);
		map2.put("order1", 1);
		List<Video> list3 = videoService.getVideo(map2);
		result.setData3(list3);
		return result;
	}

}
