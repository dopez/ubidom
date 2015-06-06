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

import com.ubi.erp.rndt.domain.GoodsCodeR;
import com.ubi.erp.rndt.service.GoodsCodeRService;



@RestController
@RequestMapping(value="/erp/rndt/stan/goodsCodeR")
public class GoodsCodeRController {

	
	@Autowired
	private GoodsCodeRService GoodsCodeRService;
	private static final Logger logger = LoggerFactory.getLogger(GoodsCodeRController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<GoodsCodeR> selGridMain(HttpServletRequest request, HttpServletResponse response,HttpSession session, GoodsCodeR GoodsCodeR) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String pCode = request.getParameter("pCode");
		String pName = request.getParameter("pName");
		String pGubn = request.getParameter("pGubn");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_ITEM_CODE", pCode);
		map.put("V_ITEM_NAME", pName);
		map.put("V_ITEM_GUBN", pGubn);
		map.put("o_cursor", null);
		GoodsCodeRService.selGridMain(map);
		List<GoodsCodeR> list  = (List<GoodsCodeR>) map.get("o_cursor");
		return list;
	}
}