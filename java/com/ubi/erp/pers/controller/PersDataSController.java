package com.ubi.erp.pers.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ubi.erp.cmm.file.AttachFileService;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.pers.domain.PersDataS;
import com.ubi.erp.pers.service.PersDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/persDataS")
public class PersDataSController {

	@Autowired
	private PersDataSService persDataSService;
	
	@Autowired
	private AttachFileService attachFileService;
	
	private String saveFilename;  
	  
	private String filePath = "/images/temp";  
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<PersDataS> selPersDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");;
		map.put("compId", compId);
		map.put("postCode", "%");
		map.put("empNo", "%");
		map.put("o_cursor", null);
		persDataSService.selPersDataSL(map);
		List<PersDataS> list = (List<PersDataS>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<PersDataS> selPersDataSR(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = persDataS.getCompId();
		String empNo = persDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		persDataSService.selPersDataSR(map);
		List<PersDataS> list = (List<PersDataS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/formSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsPersData(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		persDataS.setSysEmpNo(sysEmpNo);
		persDataS.setArmyJong(persDataS.getArmyKind());

	 	if(saveFilename != null){  
	 	persDataS.setImgPath(saveFilename);
	 	saveFilename = null;
	 	}else{
	 	 persDataS.setImgPath(""); 
	 	}
	 	persDataSService.prcsPersDataS(persDataS);	
	}
	
	//파일 List 불러오기

		//파일 업로드 및 삭제 추가
	@RequestMapping(value = "/prcsFileUpload")
	 public void prcsfileUpload(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   String saveDir = request.getSession().getServletContext().getRealPath(filePath);
			 
	  MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
	  MultiValueMap<String, MultipartFile> multiValueMap = multipartRequest.getMultiFileMap(); 
	  File uploadDir = new File(saveDir);
		if (!uploadDir.exists()) {uploadDir.mkdirs();}
				
	   List<MultipartFile> files = multiValueMap.get("fileName");  
		   for (MultipartFile file : files) {  
			 if (!file.isEmpty()) {  
				long limitSize = Long.parseLong(PropertyUtil.getString("attach.uploadSize"));  
			    if (limitSize > file.getSize()) {
			 		 String fileName = file.getOriginalFilename();  
					 String ext = fileName.substring(fileName.lastIndexOf(".") + 1);  
			 		 String onlyName = fileName.substring(0, fileName.lastIndexOf("."));  
			 		    saveFilename = fileName;  
				// 파일명이 중복되는 경우 변경처리  
				if (new File(saveDir + "/" + fileName).exists()) {  
			 		int fileSeq = 1;  
			 		while (isFileExists(saveDir, onlyName, fileSeq, ext)) {  fileSeq++;}  
					saveFilename = onlyName + "_" + fileSeq + "." + ext;  
				  }  
			  // 실제 파일 업로드  
			  file.transferTo(new File(saveDir + "/" + saveFilename));  
			 }   
		  }  
	   } 
	}
		
	@RequestMapping(value = "/prcsFileDelete")
	public void prcsfileDelete(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {	  
	String delDir = request.getSession().getServletContext().getRealPath(filePath);  
	File targetFile = new File(delDir,persDataS.getImgPath());  
	   if (targetFile.exists()) {  
		   targetFile.delete();  
		   saveFilename = null;}  
          prcsPersData(request, response, session, persDataS);  
		} 
	
	public boolean isFileExists(String saveDir, String onlyName, int fileSeq, String ext) {
		return new File(saveDir + "/" + onlyName + "_" + (fileSeq) + "." + ext).exists();
	}
}
