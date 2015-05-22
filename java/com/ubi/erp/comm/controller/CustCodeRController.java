package com.ubi.erp.comm.controller;

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

import com.ubi.erp.comm.domain.CustCodeR;
import com.ubi.erp.comm.service.CustCodeRService;

@RestController
@RequestMapping(value = "/erp/comm/CustCodeR")
public class CustCodeRController {
	@Autowired
	private CustCodeRService custCodeRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public List<CustCodeR> selCustCode(HttpServletRequest request,HttpServletResponse response, HttpSession session, CustCodeR custCodeR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String comp = (String) session.getAttribute("compId");
		String name = request.getParameter("name");
		String code = request.getParameter("code");
		map.put("V_COMPID", comp);
		map.put("V_CUST_CODE", code);
		map.put("V_CUST_NAME", name);
		map.put("o_cursor", null);
		custCodeRService.selCustCode(map);
		List<CustCodeR> custCodelist = (List<CustCodeR>) map.get("o_cursor");
		return custCodelist;
	}
}
