package com.ubi.erp.comm.controller;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.cmm.util.MakeResponseUtil;
import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.comm.domain.CompS;
import com.ubi.erp.comm.service.CompSService;

@RestController
@RequestMapping(value = "/erp/comm/stan/compS")
public class CompSController {

	@Autowired
	private CompSService compSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<CompS> selCompSL(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_cursor", null);
		compSService.selCompSL(map);
		List<CompS> list = (List<CompS>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/formSearch",method = RequestMethod.POST)
	public List<CompS> selCompSR(HttpServletRequest request, HttpServletResponse response,CompS compS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = compS.getCompId();
		map.put("compId", compId);
		map.put("o_cursor", null);
		compSService.selCompSR(map);
		List<CompS> list = (List<CompS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/formSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsCompS(HttpServletRequest request, HttpServletResponse response,HttpSession session,CompS compS) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String sysEmpNo = (String) session.getAttribute("empNo");
			compS.setSysEmpNo(sysEmpNo);
			compSService.prcsCompS(compS);

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
