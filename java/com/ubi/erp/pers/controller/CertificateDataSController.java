package com.ubi.erp.pers.controller;

import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.JasperReportUtil;
import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.pers.domain.CertificateDataS;
import com.ubi.erp.pers.service.CertificateDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/certificateDataS")
public class CertificateDataSController {
	
	@Autowired
	private CertificateDataSService certificateDataSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<CertificateDataS> selCertificateDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session,CertificateDataS certificateDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		DateFormatUtil df = new DateFormatUtil();
		String compId = (String) session.getAttribute("compId");
		String stDate = df.dateToString(certificateDataS.getStDate());
		String endDate = df.dateToString(certificateDataS.getEndDate());
		map.put("compId", compId);
		map.put("stDate", stDate);
		map.put("endDate",endDate);
		map.put("o_cursor", null);
		certificateDataSService.selCertificateDataS(map);
		List<CertificateDataS> list = (List<CertificateDataS>) map.get("o_cursor");
		
		for(int i = 0; i<list.size();i++){
			list.get(i).setApplyDate(df.dateToString2(list.get(i).getApplyDate()));
			list.get(i).setPasspostDate(df.dateToString2(list.get(i).getPasspostDate()));
		}
		return list;
	}

	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsCertificateDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String compId = (String) session.getAttribute("compId");
		String jsonData = request.getParameter("jsonData");
		List<CertificateDataS> list = new ArrayList<CertificateDataS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<CertificateDataS>>(){});
		DateFormatUtil df = new DateFormatUtil();
		
		for(CertificateDataS certificateDataS : list) {
			certificateDataS.setCompId(compId);
			certificateDataS.setSysEmpNo(sysEmpNo);
			certificateDataS.setApplyDate(df.dateToString(certificateDataS.getApplyDate()));
			certificateDataS.setPasspostDate(df.dateToString(certificateDataS.getPasspostDate()));
			
			if("INSERT".equals(certificateDataS.getCudKey())) {
				certificateDataSService.prcsCertificateDataS(certificateDataS);
			}else if("UPDATE".equals(certificateDataS.getCudKey())){
				certificateDataSService.prcsCertificateDataS(certificateDataS);
			}else if("DELETE".equals(certificateDataS.getCudKey())){
				certificateDataSService.prcsCertificateDataS(certificateDataS);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/report/CertificateDataP")
	public ModelAndView CertificateDataP(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ParseException {
		String compId = (String) session.getAttribute("compId");
		String empNo = request.getParameter("empNo");
		String passpostDate = request.getParameter("passpostDate");
		String passpostNo = request.getParameter("passpostNo");
		DateFormatUtil df = new DateFormatUtil();
		passpostDate = df.dateToString(passpostDate);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("passpostDate", passpostDate);
		map.put("passpostNo", passpostNo);
		map.put("o_cursor", null);
		certificateDataSService.CertificateDataP(map);
		List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("o_cursor");
		return JasperReportUtil.render("certificateDataP",list, "pdf");
	}
}
