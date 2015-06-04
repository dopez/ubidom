package com.ubi.erp.prod1.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
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
import com.ubi.erp.prod1.domain.HistoryS;
import com.ubi.erp.prod1.domain.HistorySPop;
import com.ubi.erp.prod1.service.HistorySPopService;
import com.ubi.erp.prod1.service.HistorySService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/historyS")
public class HistorySController {
	
	@Autowired
	private HistorySService historySSservice;
	
	@Autowired
	private HistorySPopService historySPopService;
	
	@Autowired
	private AttachFileService attachFileService;
	
	private String saveFilename;  
	  
	private String filePath = "/images/temp";  
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<HistoryS> selEquiHistorySL(HttpServletRequest request, HttpServletResponse response,HttpSession session,HistoryS historyS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String equiCode = request.getParameter("eqCode");
		String supplyComp = request.getParameter("splyComp");
		map.put("equiCode", equiCode);
		map.put("supplyComp", supplyComp);
		map.put("o_cursor", null);
		historySSservice.selEquiHistorySL(map);
		List<HistoryS> list = (List<HistoryS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridFormSearch",method = RequestMethod.POST)
	public List<HistoryS> selEquiHistorySR(HttpServletRequest request, HttpServletResponse response,HistoryS historyS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String equiCode = historyS.getEquiCode();
		map.put("equiCode", equiCode);
		map.put("o_cursor", null);
		historySSservice.selEquiHistorySR(map);
		List<HistoryS> list = (List<HistoryS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/equiCodeSearch",method = RequestMethod.POST)
	public List<HistoryS> selEquiCode(HttpServletRequest request, HttpServletResponse response,HttpSession session,HistoryS historyS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String equiName = historyS.getEquiName();
		map.put("equiName", equiName);
		map.put("o_cursor", null);
		historySSservice.selEquiCode(map);
		List<HistoryS> list = (List<HistoryS>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/partCodeSearch",method = RequestMethod.POST)
	public List<HistorySPop> selPartCode(HttpServletRequest request, HttpServletResponse response,HttpSession session,HistorySPop historySPop) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String partName = historySPop.getPartName();
		map.put("partName", partName);
		map.put("o_cursor", null);
		historySPopService.selPartCode(map);
		List<HistorySPop> list = (List<HistorySPop>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridFormSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEquiHistoryS(HttpServletRequest request, HttpServletResponse response,HttpSession session,HistoryS historyS) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		historyS.setSysEmpNo(sysEmpNo);
		if(saveFilename != null){  
			 historyS.setImgPath(saveFilename);
		 }else{
		 	 historyS.setImgPath(""); 
		 	}
		historySSservice.prcsEquiHistoryS(historyS);
	}
	
	@RequestMapping(value = "/prcsEquiFileUpload")
	 public void prcsEquiFileUpload(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
	@RequestMapping(value = "/prcsEquiFileDelete")
	public void prcsEquiFileDelete(HttpServletRequest request, HttpServletResponse response,HttpSession session,HistoryS historyS) throws Exception {	  
	String delDir = request.getSession().getServletContext().getRealPath(filePath);  
	File targetFile = new File(delDir,historyS.getImgPath());  
	   if (targetFile.exists()) {  
		   targetFile.delete();  
		   saveFilename = null;}  
	   prcsEquiHistoryS(request, response, session, historyS);  
		} 
	
	public boolean isFileExists(String saveDir, String onlyName, int fileSeq, String ext) {
		return new File(saveDir + "/" + onlyName + "_" + (fileSeq) + "." + ext).exists();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridTab1Search",method = RequestMethod.POST)
	public List<HistorySPop> selEquiCheck(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_cursor", null);
		historySPopService.selEquiCheck(map);
		List<HistorySPop> list = (List<HistorySPop>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridTab2Search",method = RequestMethod.POST)
	public List<HistorySPop> selPartCodeHistory(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_cursor", null);
		historySPopService.selPartCodeHistory(map);
		List<HistorySPop> list = (List<HistorySPop>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridTab1Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEquiCheck(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<HistorySPop> list = new ArrayList<HistorySPop>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<HistorySPop>>(){});
		historySPopService.prcsEquiCheck(list,sysEmpNo);
	}
	
	@RequestMapping(value = "/gridTab2Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsPartCodeHistory(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData2");
		List<HistorySPop> list = new ArrayList<HistorySPop>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<HistorySPop>>(){});
		historySPopService.prcsPartCodeHistory(list,sysEmpNo);
	}
	
}
