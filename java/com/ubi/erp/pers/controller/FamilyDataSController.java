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

import com.ubi.erp.pers.domain.FamilyDataS;
import com.ubi.erp.pers.service.FamilyDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/familyDataS")
public class FamilyDataSController {

	@Autowired
	private FamilyDataSService familyDataSSservice;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<FamilyDataS> selFamilyDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,FamilyDataS familyDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String serveGbn = familyDataS.getServeGbn();
		String jikgun = familyDataS.getJikgun();
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
		familyDataSSservice.selFamilyDataSL(map);
		List<FamilyDataS> list = (List<FamilyDataS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<FamilyDataS> selFamilyDataSR(HttpServletRequest request, HttpServletResponse response,FamilyDataS familyDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = familyDataS.getCompId();
		String empNo = familyDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		familyDataSSservice.selFamilyDataSR(map);
		List<FamilyDataS> list = (List<FamilyDataS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFamilyDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<FamilyDataS> list = new ArrayList<FamilyDataS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<FamilyDataS>>(){});
		
		for(FamilyDataS familyDataS : list) {
			familyDataS.setSysEmpNo(sysEmpNo);

			if("INSERT".equals(familyDataS.getCudKey())) {
				familyDataSSservice.prcsFamilyDataS(familyDataS);
			}else if("UPDATE".equals(familyDataS.getCudKey())){
				familyDataSSservice.prcsFamilyDataS(familyDataS);
			}else if("DELETE".equals(familyDataS.getCudKey())){
				familyDataSSservice.prcsFamilyDataS(familyDataS);
			}
		}
	}

}
