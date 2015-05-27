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
import com.ubi.erp.pers.domain.MonthByJoinRetireR;
import com.ubi.erp.pers.service.MonthByJoinRetireRService;

@RestController
@RequestMapping(value = "/erp/pers/pers/monthByJoinRetireR")
public class MonthByJoinRetireRController {
	
	@Autowired
	private MonthByJoinRetireRService monthByJoinRetireRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/gridMainSearch",method = RequestMethod.POST)
	public List<MonthByJoinRetireR> selDeptR(HttpServletRequest request, HttpServletResponse response,HttpSession session,MonthByJoinRetireR monthByJoinRetireR) throws Exception {
		String compId = (String) session.getAttribute("compId");
		DateFormatUtil df = new DateFormatUtil();
		String kind = monthByJoinRetireR.getKind();
		String frDate = monthByJoinRetireR.getFrDate();
		String toDate = monthByJoinRetireR.getToDate();
		frDate = df.dateToString(frDate);
		toDate = df.dateToString(toDate);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("kind", kind);
		map.put("frDate", frDate);
		map.put("toDate", toDate);
		map.put("o_cursor", null);
		monthByJoinRetireRService.selMonthByJoinRetireR(map);
		List<MonthByJoinRetireR> list = (List<MonthByJoinRetireR>) map.get("o_cursor");
		
		for(int i = 0; i<list.size();i++){
			list.get(i).setEnterDate(df.dateToString2(list.get(i).getEnterDate()));
			list.get(i).setRetireDate(df.dateToString2(list.get(i).getRetireDate()));
		}
		return list;
	}
}