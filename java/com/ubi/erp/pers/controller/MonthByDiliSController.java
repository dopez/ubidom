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
import com.ubi.erp.pers.domain.MonthByDiliS;
import com.ubi.erp.pers.service.MonthByDiliSService;

@RestController
@RequestMapping(value = "/erp/pers/dili/monthByDiliS")
public class MonthByDiliSController {

	@Autowired
	private MonthByDiliSService monthByDiliSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<MonthByDiliS> selGridMst(HttpServletRequest request, HttpServletResponse response,HttpSession session,MonthByDiliS monthByDiliS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		DateFormatUtil df = new DateFormatUtil();
		String compId = (String) session.getAttribute("compId");
		/*String postCode = monthByDiliS.getPostCode();
		String workDate = df.dateToString(monthByDiliS.getWorkDate());
		String jikgun = monthByDiliS.getJikgun();*/
		map.put("compId", compId);
/*		map.put("workDate", workDate);
		map.put("postCode", postCode);
		map.put("jikgun", jikgun);*/
		map.put("o_cursor", null);
		monthByDiliSService.selGridMst(map);
		List<MonthByDiliS> list = (List<MonthByDiliS>) map.get("o_cursor");
		
/*		for(int i = 0; i<list.size();i++){
			list.get(i).setWorkDate(df.dateToString2(list.get(i).getWorkDate()));
		}*/
		return list;
	}
	
	
}
