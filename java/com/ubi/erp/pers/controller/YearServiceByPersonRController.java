package com.ubi.erp.pers.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.pers.domain.YearServiceByPersonR;
import com.ubi.erp.pers.service.YearServiceByPersonRService;

@RestController
@RequestMapping(value = "/erp/pers/pers/yearServiceByPersonR")
public class YearServiceByPersonRController {

	@Autowired
	private YearServiceByPersonRService yearServiceByPersonRSErvice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<YearServiceByPersonR> selYearServiceByPersonRL(HttpServletRequest request, HttpServletResponse response,YearServiceByPersonR yearServiceByPersonR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = yearServiceByPersonR.getCompId();
		String empNo = yearServiceByPersonR.getEmpNo();
		String jikgun = yearServiceByPersonR.getJikgun();
		String postCode = yearServiceByPersonR.getPostCode();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("jikgun", jikgun);
		map.put("postCode", postCode);
		map.put("o_cursor", null);
		yearServiceByPersonRSErvice.selYearServiceByPersonRL(map);
		List<YearServiceByPersonR> list = (List<YearServiceByPersonR>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<YearServiceByPersonR> selYearServiceByPersonRR(HttpServletRequest request, HttpServletResponse response,YearServiceByPersonR yearServiceByPersonR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = yearServiceByPersonR.getCompId();
		String empNo = yearServiceByPersonR.getEmpNo();
		String jikgun = yearServiceByPersonR.getJikgun();
		String postCode = yearServiceByPersonR.getPostCode();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("jikgun", jikgun);
		map.put("postCode", postCode);
		map.put("o_cursor", null);
		yearServiceByPersonRSErvice.selYearServiceByPersonRR(map);
		List<YearServiceByPersonR> list = (List<YearServiceByPersonR>) map.get("o_cursor");
		return list;
	}
}
