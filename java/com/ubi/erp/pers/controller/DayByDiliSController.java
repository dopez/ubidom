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

import com.ubi.erp.pers.domain.DayByDiliS;
import com.ubi.erp.pers.service.DayByDiliSService;

@RestController
@RequestMapping(value = "/erp/pers/dili/dayByDiliS")
public class DayByDiliSController {

	@Autowired
	private DayByDiliSService dayByDiliSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<DayByDiliS> selDayByDiliS(HttpServletRequest request, HttpServletResponse response,HttpSession session,DayByDiliS dayByDiliS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String postCode = dayByDiliS.getPostCode();
		String workDate = dayByDiliS.getWorkDay();
		String jikgun = dayByDiliS.getJikgun();
		map.put("compId", compId);
		map.put("workDate", workDate);
		map.put("postCode", postCode);
		map.put("jikgun", jikgun);
		map.put("o_cursor", null);
		dayByDiliSService.selDayByDiliS(map);
		List<DayByDiliS> list = (List<DayByDiliS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsDayByDiliS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<DayByDiliS> list = new ArrayList<DayByDiliS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<DayByDiliS>>(){});
		dayByDiliSService.prcsDayByDiliS(list,sysEmpNo);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridPopSearch",method = RequestMethod.POST)
	public List<DayByDiliS> gridPopSearch(HttpServletRequest request, HttpServletResponse response,HttpSession session,DayByDiliS dayByDiliS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String frDate = dayByDiliS.getFrDate();
		String toDate = dayByDiliS.getToDate();
		map.put("compId", compId);
		map.put("frDate", frDate);
		map.put("toDate", toDate);
		map.put("o_cursor", null);
		dayByDiliSService.selDayByDiliSPopC(map);
		List<DayByDiliS> list = (List<DayByDiliS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridPopSave",method = RequestMethod.POST)
	public void gridPopSave(HttpServletRequest request, HttpServletResponse response,HttpSession session,DayByDiliS dayByDiliS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String empNo = (String) session.getAttribute("empNo");
		dayByDiliS.setCompId(compId);
		dayByDiliS.setEmpNo(empNo);
		dayByDiliSService.prcsDayByDiliSPopI(dayByDiliS);
	}
	
}
