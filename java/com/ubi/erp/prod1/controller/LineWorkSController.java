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
import com.ubi.erp.prod1.domain.LineWorkS;
import com.ubi.erp.prod1.service.LineWorkSService;

@RestController
@RequestMapping(value = "/erp/prod1/stan/lineWorkS")
public class LineWorkSController {

	@Autowired
	private LineWorkSService lineWorkSService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch", method = RequestMethod.POST)
	public List<LineWorkS> selLineWorkSL(HttpServletRequest request, HttpServletResponse response, HttpSession session, LineWorkS lineWorkS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		map.put("compId", compId);
		map.put("lineCode", '%');
		map.put("lineName", '%');
		map.put("o_cursor", null);
		lineWorkSService.selLineWorkSL(map);
		List<LineWorkS> list = (List<LineWorkS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch", method = RequestMethod.POST)
	public List<LineWorkS> selLineWorkSR(HttpServletRequest request, HttpServletResponse response, HttpSession session, LineWorkS lineWorkS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String lineCode = lineWorkS.getLineCode();
		map.put("compId", compId);
		map.put("lineCode", lineCode);
		map.put("o_cursor", null);
		lineWorkSService.selLineWorkSR(map);
		List<LineWorkS> list = (List<LineWorkS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEquiOrderS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String sysEmpNo = (String) session.getAttribute("empNo");
			String compId = (String) session.getAttribute("compId");
			String jsonData = request.getParameter("jsonData");

			List<LineWorkS> list = new ArrayList<LineWorkS>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<LineWorkS>>() {
			});
			lineWorkSService.prcsLineWorkS(list, sysEmpNo, compId);

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
