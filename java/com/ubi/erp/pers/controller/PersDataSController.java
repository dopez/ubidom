package com.ubi.erp.pers.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.cmm.file.ImageUploadService;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.pers.domain.PersDataS;
import com.ubi.erp.pers.service.PersDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/persDataS")
public class PersDataSController {

	@Autowired
	private PersDataSService persDataSService;
	
	@Autowired
	private ImageUploadService imageUploadService;
	
	private String saveFilename;  
	
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
	  String saveDir = PropertyUtil.getString("attach.pers.dir");
	  saveFilename = imageUploadService.uploadImgFile(saveDir, request, response);
	}
		
	@RequestMapping(value = "/prcsFileDelete")
	public void prcsfileDelete(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {	  
		 String delDir = PropertyUtil.getString("attach.pers.dir");
		 String imgPath = persDataS.getImgPath(); 
		  imageUploadService.deleteImgFile(delDir, imgPath);
		  saveFilename = null;
		prcsPersData(request, response, session, persDataS);  
     }
	
	@RequestMapping(value = "/getPersImg")
	public void getPersImg(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "empNo", required = true) String empNo) throws Exception {
		response.setContentType("image/jpeg");
		File file = new File(PropertyUtil.getString("attach.pers.dir") + "/" + empNo + ".jpg");
		FileInputStream fis = null;
		OutputStream os = null;

		try {
			fis = new FileInputStream(file);
			os = response.getOutputStream();
			IOUtils.copy(fis, os);
		} catch (FileNotFoundException ex) {
			file = new File(PropertyUtil.getString("attach.pers.dir") + "/blank.jpg");
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
