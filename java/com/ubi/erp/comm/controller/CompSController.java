package com.ubi.erp.comm.controller;

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
import com.ubi.erp.comm.domain.CompS;
import com.ubi.erp.comm.service.CompSService;

@RestController
@RequestMapping(value = "/erp/comm/stan/compS")
public class CompSController {

	@Autowired
	private CompSService compSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selLeft",method = RequestMethod.POST)
	public List<CompS> selCompSL(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_cursor", null);
		compSService.selCompSL(map);
		List<CompS> list = (List<CompS>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selRight",method = RequestMethod.POST)
	public List<CompS> selCompSR(HttpServletRequest request, HttpServletResponse response,CompS compS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = compS.getCompId();
		map.put("compId", compId);
		map.put("o_cursor", null);
		compSService.selCompSR(map);
		List<CompS> list = (List<CompS>) map.get("o_cursor");
		DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			list.get(i).setStartDate(df.dateToString2(list.get(i).getStartDate()));
		}
		return list;
	}
	
	@RequestMapping(value = "/prcsCompS", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsCompS(HttpServletRequest request, HttpServletResponse response,HttpSession session,CompS compS) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		DateFormatUtil df = new DateFormatUtil();

		compS.setSysEmpNo(sysEmpNo);
		compS.setStartDate(df.dateToString(compS.getStartDate()));

		if("INSERT".equals(compS.getCudKey())) {
			compSService.prcsCompS(compS);
		}else if("UPDATE".equals(compS.getCudKey())){
			compSService.prcsCompS(compS);
		}else if("DELETE".equals(compS.getCudKey())){
			compSService.prcsCompS(compS);
		}
	}
	
}
