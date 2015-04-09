package com.ubi.erp.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.user.domain.Sys;
import com.ubi.erp.user.service.SysService;

@RestController
@RequestMapping(value = "/erp/sys")
public class SysController {

	@Autowired
    private SysService sysService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public List<Sys> selSys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("rst", null);
		sysService.selSys(param);
		return (List<Sys>) param.get("rst");
	}

	@RequestMapping(value = "/prcs", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsSys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String jsonData = request.getParameter("jsonData");
		List<Sys> list = new ArrayList<Sys>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<Sys>>(){});
		
		for(Sys sys : list) {
			if("CREATE_VALUE".equals(sys.getCudKey())) {
				sys.setCreator("C2000000");
				sysService.insSys(sys);
			} else if("UPDATE_VALUE".equals(sys.getCudKey())) {
				sys.setEditor("C2000000");
				sysService.updSys(sys);
			} else if ("DELETE_VALUE".equals(sys.getCudKey())) {
				sysService.delSys(sys);
			}
		}
	}
}
