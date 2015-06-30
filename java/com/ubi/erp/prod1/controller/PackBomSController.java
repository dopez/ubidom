package com.ubi.erp.prod1.controller;

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
import com.ubi.erp.prod1.domain.PackBomS;
import com.ubi.erp.prod1.service.PackBomSService;

@RestController
@RequestMapping(value = "/erp/prod1/stan/packBomS")
public class PackBomSController {
	
	@Autowired
	private PackBomSService packBomSService;


	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/treeSearch", method = RequestMethod.POST)
	public List<PackBomS> selYearlyPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String keyValue = request.getParameter("keyValue");
		map.put("compId", compId);
		map.put("keyValue", keyValue);
		map.put("o_cursor", null);
		packBomSService.selPackBomSTree(map);
		List<PackBomS> list = (List<PackBomS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/delCheck", method = RequestMethod.POST)
	public List<PackBomS> selPackBomDelChk(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String keyValue = request.getParameter("keyValue");
		map.put("compId", compId);
		map.put("keyValue", keyValue);
		map.put("o_cursor", null);
		packBomSService.selPackBomDelChk(map);
		List<PackBomS> list = (List<PackBomS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/formSearch", method = RequestMethod.POST)
	public List<PackBomS> selPackBomSSch1(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String keyValue = request.getParameter("keyValue");
		map.put("compId", compId);
		map.put("keyValue", keyValue);
		map.put("o_cursor", null);
		packBomSService.selPackBomSSch1(map);
		List<PackBomS> list = (List<PackBomS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/MstSearch", method = RequestMethod.POST)
	public List<PackBomS> selPackBomSSch2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String keyValue = request.getParameter("keyValue");
		map.put("compId", compId);
		map.put("keyValue", keyValue);
		map.put("o_cursor", null);
		packBomSService.selPackBomSSch2(map);
		List<PackBomS> list = (List<PackBomS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/DtlSearch", method = RequestMethod.POST)
	public List<PackBomS> selPackBomSSch3(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String keyvalue1 = request.getParameter("keyvalue1");
		String keyvalue2 = request.getParameter("keyvalue2");
		map.put("compId", compId);
		map.put("keyvalue1", keyvalue1);
		map.put("keyvalue2", keyvalue2);
		map.put("o_cursor", null);
		packBomSService.selPackBomSSch3(map);
		List<PackBomS> list = (List<PackBomS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/MstSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcspackBomSSave1(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String sysEmpNo = (String) session.getAttribute("empNo");
			String compId = (String) session.getAttribute("compId");
			String jsonData = request.getParameter("jsonData");

			List<PackBomS> list = new ArrayList<PackBomS>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<PackBomS>>() {
			});
			packBomSService.prcspackBomSSave1(list, sysEmpNo, compId);

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

	@RequestMapping(value = "/DtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcspackBomSSave2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String sysEmpNo = (String) session.getAttribute("empNo");
			String compId = (String) session.getAttribute("compId");
			String jsonData = request.getParameter("jsonData");

			List<PackBomS> list = new ArrayList<PackBomS>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<PackBomS>>() {
			});
			packBomSService.prcspackBomSSave2(list, sysEmpNo, compId);

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
