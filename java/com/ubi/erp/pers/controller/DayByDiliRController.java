package com.ubi.erp.pers.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.pers.domain.DayByDiliR;
import com.ubi.erp.pers.service.DayByDiliRService;

@RestController
@RequestMapping(value = "/erp/pers/dili/dayByDiliR")
public class DayByDiliRController {

	@Autowired
	private DayByDiliRService dayByDiliRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<DayByDiliR> selDayByDiliR(HttpServletRequest request, HttpServletResponse response,HttpSession session,DayByDiliR dayByDiliR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String frDate = dayByDiliR.getFrDate();
		String toDate = dayByDiliR.getToDate();
		String postCode = dayByDiliR.getPostCode();
		String jikgun = dayByDiliR.getJikgun();
		String workKind = dayByDiliR.getWorkKind();
		String empNo = dayByDiliR.getEmpNo();
		String inoutChk = dayByDiliR.getInoutChk();
		map.put("compId", compId);
		map.put("frDate", frDate);
		map.put("toDate", toDate);
		map.put("postCode", postCode);
		map.put("jikgun", jikgun);
		map.put("workKind", workKind);
		map.put("empNo", empNo);
		map.put("inoutChk", inoutChk);
		map.put("o_cursor", null);
		dayByDiliRService.selDayByDiliR(map);
		List<DayByDiliR> list = (List<DayByDiliR>) map.get("o_cursor");
		return list;
	}
}
