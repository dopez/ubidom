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
import com.ubi.erp.pers.domain.MonthByDiliR;
import com.ubi.erp.pers.service.MonthByDiliRService;

@RestController
@RequestMapping(value = "/erp/pers/dili/monthByDiliR")
public class MonthByDiliRController {

	@Autowired
	private MonthByDiliRService monthByDiliRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<MonthByDiliR> selMonthByDiliR(HttpServletRequest request, HttpServletResponse response,HttpSession session,MonthByDiliR monthByDiliR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		DateFormatUtil df = new DateFormatUtil();
		String compId = (String) session.getAttribute("compId");
		String frYymm = df.monthToString(monthByDiliR.getFrYymm());
		String toYymm = df.monthToString(monthByDiliR.getToYymm());
		String postCode = monthByDiliR.getPostCode();
		String jikgun = monthByDiliR.getJikgun();
		map.put("compId", compId);
     	map.put("frYymm", frYymm);
     	map.put("toYymm", toYymm);
		map.put("postCode", postCode);
		map.put("jikgun", jikgun);
		map.put("o_cursor", null);
		monthByDiliRService.selMonthByDiliR(map);
		List<MonthByDiliR> list = (List<MonthByDiliR>) map.get("o_cursor");
		return list;
	}
	

}
