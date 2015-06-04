package com.ubi.erp.pers.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.pers.domain.PersAppointS;
import com.ubi.erp.pers.service.PersAppointSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/persAppointS")
public class PersAppointSController {
	
	@Autowired
	private PersAppointSService persAppointSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<PersAppointS> selPersDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersAppointS persAppointS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String serveGbn = persAppointS.getServeGbn();
		String postCode = persAppointS.getPostCode();
		String empNo = persAppointS.getEmpNo();
		map.put("compId", compId);
		map.put("postCode", postCode);
		map.put("empNo",empNo);
		map.put("serveGbn",serveGbn);
		map.put("o_cursor", null);
		persAppointSService.selPersAppointSL(map);
		List<PersAppointS> list = (List<PersAppointS>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<PersAppointS> selPersDataSR(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersAppointS persAppointS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = persAppointS.getCompId();
		String empNo = persAppointS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		persAppointSService.selPersAppointSR(map);
		List<PersAppointS> list = (List<PersAppointS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void crudPersAppointS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<PersAppointS> list = new ArrayList<PersAppointS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<PersAppointS>>(){});
		persAppointSService.prcsPersAppointS(list,sysEmpNo);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selEmpPop",method = RequestMethod.POST)
	public List<PersAppointS> selEmpPop(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersAppointS persAppointS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String korName;
		if(request.getParameter("korName").equals("")){
			korName = "%";
		}else{
			korName = request.getParameter("korName");
		}
		map.put("compId", compId);
		map.put("empNo", "%");
		map.put("korName", korName);
		map.put("o_cursor", null);
		persAppointSService.selEmpPop(map);
		List<PersAppointS> list = (List<PersAppointS>) map.get("o_cursor");
		return list;
	}
}
