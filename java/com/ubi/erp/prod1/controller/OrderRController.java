package com.ubi.erp.prod1.controller;

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

import com.ubi.erp.prod1.domain.OrderR;
import com.ubi.erp.prod1.service.OrderRService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/orderR")
public class OrderRController {
	
	@Autowired
	private OrderRService orderRSservice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<OrderR> selEquiOrderR(HttpServletRequest request, HttpServletResponse response, HttpSession session, OrderR orderR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String empName = (String) session.getAttribute("empName");
		String pfDate = orderR.getPfDate();
		String ptDate = orderR.getPtDate();
		String custCode = orderR.getCustCode();
		String partCode = orderR.getPartCode();
		map.put("compId", compId);
		map.put("pfDate", pfDate);
		map.put("ptDate", ptDate);
		map.put("custCode", custCode);
		map.put("partCode", partCode);
		map.put("o_cursor", null);
		orderRSservice.selEquiOrderR(map);
		List<OrderR> list = (List<OrderR>) map.get("o_cursor");
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOrderEmp().equals("admin")) {
				list.get(i).setOrderName(empName);
			}
		}
		return list;
	}
}
