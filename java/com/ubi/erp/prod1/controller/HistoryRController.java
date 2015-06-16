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

import com.ubi.erp.prod1.domain.HistoryR;
import com.ubi.erp.prod1.service.HistoryRService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/historyR")
public class HistoryRController {

	@Autowired
	private HistoryRService historyRSservice;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch", method = RequestMethod.POST)
	public List<HistoryR> selEquiHistoryR(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, HistoryR historyR)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String equiCode = historyR.getEquiCode();
		map.put("compId", compId);
		map.put("equiCode", equiCode);
		map.put("o_cursor", null);
		historyRSservice.selEquiHistoryR(map);
		List<HistoryR> list = (List<HistoryR>) map.get("o_cursor");
		return list;
	}

}
