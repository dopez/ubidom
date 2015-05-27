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
import com.ubi.erp.pers.domain.GuaranteeDataS;
import com.ubi.erp.pers.service.GuaranteeDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/guaranteeDataS")
public class GuaranteeDataSController {
	
	@Autowired
	private GuaranteeDataSService guaranteeDataSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtl01Search",method = RequestMethod.POST)
	public List<GuaranteeDataS> selGuaranteeDataSR1(HttpServletRequest request, HttpServletResponse response,GuaranteeDataS guaranteeDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = guaranteeDataS.getCompId();
		String empNo = guaranteeDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		guaranteeDataSService.selGuaranteeDataSR1(map);
		List<GuaranteeDataS> list = (List<GuaranteeDataS>) map.get("o_cursor");
		DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			list.get(i).setStartDate(df.dateToString2(list.get(i).getStartDate()));
			list.get(i).setEndDate(df.dateToString2(list.get(i).getEndDate()));
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtl02Search",method = RequestMethod.POST)
	public List<GuaranteeDataS> selGuaranteeDataSR2(HttpServletRequest request, HttpServletResponse response,GuaranteeDataS guaranteeDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = guaranteeDataS.getCompId();
		String empNo = guaranteeDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		guaranteeDataSService.selGuaranteeDataSR2(map);
		List<GuaranteeDataS> list = (List<GuaranteeDataS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGuaranteeDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		String jsonData2 = request.getParameter("jsonData2");
		List<GuaranteeDataS> list1 = null;
		List<GuaranteeDataS> list2 = null;
		
		ObjectMapper mapper1;
		ObjectMapper mapper2;

		if(jsonData != null){
			list1 = new ArrayList<GuaranteeDataS>();
			mapper1 = new ObjectMapper();
			list1 = mapper1.readValue(jsonData, new TypeReference<ArrayList<GuaranteeDataS>>(){});
		}
		if(jsonData2 != null){
			list2 = new ArrayList<GuaranteeDataS>();
			mapper2 = new ObjectMapper();
			list2 = mapper2.readValue(jsonData2, new TypeReference<ArrayList<GuaranteeDataS>>(){});
		}
		DateFormatUtil df = new DateFormatUtil();
		
		for(GuaranteeDataS guaranteeDataS : list1) {
			guaranteeDataS.setSysEmpNo(sysEmpNo);
			if("INSERT".equals(guaranteeDataS.getCudKey())) {
				guaranteeDataSService.prcsGuaranteeDataS2(guaranteeDataS);
			}else if("UPDATE".equals(guaranteeDataS.getCudKey())){
				guaranteeDataSService.prcsGuaranteeDataS2(guaranteeDataS);
			}else if("DELETE".equals(guaranteeDataS.getCudKey())){
				guaranteeDataSService.prcsGuaranteeDataS2(guaranteeDataS);
			}
		}
		
		for(GuaranteeDataS guaranteeDataS : list2) {
			guaranteeDataS.setSysEmpNo(sysEmpNo);
			guaranteeDataS.setStartDate(df.dateToString(guaranteeDataS.getStartDate()));
			guaranteeDataS.setEndDate(df.dateToString(guaranteeDataS.getEndDate()));
			if("INSERT".equals(guaranteeDataS.getCudKey())) {
				guaranteeDataSService.prcsGuaranteeDataS1(guaranteeDataS);
			}else if("UPDATE".equals(guaranteeDataS.getCudKey())){
				guaranteeDataSService.prcsGuaranteeDataS1(guaranteeDataS);
			}else if("DELETE".equals(guaranteeDataS.getCudKey())){
				guaranteeDataSService.prcsGuaranteeDataS1(guaranteeDataS);
			}
		}
	}
}
