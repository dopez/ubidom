package com.ubi.erp.pers.controller;

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

import com.ubi.erp.pers.domain.AgeByPersonR;
import com.ubi.erp.pers.service.AgeByPersonRService;
import com.ubi.erp.sale.controller.CustCompRController;

@RestController
@RequestMapping(value = "/erp/pers/pers/ageByPersonR")
public class AgeByPersonRController {
	 private static final Logger logger = LoggerFactory.getLogger(AgeByPersonRController.class);

	@Autowired
	private AgeByPersonRService ageByPersonRService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/search",method = RequestMethod.POST)
	public List<AgeByPersonR> selLicenseDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String serveGbn = request.getParameter("serveGbn");
		String jikGun= request.getParameter("jikGun");
		logger.debug(compId);
		logger.debug(serveGbn);
		logger.debug(jikGun);
		map.put("V_COMP_ID", compId);
		map.put("V_JIKGUN", "%");
		map.put("V_SERVE_GBN","%");
		map.put("o_cursor", null);
		ageByPersonRService.selAgeByPersonR(map);
		List<AgeByPersonR> list = (List<AgeByPersonR>) map.get("o_cursor");
		return list;
	}
}
