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

import com.ubi.erp.pers.domain.Dept;
import com.ubi.erp.pers.service.DeptSService;

@RestController
@RequestMapping(value = "/erp/deptS")
public class DeptSController {
	
	@Autowired
	private DeptSService deptSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public List<Dept> selDept(HttpServletRequest request, HttpServletResponse response,HttpSession session,Dept dept) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String postCode = request.getParameter("postCode");
		String postName = request.getParameter("postName");
		map.put("compId", compId);
		map.put("postCode", postCode);
		map.put("postName", postName);
		map.put("o_cursor", null);
		deptSService.selDeptS(map);
		List<Dept> list = (List<Dept>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/prcsDept", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsDept(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("compId");
		String jsonData = request.getParameter("jsonData");
		List<Dept> list = new ArrayList<Dept>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<Dept>>(){});

		for (Dept dept : list) {
			dept.setPostNameMst(dept.getPostName());
			dept.setSysEmpNo(sysEmpNo);
			dept.setCompId(compId);
			deptSService.crudDeptS(dept);
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selDeptCode", method = RequestMethod.POST)
	public List<Dept> selDeptCode(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String postName;
		if(request.getParameter("postName").equals(" ")){
			postName = "%";
		}else{
			postName = request.getParameter("postName");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("postName", postName);
		map.put("o_cursor", null);
		deptSService.selDeptCodeS(map);
		List<Dept> list = (List<Dept>) map.get("o_cursor");
		return list;
	}

}
