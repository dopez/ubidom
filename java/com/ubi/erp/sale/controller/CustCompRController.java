package com.ubi.erp.sale.controller;

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

import com.ubi.erp.sale.domain.CustCompR;
import com.ubi.erp.sale.service.CustCompRService;

@RestController
@RequestMapping(value = "/erp/sale/stan/custCompR")
public class CustCompRController {

    private static final Logger logger = LoggerFactory.getLogger(CustCompRController.class);

    @Autowired
	private CustCompRService custCompRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search",method = RequestMethod.POST)
	public List<CustCompR> getMasterSearch(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception {

	    Map<String, Object> map = new HashMap<String, Object>();

	    String compId = (String) session.getAttribute("compId");

	    String custCode = request.getParameter("custCode");
	    String custName = request.getParameter("custName");

	    String custKindA = request.getParameter("custKindA");
	    String custKindB = request.getParameter("custKindB");
	    String custKindL = request.getParameter("custKindL");
	    String custKindH = request.getParameter("custKindH");
	    String custKindC = request.getParameter("custKindC");
	    String custKindZ = request.getParameter("custKindZ");
	    String custKindE = request.getParameter("custKindE");

		map.put("V_COMPID",compId);
		map.put("V_CUST_CODE",custCode);
		map.put("V_CUST_NAME",custName);
		map.put("V_CUST_KIND_A",custKindA);
		map.put("V_CUST_KIND_B",custKindB);
		map.put("V_CUST_KIND_L",custKindL);
		map.put("V_CUST_KIND_H",custKindH);
		map.put("V_CUST_KIND_C",custKindC);
		map.put("V_CUST_KIND_Z",custKindZ);
		map.put("V_CUST_KIND_E",custKindE);
		map.put("o_cursor", null);

		custCompRService.getSearch(map);

 		List<CustCompR> list = (List<CustCompR>) map.get("o_cursor");
 		logger.debug("mst resultset is "+list);

		return list;
	}
}
