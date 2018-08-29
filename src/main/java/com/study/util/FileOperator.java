package com.study.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

/**
 * 文件操作类
 * @author Administrator
 *
 */
@Component
public class FileOperator {

	
	/**
	 * 图片文件的保存位置
	 * @param request
	 * @return
	 */
	public static String getImageSavePath(HttpServletRequest request){
		String savePath = request.getServletContext().getRealPath("/images/user");
		return savePath;
	}
}
