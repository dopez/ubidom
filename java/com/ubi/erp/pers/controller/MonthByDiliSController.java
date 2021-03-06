package com.ubi.erp.pers.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.cmm.util.MakeResponseUtil;
import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.pers.domain.MonthByDiliS;
import com.ubi.erp.pers.service.MonthByDiliSService;

@RestController
@RequestMapping(value = "/erp/pers/dili/monthByDiliS")
public class MonthByDiliSController {

	@Autowired
	private MonthByDiliSService monthByDiliSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<MonthByDiliS> selMonthByDiliSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,MonthByDiliS monthByDiliS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String yymm = monthByDiliS.getYymm();
		String postCode = monthByDiliS.getPostName();
		String jikgun = monthByDiliS.getJikgun();
		String empNo = monthByDiliS.getKorName();
		map.put("compId", compId);
     	map.put("yymm", yymm);
		map.put("postCode", postCode);
		map.put("jikgun", jikgun);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		monthByDiliSService.selMonthByDiliSL(map);
		List<MonthByDiliS> list = (List<MonthByDiliS>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<MonthByDiliS> selMonthByDiliSR(HttpServletRequest request, HttpServletResponse response,HttpSession session,MonthByDiliS monthByDiliS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String yymm = monthByDiliS.getYymm();
		String empNo = monthByDiliS.getEmpNo();
		map.put("compId", compId);
     	map.put("yymm", yymm);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		monthByDiliSService.selMonthByDiliSR(map);
		List<MonthByDiliS> list = (List<MonthByDiliS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridMstSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsMonthByDiliS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String sysEmpNo = (String) session.getAttribute("empNo");
			String jsonData = request.getParameter("jsonData");
			String monthDate = request.getParameter("monthDate");
			List<MonthByDiliS> list = new ArrayList<MonthByDiliS>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<MonthByDiliS>>() {
			});
			monthByDiliSService.prcsMonthByDiliS(list, sysEmpNo, monthDate);

			Map<String, String> map = new HashMap<String, String>();
			map.put("rtnCode", "1");
			String jsonStr = new String(JsonUtil.parseToString(map));
			MakeResponseUtil.makeResponse(response, "json", jsonStr);
		} catch (DuplicateKeyException e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR005");
		} catch (Exception e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR002");
		} finally {
			if (!ht.isEmpty()) {
				response.setHeader("EXCEPTION", "Y");
				MakeResponseUtil.makeResponse(response, "json", JsonUtil.parseToString(ht));
			}
		}

	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridPopSearch",method = RequestMethod.POST)
	public List<MonthByDiliS> gridPopSearch(HttpServletRequest request, HttpServletResponse response,HttpSession session,MonthByDiliS monthByDiliS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String yymm = monthByDiliS.getYymm();
		map.put("compId", compId);
		map.put("yymm", yymm);
		map.put("o_cursor", null);
		monthByDiliSService.selMonthByDiliSPopC(map);
		List<MonthByDiliS> list = (List<MonthByDiliS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridPopSave",method = RequestMethod.POST)
	public void gridPopSave(HttpServletRequest request, HttpServletResponse response,HttpSession session,MonthByDiliS monthByDiliS) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String compId = (String) session.getAttribute("compId");
			String empNo = (String) session.getAttribute("empNo");
			String yymm = monthByDiliS.getYymm();
			monthByDiliS.setCompId(compId);
			monthByDiliS.setSysEmpNo(empNo);
			monthByDiliS.setYymm(yymm);

			monthByDiliSService.prcsMonthByDiliSPopI(monthByDiliS);

			Map<String, String> map = new HashMap<String, String>();
			map.put("rtnCode", "1");
			String jsonStr = new String(JsonUtil.parseToString(map));
			MakeResponseUtil.makeResponse(response, "json", jsonStr);
		} catch (DuplicateKeyException e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR005");
		} catch (Exception e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR002");
		} finally {
			if (!ht.isEmpty()) {
				response.setHeader("EXCEPTION", "Y");
				MakeResponseUtil.makeResponse(response, "json", JsonUtil.parseToString(ht));
			}
		}

	}
}
