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
import com.ubi.erp.pers.domain.ProvDeductSetS;
import com.ubi.erp.pers.service.ProvDeductSetSService;

@RestController
@RequestMapping(value = "/erp/pers/wage/provDeductSetS")
public class ProvDeductSetSController {
	
	@Autowired
	private ProvDeductSetSService provDeductSetSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<ProvDeductSetS> selProvDeductSetS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		map.put("compId", compId);
		map.put("o_cursor", null);
		provDeductSetSService.selProvDeductSetS(map);
		List<ProvDeductSetS> list = (List<ProvDeductSetS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsProvDeductSetS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String compId = (String) session.getAttribute("compId");
			String sysEmpNo = (String) session.getAttribute("empNo");
			String jsonData = request.getParameter("jsonData");
			List<ProvDeductSetS> list = new ArrayList<ProvDeductSetS>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<ProvDeductSetS>>() {
			});
			provDeductSetSService.prcsProvDeductSetS(list, compId, sysEmpNo);

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
	@RequestMapping(value = "/jqTest", method = RequestMethod.GET)
	public void selPersDataSR(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		map.put("compId", compId);
		map.put("o_cursor", null);
		provDeductSetSService.selProvDeductSetS(map);
		List<ProvDeductSetS> list = (List<ProvDeductSetS>) map.get("o_cursor");
		String jsonStr = new ObjectMapper().writeValueAsString(list);
		MakeResponseUtil.makeResponse(response, "json", jsonStr);
	}

}
