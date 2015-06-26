package com.ubi.erp.rndt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.rndt.domain.ImpReqR;
import com.ubi.erp.rndt.service.ImpReqRService;



@RestController
@RequestMapping(value = "/erp/rndt/good/impReqR")
public class ImpReqRController {
	@Autowired
	private ImpReqRService ImpReqRService;
	private static final Logger logger = LoggerFactory.getLogger(ImpReqRController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridMain", method = RequestMethod.POST)
	public List<ImpReqR> selGridMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, ImpReqR ImpReqR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String stDate = request.getParameter("stDate");
		String edDate = request.getParameter("edDate");
		String custCode = request.getParameter("custCode");
		String reqEmp = request.getParameter("reqEmp");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_ST_DATE", stDate);
		map.put("V_ED_DATE", edDate);
		map.put("V_CUST_CODE", custCode);
		map.put("V_REQ_EMP", reqEmp);
		map.put("o_cursor", null);
		ImpReqRService.selGridMain(map);
		List<ImpReqR> list = (List<ImpReqR>) map.get("o_cursor");
		return list;
	}
}