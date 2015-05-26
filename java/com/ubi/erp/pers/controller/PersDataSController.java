package com.ubi.erp.pers.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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

import com.ubi.erp.cmm.exception.UbiBizException;
import com.ubi.erp.cmm.file.AttachFileService;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.cmm.util.gson.DateFormatUtil;
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
	@RequestMapping(value = "/selLeft",method = RequestMethod.POST)
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
	@RequestMapping(value = "/selRight",method = RequestMethod.POST)
	public List<PersDataS> selPersDataSR(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = persDataS.getCompId();
		String empNo = persDataS.getEmpNo();
		String postName = persDataS.getPostName();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		persDataSService.selPersDataSR(map);
		List<PersDataS> list = (List<PersDataS>) map.get("o_cursor");
		DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			list.get(i).setPostName(postName);
			list.get(i).setEnterDate(df.dateToString2(list.get(i).getEnterDate()));
			list.get(i).setAmryDate1(df.dateToString2(list.get(i).getAmryDate1()));
			list.get(i).setAmryDate2(df.dateToString2(list.get(i).getAmryDate2()));
			list.get(i).setRetireDate(df.dateToString2(list.get(i).getRetireDate()));
			list.get(i).setRetireMidDate(df.dateToString2(list.get(i).getRetireMidDate()));
			// image 경로
			//list.get(i).setImgPath(PropertyUtil.getString("attach.basedir") +list.get(i).getImgPath());
		}
		return list;
	}
	
	@RequestMapping(value = "/prcsPersData", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsPersData(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		DateFormatUtil df = new DateFormatUtil();
		//session 값 set
		persDataS.setSysEmpNo(sysEmpNo);
		// checkBox null Check
		persDataS.setBldKind(nullCheck(persDataS.getBldKind()));
		persDataS.setDisorderYn(nullCheck(persDataS.getDisorderYn()));
		persDataS.setArmyMerit(nullCheck(persDataS.getArmyMerit()));
		// calendar format check
		persDataS.setEnterDate(df.dateToString(persDataS.getEnterDate()));
		persDataS.setAmryDate1(df.dateToString(persDataS.getAmryDate1()));
		persDataS.setAmryDate2(df.dateToString(persDataS.getAmryDate2()));
		persDataS.setRetireDate(df.dateToString(persDataS.getRetireDate()));
		persDataS.setRetireMidDate(df.dateToString(persDataS.getRetireMidDate()));
		// armyJong check -- armyJong == armyKind
		persDataS.setArmyJong(persDataS.getArmyKind());
		System.out.println("saveFilename======"+saveFilename);
		if(saveFilename != null){
			persDataS.setImgPath(saveFilename);
		}
		if("INSERT".equals(persDataS.getCudKey())) {
			persDataSService.prcsPersDataS(persDataS);
		}else if("UPDATE".equals(persDataS.getCudKey())){
			persDataSService.prcsPersDataS(persDataS);
		}else if("DELETE".equals(persDataS.getCudKey())){
			persDataSService.prcsPersDataS(persDataS);
		}	
	}
	
	//파일 List 불러오기

	//파일 업로드 및 삭제 추가
	@RequestMapping(value = "/prcsFileUpload",method= RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsfileUpload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String saveDir = request.getSession().getServletContext().getRealPath(filePath);

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultiValueMap<String, MultipartFile> multiValueMap = multipartRequest.getMultiFileMap();

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
						while (isFileExists(saveDir, onlyName, fileSeq, ext)) {
							fileSeq++;
						}
						saveFilename = onlyName + "_" + fileSeq + "." + ext;
					}
			
					// 실제 파일 업로드
					file.transferTo(new File(saveDir + "/" + saveFilename));

				} 
			}
		}
	}
	
	@RequestMapping(value = "/prcsFileDelete",method= RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsfileDelete(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {	
		String delDir = request.getSession().getServletContext().getRealPath(filePath);
		File targetFile = new File(delDir,persDataS.getImgPath());
		if (targetFile.exists()) {
			targetFile.delete();
		}
		persDataS.setImgPath("");
		prcsPersData(request, response, session, persDataS);
	}
	
	public static void fileDelete(String upDir, String oldfile) {
		File file = new File(upDir, oldfile);

		if (file.exists()) {
			file.delete();
		}
	}
	
	public String nullCheck(String value){
		if(value == null){
			value = "0";
		}
		return value;
	}
	
	public boolean isFileExists(String saveDir, String onlyName, int fileSeq, String ext) {
		return new File(saveDir + "/" + onlyName + "_" + (fileSeq) + "." + ext).exists();
	}
	
}
