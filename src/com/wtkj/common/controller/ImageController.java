package com.wtkj.common.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Json;
import com.wtkj.common.service.DictionaryServiceI;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.attachment.model.AttachmentVo;
import com.wtkj.rms.attachment.service.AttachmentServiceI;
import com.wtkj.rms.msgcenter.service.ArticleServiceI;

@Controller
@RequestMapping("/image")
public class ImageController extends BaseController {

	@Autowired
	private AttachmentServiceI attachmentService;

	@Autowired
	private UserServiceI userService;

	@Autowired
	private DictionaryServiceI dictionaryService;

	@Autowired
	protected ArticleServiceI articleService;

	@Value("#{messpro['upload.virtual.path']}")
	private String upload_virtual_path;// 项目图片上传虚拟路径

	@RequestMapping("/upload")
	@ResponseBody
	public Json upload(AttachmentVo vo, @RequestParam MultipartFile myfile,
			HttpServletRequest request) {

		Json j = new Json();
		try {
			String saveFileName = "";
			if (myfile.isEmpty()) {
				System.out.println("文件未上传");
			} else {
				String fileName = myfile.getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf("."));
				saveFileName = "tmp_" + System.currentTimeMillis() + ext;
				// 这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
				FileUtils.copyInputStreamToFile(myfile.getInputStream(),
						new File(upload_virtual_path+GlobalConstant.TEMP_DIR + "/", saveFileName));

			}
			j.setSuccess(true);
			j.setMsg("上传成功！");
			j.setObj(saveFileName);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

}