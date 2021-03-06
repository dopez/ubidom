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

import com.ubi.erp.pers.domain.DayByOvertimeR;
import com.ubi.erp.pers.service.DayByOvertimeRService;

@RestController
@RequestMapping(value = "/erp/pers/dili/dayByOvertimeR")
public class DayByOvertimeRController {

	@Autowired
	private DayByOvertimeRService dayByOvertimeRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<DayByOvertimeR> selDayByDiliR(HttpServletRequest request, HttpServletResponse response,HttpSession session,DayByOvertimeR dayByOvertimeR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String workDate = dayByOvertimeR.getWorkDate();
		String postCode = dayByOvertimeR.getPostName();
		map.put("compId", compId);
		map.put("workDate", workDate);
		map.put("postCode", postCode);
		map.put("o_cursor", null);
		dayByOvertimeRService.selDayByOvertimeR(map);
		List<DayByOvertimeR> list = (List<DayByOvertimeR>) map.get("o_cursor");
		return list;
	}
}
