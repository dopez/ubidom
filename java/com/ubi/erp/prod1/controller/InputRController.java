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

import com.ubi.erp.prod1.domain.InputR;
import com.ubi.erp.prod1.service.InputRService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/inputR")
public class InputRController {
	
	@Autowired
	private InputRService inputRService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<InputR> selEquiOrderR(HttpServletRequest request, HttpServletResponse response, HttpSession session, InputR inputR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String empName = (String) session.getAttribute("empName");
		String pfDate = inputR.getPfDate();
		String ptDate = inputR.getPtDate();
		String custCode = inputR.getCustCode();
		String partCode = inputR.getPartCode();
		map.put("compId", compId);
		map.put("pfDate", pfDate);
		map.put("ptDate", ptDate);
		map.put("custCode", custCode);
		map.put("partCode", partCode);
		map.put("o_cursor", null);
		inputRService.selEquiInputR(map);
		List<InputR> list = (List<InputR>) map.get("o_cursor");
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getInputEmp().equals("admin")) {
				list.get(i).setInputName(empName);
			}
		}
		return list;
	}
}
