package com.ubi.erp.pers.controller;

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

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.pers.domain.AcademicDataS;
import com.ubi.erp.pers.service.AcademicDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/academicDataS")
public class AcademicDataSController {
	
	@Autowired
	private AcademicDataSService academicDataSSservice;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<AcademicDataS> selAcademicDataSR(HttpServletRequest request, HttpServletResponse response,AcademicDataS academicDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = academicDataS.getCompId();
		String empNo = academicDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		academicDataSSservice.selAcademicDataSR(map);
		List<AcademicDataS> list = (List<AcademicDataS>) map.get("o_cursor");
		DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			list.get(i).setStartDate(df.dateToString2(list.get(i).getStartDate()));
			list.get(i).setEndDate(df.dateToString2(list.get(i).getEndDate()));
		}
		return list;
	}
	
	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsAcademicDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<AcademicDataS> list = new ArrayList<AcademicDataS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<AcademicDataS>>(){});
		DateFormatUtil df = new DateFormatUtil();
		
		for(AcademicDataS academicDataS : list) {
			academicDataS.setSysEmpNo(sysEmpNo);
			academicDataS.setStartDate(df.dateToString(academicDataS.getStartDate()));
			academicDataS.setEndDate(df.dateToString(academicDataS.getEndDate()));
			
			if("INSERT".equals(academicDataS.getCudKey())) {
				academicDataSSservice.prcsAcademicDataS(academicDataS);
			}else if("UPDATE".equals(academicDataS.getCudKey())){
				academicDataSSservice.prcsAcademicDataS(academicDataS);
			}else if("DELETE".equals(academicDataS.getCudKey())){
				academicDataSSservice.prcsAcademicDataS(academicDataS);
			}
		}
	}
	
}
