package com.ubi.erp.rndt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.rndt.domain.MatrCodeS;
import com.ubi.erp.rndt.service.MatrCodeSService;

@RestController
@RequestMapping(value = "/erp/rndt/stan/matrCodeS")
public class MatrCodeSController {

	@Autowired

	private MatrCodeSService MatrCodeSService;
	
	@RequestMapping(value = "/formSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsMatrCodeS(HttpServletRequest request, HttpServletResponse response,HttpSession session,MatrCodeS matrCodeS) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String compId = (String) session.getAttribute("compId");
		DateFormatUtil df = new DateFormatUtil();
		//session 값 set
		matrCodeS.setSysEmpNo(sysEmpNo);
		matrCodeS.setCompId(compId);
		// checkBox null Check

		// calendar format check
		matrCodeS.setEnterDate(df.dateToString(matrCodeS.getEnterDate()));
		matrCodeS.setUseEndDate(df.dateToString(matrCodeS.getUseEndDate()));

		if("INSERT".equals(matrCodeS.getCudKey())) {
			MatrCodeSService.prcsMatrCodeS(matrCodeS);
		}else if("UPDATE".equals(matrCodeS.getCudKey())){
			MatrCodeSService.prcsMatrCodeS(matrCodeS);
		}else if("DELETE".equals(matrCodeS.getCudKey())){
			MatrCodeSService.prcsMatrCodeS(matrCodeS);
		}	
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<MatrCodeS> selGridMain(HttpServletRequest request, HttpServletResponse response,HttpSession session,MatrCodeS matrCodeS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String matrCode = request.getParameter("matrCode");
		String matrName = request.getParameter("matrName");
		map.put("V_COMPID", compId);
		map.put("V_MATR_CODE", matrCode);
		map.put("V_MATR_NAME", matrName);
		map.put("o_cursor", null);
		MatrCodeSService.selGridMain(map);
		List<MatrCodeS> matrCodelist = (List<MatrCodeS>) map.get("o_cursor");
		return matrCodelist;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/formSearch",method = RequestMethod.POST)
	public List<MatrCodeS> selFormMain(HttpServletRequest request, HttpServletResponse response,HttpSession session,MatrCodeS matrCodeS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		DateFormatUtil df = new DateFormatUtil();

		String compId = (String) session.getAttribute("compId");
		String matrCode = matrCodeS.getMatrCode();
		map.put("V_COMPID", compId);
		map.put("V_MATR_CODE", matrCode);
		map.put("o_cursor", null);
		MatrCodeSService.selFormMain(map);
		List<MatrCodeS> matrCodelist = (List<MatrCodeS>) map.get("o_cursor");
		for(int i = 0; i<matrCodelist.size(); i++){
			matrCodelist.get(i).setEnterDate(df.dateToString2(matrCodelist.get(i).getEnterDate()));
			matrCodelist.get(i).setUseEndDate(df.dateToString2(matrCodelist.get(i).getUseEndDate()));
		}
		return matrCodelist;
	}
}
