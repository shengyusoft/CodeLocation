package com.wtkj.rms.attachment.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.model.Dictionary;
import com.wtkj.common.service.DictionaryServiceI;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.rms.attachment.model.AttachmentVo;
import com.wtkj.rms.attachment.service.AttachmentServiceI;
import com.wtkj.rms.msgcenter.service.ArticleServiceI;

@Controller
@RequestMapping("/fileup")
public class AttachmentController extends BaseController {

	@Autowired
	private AttachmentServiceI attachmentService;

	@Autowired
	private UserServiceI userService;

	@Autowired
	private DictionaryServiceI dictionaryService;

	@Autowired
	protected ArticleServiceI articleService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/attachment/attachment";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(AttachmentVo vo, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(attachmentService.dataGrid(vo, ph));
		grid.setTotal(attachmentService.count(vo, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/attachment/attachmentAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(AttachmentVo vo, @RequestParam MultipartFile myfile,
			HttpServletRequest request) {

		// 设置id
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		vo.setId(id);

		// 设置用户为当前用户
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		if (sessionInfo.getId() > 0) {
			vo.setCreateUserID(sessionInfo.getId());
		}

		String code = vo.getAttachmentTypeCode();
		// TODO 设置类型为附件类型中的一个,这里根据code,可以修改为更好的方式 (to fix)
		List<Dictionary> dlist = dictionaryService.find(code, "fjtype");
		if (dlist.size() > 0) {
			vo.setAttachmentTypeId(dlist.get(0).getId());
		}

		Json j = new Json();
		try {

			if (myfile.isEmpty()) {
				System.out.println("文件未上传");
			} else {
				String fileName = myfile.getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf("."));
				vo.setUiName(fileName);
				vo.setFileSize(myfile.getSize());
				vo.setFileType(myfile.getContentType());
				String saveFileName = id + ext;
				String realPath = request.getSession().getServletContext()
						.getRealPath("/WEB-INF/upload");
				vo.setPath(realPath + "/" + saveFileName);
				vo.setFileName(saveFileName);// 保存到数据库后的文件名称
				// 这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
				FileUtils.copyInputStreamToFile(myfile.getInputStream(),
						new File(realPath, saveFileName));

			}
			attachmentService.add(vo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
			j.setObj(vo);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String ids) {
		Json j = new Json();
		if (StringUtils.isEmpty(ids)) {
			j.setMsg("没有记录!");
			j.setSuccess(true);
			return j;
		}

		try {
			attachmentService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public AttachmentVo get(String id) {
		return attachmentService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String id) {
		AttachmentVo vo = attachmentService.get(id);
		request.setAttribute("project", vo);
		return "/basic/attachment/attachmentEdit";
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(AttachmentVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			attachmentService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	@RequestMapping("/attachPage")
	public String attachPage(HttpServletRequest request, String ids) {
		request.setAttribute("attachmentIds", ids);
		return "/basic/attachment/attachmentListDetail";
	}

	@RequestMapping("/findByArticleId")
	@ResponseBody
	public Json findByArticleId(Long id, HttpServletRequest request) {
		Json j = new Json();
		try {
			List<AttachmentVo> ats = attachmentService.findByArticleId(id);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
			j.setObj(ats);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/findByIds")
	@ResponseBody
	public Json findByIds(String ids) {
		String[] idArray = ids.split(",");

		if (StringUtils.isEmpty(idArray)) {
			return null;
		}

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < idArray.length; i++) {
			String id = idArray[i];
			if (i == (idArray.length-1)) {
				sb.append("'" + id + "'");
			} else {
				sb.append("'" + id + "'" + ",");
			}
		}

		Json j = new Json();
		try {
			List<AttachmentVo> ats = attachmentService.findByIds(sb.toString());
			j.setSuccess(true);
			j.setObj(ats);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, String id) {
		AttachmentVo vo = attachmentService.get(id);
		request.setAttribute("project", vo);
		return "/basic/attachment/attachmentDetail";
	}

	@RequestMapping("/download")
	public void download(HttpServletResponse response, String id)
			throws IOException {
		AttachmentVo vo = attachmentService.get(id);
		String path = vo.getPath();
		InputStream fis = new BufferedInputStream(new FileInputStream(path));
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ vo.getFileName() + "\"");
		response.setContentType("application/octet-stream;charset=UTF-8");
		OutputStream toClient = new BufferedOutputStream(
				response.getOutputStream());
		toClient.write(buffer);
		toClient.flush();
		toClient.close();

	}

}