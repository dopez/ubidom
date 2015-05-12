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
@RequestMapping(value = "/erp/rndt/baseCodeR")
public class BaseCodeRController {
	@Autowired
	private BaseCodeRService baseCodeRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public List<BaseCodeR> selBaseCode(HttpServletRequest request,HttpServletResponse response, HttpSession session, BaseCodeR BaseCodeR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String code; 
		String codeName; 
		String innerCode; 
		String innerCodeName; 
		
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
		if(request.getParameter("innerCode").equals("")){
			innerCode = "%";
		}else{
			innerCode = request.getParameter("innerCode");
		}
		if(request.getParameter("innerCodeName").equals("")){
			innerCodeName = "%";
		}else{
			innerCodeName = request.getParameter("innerCodeName");
		}
		
		map.put("compId", compId);
		map.put("code", code);
		map.put("codeName", codeName);
		map.put("innerCode", innerCode);
		map.put("innerCodeName", innerCodeName);
		map.put("P_RST", null);
		baseCodeRService.selBaseCodeR(map);
		List<BaseCodeR> list = (List<BaseCodeR>) map.get("P_RST");
		return list;
	}
}
