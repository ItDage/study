package com.study.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.entity.Navigation;
import com.study.entity.Result;
import com.study.entity.Video;
import com.study.service.CourseService;
import com.study.service.VideoService;

@Controller
@RequestMapping("/course")
public class CourseAction {

	@Autowired
	private Result result;
	@Autowired
	private CourseService courseService;
	@Autowired
	private VideoService videoService;

	@RequestMapping("/list")
	public String list(Video video, HttpServletRequest request) throws UnsupportedEncodingException {
		String first_nav_name = video.getFirst_nav_name();
		if (first_nav_name != null) {
			//first_nav_name = new String(first_nav_name.getBytes("iso-8859-1"), "utf-8");
			System.out.println(first_nav_name);
			HashMap<Object, Object> map = new HashMap<>();
			// 点击的一级导航
			map.put("first_nav_name", first_nav_name);
			map.put("limit", 1);// 开启分页
			int page_no = video.getPage_no();
			page_no = (page_no - 1) * 10;
			map.put("page_no", page_no);
			List<Video> list = videoService.getVideo(map);
			request.setAttribute("videoList", list);
		}
		List<Navigation> list = courseService.getSecNavByFirNav(first_nav_name);
		request.setAttribute("second", list);
		// 获取视频的总数,分页用到,共几页
		HashMap<Object, Object> map = new HashMap<>();
		map.put("first_nav_name", video.getFirst_nav_name());
		map.put("limit", 0);
		List<Video> list2 = videoService.getVideo(map);
		request.setAttribute("videoCount", list2.size());
		request.setAttribute("first_nav_name", video.getFirst_nav_name());
		return "list";
	}

	/**
	 * 一级导航分页获得数据
	 * 
	 * @param video
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@RequestMapping("/pageSelect")
	public Result pageSelect(Video video) throws UnsupportedEncodingException {
		String first_nav_name = video.getFirst_nav_name();
		first_nav_name = new String(first_nav_name.getBytes("iso-8859-1"), "utf-8");
		if (first_nav_name != null) {
			HashMap<Object, Object> map = new HashMap<>();
			// 点击的一级导航
			map.put("first_nav_name", video.getFirst_nav_name());
			map.put("limit", 1);// 开启分页
			int page_no = video.getPage_no();
			page_no = (page_no - 1) * 10;
			map.put("page_no", page_no);
			List<Video> list = videoService.getVideo(map);
			result.setCode(200);
			result.setData(list);
		} else {
			result.setCode(404);
		}

		return result;
	}

	/**
	 * 二级导航分页获得数据
	 * 
	 * @param video
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@RequestMapping("/pageSelect2")
	public Result pageSelect3(Video video) throws UnsupportedEncodingException {
		String second_nav_name = video.getSecond_nav_name();
		second_nav_name = new String(second_nav_name.getBytes("iso-8859-1"), "utf-8");
		String type = video.getType();
		HashMap<Object, Object> map = new HashMap<>();
		if ("".equals(second_nav_name)) {
			map.put("second_nav_name", null);
		} else {
			map.put("second_nav_name", second_nav_name);
		}
		
		if("1".equals(type)){
			map.put("order2", 1);
		}else if("2".equals(type)){
			map.put("order1", 1);
		}
		
		if("".equals(video.getLevel())){
			map.put("level", null);
		}else{
			map.put("level", video.getLevel());
		}
		
		// 一级---->二级---->难易程度
		// 点击的一级导航
		map.put("first_nav_name", video.getFirst_nav_name());

		map.put("limit", 1);// 开启分页
		int page_no = video.getPage_no();
		page_no = (page_no - 1) * 10;
		map.put("page_no", page_no);
		List<Video> list = videoService.getVideo(map);
		result.setCode(200);
		result.setData(list);

		return result;
	}

	
	/**
	 * 根据参数得到视频列表, 点击二级导航,点击三级导航, 点击四级导航
	 * 
	 * @param video
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@RequestMapping(value = "/getVideoListByParam", method = RequestMethod.POST)
	public Result getVideoListByParam(Video video) throws UnsupportedEncodingException {
		String first_nav_name = video.getFirst_nav_name();
		String second_nav_name = video.getSecond_nav_name();
		if(second_nav_name != null){
			second_nav_name = new String(second_nav_name.getBytes("iso-8859-1"), "utf-8");
		}
//		if(first_nav_name != null){
//			first_nav_name = new String(first_nav_name.getBytes("iso-8859-1"), "utf-8");
//		}
		
		System.out.println("1" + first_nav_name + "2" +second_nav_name);
		
		String type = video.getType();
		
		HashMap<Object, Object> map = new HashMap<>();
		if ("".equals(second_nav_name)) {
			map.put("second_nav_name", null);
		} else {
			map.put("second_nav_name", second_nav_name);
		}
		
		if("1".equals(type)){
			map.put("order2", 1);
		}else if("2".equals(type)){
			map.put("order1", 1);
		}
		
		if("".equals(video.getLevel())){
			map.put("level", null);
		}else{
			map.put("level", video.getLevel());
		}
		System.out.println(first_nav_name +"," +second_nav_name + "," + video.getType() + "," + video.getLevel());
		// 一级---->二级---->难易程度
		// 开始计算二级导航下该难易程度的视频总数
		map.put("first_nav_name", first_nav_name);
		
		map.put("limit", 0);// 不开启分页
		List<Video> list2 = videoService.getVideo(map);
		result.setCount(list2.size());
		// 计算二级导航的视频总数结束

		// 开始获得前10条数据
		map.remove("limit");
		map.put("limit", 1);// 开启分页
		int page_no = video.getPage_no();
		page_no = (page_no - 1) * 10;
		map.put("page_no", page_no);
		List<Video> list = videoService.getVideo(map);
		result.setCode(200);
		result.setMsg("查询成功!");
		result.setData(list);

		return result;
	}
}
