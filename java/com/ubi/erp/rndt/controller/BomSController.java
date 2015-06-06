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

import com.ubi.erp.rndt.domain.BomS;
import com.ubi.erp.rndt.service.BomSService;
import com.ubi.erp.rndt.service.GoodsCodeRService;



@RestController
@RequestMapping(value="/erp/rndt/stan/bomS")
public class BomSController {

	
	@Autowired
	private BomSService BomSService;
	private static final Logger logger = LoggerFactory.getLogger(BomSController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridItemSel", method = RequestMethod.POST)
	public List<BomS> selGridItem(HttpServletRequest request, HttpServletResponse response,HttpSession session, BomS BomS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String pCode = request.getParameter("pCode");
		String pName = request.getParameter("pName");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_ITEM_CODE", pCode);
		map.put("V_ITEM_NAME", pName);
		map.put("o_cursor", null);
		BomSService.selGridItem(map);
		List<BomS> list  = (List<BomS>) map.get("o_cursor");
		return list;
	}
}