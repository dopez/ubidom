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

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
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
		DateFormatUtil df = new DateFormatUtil();
		String compId = (String) session.getAttribute("compId");
		String workDate = df.dateToString(dayByOvertimeR.getWorkDate());
		String postCode = dayByOvertimeR.getPostCode();
		map.put("compId", compId);
		map.put("workDate", workDate);
		map.put("postCode", postCode);
		map.put("o_cursor", null);
		dayByOvertimeRService.selDayByOvertimeR(map);
		List<DayByOvertimeR> list = (List<DayByOvertimeR>) map.get("o_cursor");
		
		for(int i = 0; i<list.size();i++){
			list.get(i).setWorkDate(df.dateToString2(list.get(i).getWorkDate()));
		}
		return list;
	}
}
