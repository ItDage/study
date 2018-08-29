package com.study.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.study.entity.Result;
import com.study.entity.User;
import com.study.service.UserService;
import com.study.util.FileOperator;

@RequestMapping("/upload")
@RestController
public class ResourceUploadAction {

	@Autowired
	private Result result;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/image", method = RequestMethod.POST)
	public Result uploadImage(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			// 未登录,
			result.setCode(404);
			result.setData(null);
			result.setCount(0);
			result.setMsg("非法请求");
		} else {
			String originalFilename = file.getOriginalFilename();
			int lastIndexOf = originalFilename.lastIndexOf(".");
			String fileType = originalFilename.substring(lastIndexOf, originalFilename.length());
			// jpg|png|gif|bmp|jpeg
			if (fileType.equalsIgnoreCase(".jpg") || fileType.equalsIgnoreCase(".png")
					|| fileType.equalsIgnoreCase(".gif") || fileType.equalsIgnoreCase(".bmp")
					|| fileType.equalsIgnoreCase(".jpeg")) {
				String savePath = FileOperator.getImageSavePath(request);
				long ctm = System.currentTimeMillis();
				savePath = savePath + File.separator + ctm + fileType;
				// 只要名字
				File file2 = new File(savePath);
				savePath = savePath.substring(savePath.lastIndexOf(File.separator) + 1, savePath.length());
				try {
					file.transferTo(file2);
				} catch (IOException e) {
					result.setCode(404);
					result.setMsg("文件上传失败");
					result.setData(null);
					e.printStackTrace();
				}
				User user2 = new User();
				user2.setMail(user.getMail());
				user2.setImage(savePath);
				int update = userService.update(user2);
				if(update > 0){
					result.setCode(200);
					result.setMsg("头像修改成功!");
					result.setData(savePath);
				}else{
					result.setCode(404);
					result.setMsg("头像修改失败!");
					result.setData(savePath);
				}
				
			} else {
				// 不支持的格式
				result.setCode(404);
				result.setMsg("格式不支持");
				result.setData(null);
			}
		}

		return result;
	}
}
