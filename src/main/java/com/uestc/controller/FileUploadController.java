package com.uestc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.uestc.common.controller.SuperController;

/**
 * 文件上传控制器
 * Created by Gaojun.Zhou 2017年4月28日
 */

@Controller
public class FileUploadController extends SuperController{
	
	public static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	/**
	 * 上传文件
	 * @param file
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/file/upload")
	public Map<String, Object> fileUpload( @RequestParam MultipartFile[] file) throws IOException{
		
		List<String> urls = new ArrayList<String>();
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			for(MultipartFile myfile : file){  
			        if(myfile.isEmpty()){  
			        	logger.warn("文件未上传");  
			        }else{  
			            logger.debug("文件长度: " + myfile.getSize());  
			            logger.debug("文件类型: " + myfile.getContentType());  
			            logger.debug("文件名称: " + myfile.getName());  
			            logger.debug("文件原名: " + myfile.getOriginalFilename());  
			            String ext =  FilenameUtils.getExtension(myfile.getOriginalFilename());
			            String reName = RandomStringUtils.randomAlphanumeric(32).toLowerCase() + "."+ ext;
			            String cdate = DateFormatUtils.format(new Date(), "yyyy-MM-dd");
			            String realPath = request.getSession().getServletContext().getRealPath("/upload")+ File.separator +cdate; 
			            FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, reName)); 
			            urls.add("/upload/"+cdate+"/"+reName);
			        }  
			    }
			result.put("status", "success");
			result.put("urls",urls);
			return result;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.put("status", "error");
			return result;
		}  
	}
}
