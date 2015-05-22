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

import com.ubi.erp.pers.domain.EducationDataS;
import com.ubi.erp.pers.service.EducationDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/educationDataS")
public class EducationDataSController {
	
	@Autowired
	private EducationDataSService educationDataSSErvice;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selLeft",method = RequestMethod.POST)
	public List<EducationDataS> selEducationDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,EducationDataS educationDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String serveGbn = educationDataS.getServeGbn();
		String jikgun = educationDataS.getJikgun();
		String postCode;
		String empNo;
		if(request.getParameter("postCode").equals("")){
			postCode = "%";
		}else{
			postCode = request.getParameter("postCode");
		}
		if(request.getParameter("empNo").equals("")){
			empNo = "%";
		}else{
			empNo = request.getParameter("empNo");
		}
		map.put("compId", compId);
		map.put("postCode", postCode);
		map.put("empNo",empNo);
		map.put("jikgun",jikgun);
		map.put("serveGbn",serveGbn);
		map.put("o_cursor", null);
		educationDataSSErvice.selEducationDataSL(map);
		List<EducationDataS> list = (List<EducationDataS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selRight",method = RequestMethod.POST)
	public List<EducationDataS> selEducationDataSR(HttpServletRequest request, HttpServletResponse response,EducationDataS educationDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = educationDataS.getCompId();
		String empNo = educationDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		educationDataSSErvice.selEducationDataSR(map);
		List<EducationDataS> list = (List<EducationDataS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/prcsEducationDataS", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEducationDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<EducationDataS> list = new ArrayList<EducationDataS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<EducationDataS>>(){});
		
		for(EducationDataS educationDataS : list) {
			educationDataS.setSysEmpNo(sysEmpNo);

			if("INSERT".equals(educationDataS.getCudKey())) {
				educationDataSSErvice.prcsEducationDataS(educationDataS);
			}else if("UPDATE".equals(educationDataS.getCudKey())){
				educationDataSSErvice.prcsEducationDataS(educationDataS);
			}else if("DELETE".equals(educationDataS.getCudKey())){
				educationDataSSErvice.prcsEducationDataS(educationDataS);
			}
		}
	}

}
