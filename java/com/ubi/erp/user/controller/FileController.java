package com.ubi.erp.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ubi.erp.cmm.file.AttachFileService;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.user.domain.AttachFile;

@Controller
@RequestMapping(value = "/file", method = RequestMethod.POST)
public class FileController {

	private static final Logger LOGGER = LoggerFactory.getLogger(FileController.class);

	@Autowired
	private AttachFileService attachFileService;


	@RequestMapping(value = "/prcsFile.sc")
	public void prcsPrgmHelp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 01. 물리파일 서버저장
		List<AttachFile> uploadFileList = attachFileService.uploadAttachFile(PropertyUtil.getString("attach.savedir"), request, response);
		
		// 02. 파일업로드 DB처리 (첫번째 파라미터가 "" 일 경우 신규, 수정일 경우 ID 셋팅)
		//attachFileService.prcsAttachFile("", uploadFileList);

		// 03. 파일정보 디버그
		for (AttachFile file : uploadFileList) {
			LOGGER.debug(file.getFileSaveNm());
			LOGGER.debug(file.getFileSize());
		}

		// 04. 파일업로드를 위해 Form.submit 했으므로 .do 호출함
		StringBuffer sb = new StringBuffer();
		sb.append("<script>\n");
		sb.append("    alert('저장되었습니다.');\n");
		sb.append("    location.replace('/erp/fileSave.do');\n");
		sb.append("</script>\n");

		response.setContentType("text/html");
		response.getOutputStream().print(new String(sb.toString().getBytes("UTF-8"), "8859_1"));

	}
}