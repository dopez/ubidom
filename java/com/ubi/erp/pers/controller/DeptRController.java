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

import com.ubi.erp.pers.domain.Dept;
import com.ubi.erp.pers.service.DeptRService;

@RestController
@RequestMapping(value = "/erp/deptR")
public class DeptRController {
	@Autowired
	private DeptRService deptRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public List<Dept> selDept(HttpServletRequest request,HttpServletResponse response, HttpSession session, Dept dept) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String postCode = request.getParameter("postCode");
		String postName = request.getParameter("postName");
		map.put("compId", compId);
		map.put("postCode", postCode);
		map.put("postName", postName);
		map.put("o_cursor", null);
		deptRService.selDeptR(map);
		List<Dept> list = (List<Dept>) map.get("o_cursor");
		return list;
	}
}
