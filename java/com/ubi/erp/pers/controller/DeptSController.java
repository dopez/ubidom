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
import com.ubi.erp.pers.domain.DeptS;
import com.ubi.erp.pers.service.DeptSService;

@RestController
@RequestMapping(value = "/erp/pers/stan/deptS")
public class DeptSController {
	
	@Autowired
	private DeptSService deptSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<DeptS> selDept(HttpServletRequest request, HttpServletResponse response,HttpSession session,DeptS deptS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String postCode = request.getParameter("postCode");
		String postName = request.getParameter("postName");
		map.put("compId", compId);
		map.put("postCode", postCode);
		map.put("postName", postName);
		map.put("o_cursor", null);
		deptSService.selDeptS(map);
		List<DeptS> list = (List<DeptS>) map.get("o_cursor");
		DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			list.get(i).setStDate(df.dateToString2(list.get(i).getStDate()));
			list.get(i).setEndDate(df.dateToString2(list.get(i).getEndDate()));
		}
		return list;
	}

	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsDept(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<DeptS> list = new ArrayList<DeptS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<DeptS>>(){});
		DateFormatUtil df = new DateFormatUtil();
		
		for(DeptS deptS : list) {
			deptS.setPostNameMst(deptS.getPostName());
			deptS.setSysEmpNo(sysEmpNo);
			deptS.setCompId(compId);
			deptS.setStDate(df.dateToString(deptS.getStDate()));
			deptS.setEndDate(df.dateToString(deptS.getEndDate()));
			if("INSERT".equals(deptS.getCudKey())) {
				deptSService.prcsDeptS(deptS);
			}else if("UPDATE".equals(deptS.getCudKey())){
				deptSService.prcsDeptS(deptS);
			}else if("DELETE".equals(deptS.getCudKey())){
				deptSService.prcsDeptS(deptS);
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch", method = RequestMethod.POST)
	public List<DeptS> selDeptCode(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String postName;
		if(request.getParameter("postName").equals("")){
			postName = "%";
		}else{
			postName = request.getParameter("postName");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("postName", postName);
		map.put("o_cursor", null);
		deptSService.selDeptCodeS(map);
		List<DeptS> list = (List<DeptS>) map.get("o_cursor");
		return list;
	}

}
