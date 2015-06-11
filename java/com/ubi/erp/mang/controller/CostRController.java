package com.ubi.erp.mang.controller;

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

import com.ubi.erp.mang.domain.CostS;
import com.ubi.erp.mang.service.CostRService;

@RestController
@RequestMapping(value = "/erp/mang/stan/costS")
public class CostRController {

	@Autowired
	private CostRService costRService;
	@SuppressWarnings("unchecked")

	@RequestMapping(value = "/searchA",method = RequestMethod.POST)
	public List<CostS> getSrhA(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String itemDiv = request.getParameter("itemDiv");
		String ioChk = request.getParameter("ioChk");
		String itemName = request.getParameter("itemName");
		String custName = request.getParameter("custName");

		map.put("V_COMPID", compId);
		map.put("V_ITEM_DIV",itemDiv);
		map.put("V_IO_CHK", ioChk);
		map.put("V_ITEM_CODE",itemName);
		map.put("V_CUST_CODE",custName);
		map.put("o_cursor",null);

		costRService.getSrhA(map);

		return (List<CostS>) map.get("o_cursor");

	}
}
