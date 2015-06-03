package com.ubi.erp.pers.controller;

import java.text.ParseException;
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
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.JasperReportUtil;
import com.ubi.erp.pers.domain.DeptR;
import com.ubi.erp.pers.service.DeptRService;

@RestController
@RequestMapping(value = "/erp/pers/stan/deptR")
public class DeptRController {
	@Autowired
	private DeptRService deptRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/gridMainSearch",method = RequestMethod.POST)
	public List<DeptR> selDeptR(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String postName;
		if(request.getParameter("postName").equals("")){
			postName = "%";
		}else{
			postName = request.getParameter("postName");
		}
		String historyKind = request.getParameter("historyKind");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("postCode", "%");
		map.put("postName", postName);
		map.put("historyKind", historyKind);
		map.put("o_cursor", null);
		deptRService.selDeptR(map);
		List<DeptR> list = (List<DeptR>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/report/deptR")
	public ModelAndView reportPdf(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ParseException {
		String compId = (String) session.getAttribute("compId");
		String postName;
		if(request.getParameter("postName").equals("")){
			postName = "%";
		}else{
			postName = request.getParameter("postName");
		}
		String historyKind = request.getParameter("historyKind");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("postCode", "%");
		map.put("postName", postName);
		map.put("historyKind", historyKind);
		map.put("o_cursor", null);
		deptRService.selDeptR(map);
		List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("o_cursor");
		return JasperReportUtil.render("deptR",list, "pdf");
	}
	
}
