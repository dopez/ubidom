package com.ubi.erp.prod1.controller;

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
import com.ubi.erp.prod1.domain.HistoryS;
import com.ubi.erp.prod1.service.HistorySService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/historyS")
public class HistorySController {
	
	@Autowired
	private HistorySService historySSservice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<HistoryS> selEquiHistorySL(HttpServletRequest request, HttpServletResponse response,HttpSession session,HistoryS historyS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String equiCode = historyS.getEquiCode();
		String supplyComp = historyS.getSupplyComp();
		map.put("equiCode", equiCode);
		map.put("supplyComp", supplyComp);
		map.put("o_cursor", null);
		historySSservice.selEquiHistorySL(map);
		List<HistoryS> list = (List<HistoryS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridFormSearch",method = RequestMethod.POST)
	public List<FamilyDataS> selEquiHistorySR(HttpServletRequest request, HttpServletResponse response,HistoryS historyS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String equiCode = historyS.getEquiCode();
		map.put("equiCode", equiCode);
		map.put("o_cursor", null);
		historySSservice.selEquiHistorySR(map);
		List<FamilyDataS> list = (List<FamilyDataS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridFormSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFamilyDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<HistoryS> list = new ArrayList<HistoryS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<HistoryS>>(){});
		
		for(HistoryS historyS : list) {
			historyS.setSysEmpNo(sysEmpNo);
			historySSservice.prcsEquiHistoryS(historyS);
		}
	}

}
