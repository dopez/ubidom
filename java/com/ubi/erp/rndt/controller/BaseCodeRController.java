package com.ubi.erp.rndt.controller;

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

import com.ubi.erp.rndt.domain.BaseCodeR;
import com.ubi.erp.rndt.service.BaseCodeRService;

@RestController
@RequestMapping(value = "/erp/comm/stan/baseCodeR")
public class BaseCodeRController {
	@Autowired
	private BaseCodeRService baseCodeRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel",method = RequestMethod.POST)
	public List<BaseCodeR> selBaseCode(HttpServletRequest request,HttpServletResponse response, HttpSession session, BaseCodeR BaseCodeR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String comp = (String) session.getAttribute("compId");
		String code; 
		String codeName; 
		String interCode; 
		String interName; 
		
		if(request.getParameter("baseCode").equals("")){
			code = "%";
		}else{
			code = request.getParameter("baseCode");
		}
		if(request.getParameter("baseName").equals("")){
			codeName = "%";
		}else{
			codeName = request.getParameter("baseName");
		}
		if(request.getParameter("interCode").equals("")){
			interCode = "%";
		}else{
			interCode = request.getParameter("interCode");
		}
		if(request.getParameter("interName").equals("")){
			interName = "%";
		}else{
			interName = request.getParameter("interName");
		}
		
		map.put("comp", comp);
		map.put("code", code);
		map.put("codeName", codeName);
		map.put("interCode", interCode);
		map.put("interName", interName);
		map.put("P_RST", null);
		baseCodeRService.selBaseCodeR(map);
		List<BaseCodeR> list = (List<BaseCodeR>) map.get("P_RST");
		return list;
	}
}
