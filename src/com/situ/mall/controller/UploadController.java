package com.situ.mall.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.situ.mall.util.QiniuUploadUtil;

@Controller
@RequestMapping("/upload")
public class UploadController {

	@RequestMapping("/uploadPic")
	@ResponseBody
	public Map<String, Object> uploadPic(MultipartFile picureFile) {
		//为了防止重名生成随机的名字
		/*String name = UUID.randomUUID().toString().replace("-", "");
		//jpg,png
		String ext = FilenameUtils.getExtension(picureFile.getOriginalFilename());
		String fileName = name + "." + ext;//数据库里面
		String filePath = "E:\\pic\\" + fileName;
		try {
			picureFile.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}*/

		
		String fileName = "";
		try {
			fileName = QiniuUploadUtil.upload(picureFile.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("filePath", QiniuUploadUtil.SERVER_ADDRES + fileName);
		return map;
	}
	
	public static void main(String[] args) {
		String name = UUID.randomUUID().toString().replace("-", "");
		System.out.println(name);
	}
}
