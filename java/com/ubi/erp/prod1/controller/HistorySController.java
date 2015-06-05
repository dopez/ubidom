package com.ubi.erp.prod1.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.cmm.file.ImageUploadService;
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
	private ImageUploadService imageUploadService;
	
	private String saveFilename;  
	
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
		String saveDir = PropertyUtil.getString("attach.equi.dir");
		  saveFilename = imageUploadService.uploadImgFile(saveDir, request, response);
	}
		
	@RequestMapping(value = "/prcsEquiFileDelete")
	public void prcsEquiFileDelete(HttpServletRequest request, HttpServletResponse response,HttpSession session,HistoryS historyS) throws Exception {	  
		 String delDir = PropertyUtil.getString("attach.equi.dir");
		 String imgPath = historyS.getImgPath(); 
		imageUploadService.deleteImgFile(delDir, imgPath);
		saveFilename = null; 
	   prcsEquiHistoryS(request, response, session, historyS);  
	} 
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridTab1Search",method = RequestMethod.POST)
	public List<HistorySPop> selEquiCheck(HttpServletRequest request, HttpServletResponse response,HistorySPop historySPop) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String equiCode = historySPop.getEquiCode();
		map.put("equiCode", equiCode);
		map.put("o_cursor", null);
		historySPopService.selEquiCheck(map);
		List<HistorySPop> list = (List<HistorySPop>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridTab2Search",method = RequestMethod.POST)
	public List<HistorySPop> selPartCodeHistory(HttpServletRequest request, HttpServletResponse response,HistorySPop historySPop) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String equiCode = historySPop.getEquiCode();
		map.put("equiCode", equiCode);
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
	
	@RequestMapping(value = "/getEquiImg")
	public void getPersImg(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "equiCode", required = true) String equiCode) throws Exception {
		response.setContentType("image/jpeg");
		File file = new File(PropertyUtil.getString("attach.equi.dir") + "/" + equiCode + ".jpg");
		FileInputStream fis = null;
		OutputStream os = null;

		try {
			fis = new FileInputStream(file);
			os = response.getOutputStream();
			IOUtils.copy(fis, os);
		} catch (FileNotFoundException ex) {
			file = new File(PropertyUtil.getString("attach.equi.dir") + "/blank.jpg");
			fis = new FileInputStream(file);
			os = response.getOutputStream();
			IOUtils.copy(fis, os);
		} finally {
			if (fis != null)
				fis.close();
			if (os != null)
				os.close();
		}
	}
}
