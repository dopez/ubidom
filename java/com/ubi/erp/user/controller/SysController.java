package com.ubi.erp.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.user.domain.Sys;
import com.ubi.erp.user.service.SysService;

@Controller
@RequestMapping(value = "/erp/sys")
public class SysController {

	@Autowired
    private SysService sysService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public void selSys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("V_NAME", "%");
		param.put("rst", null);
		sysService.selSys(param);
		List<Sys> list = (List<Sys>) param.get("rst");
		String jsonStr = new ObjectMapper().writeValueAsString(list);
		makeResponse(response, "json", jsonStr);
	}

	@RequestMapping(value = "/prcs", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsSys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();

		try {
			String jsonData = request.getParameter("jsonData");
			List<Sys> list = new ArrayList<Sys>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<Sys>>() {});
			sysService.prcsSys(list);

			Map<String, String> map = new HashMap<String, String>();
			map.put("rtnCode", "1");
			String jsonStr = new String(JsonUtil.parseToString(map));
			makeResponse(response, "json", jsonStr);
		} catch (DuplicateKeyException e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR005"); // PK 중복
		} catch (Exception e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR002"); // 서버오류
		} finally {
			if (!ht.isEmpty()) {
				response.setHeader("EXCEPTION", "Y");
				makeResponse(response, "json", JsonUtil.parseToString(ht));
			}
		}
	}

	private void makeResponse(HttpServletResponse response, String resType, String str) throws IOException {
		response.setContentType("application/" + resType + ";");
		ServletOutputStream sos = response.getOutputStream();
		sos.print(new String(str.getBytes("UTF-8"), "8859_1"));
	}
}
