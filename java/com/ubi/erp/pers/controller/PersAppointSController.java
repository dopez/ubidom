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

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.pers.domain.PersAppointS;
import com.ubi.erp.pers.service.PersAppointSService;

@RestController
@RequestMapping(value = "/erp/persAppointS")
public class PersAppointSController {
	
	@Autowired
	private PersAppointSService persAppointSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selLeft",method = RequestMethod.POST)
	public List<PersAppointS> selPersDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersAppointS persAppointS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String serveGbn = persAppointS.getServeGbn();
		String postCode;
		String empNo;
		if(request.getParameter("postCode").equals("")){
			postCode = "%";
		}else{
			postCode = request.getParameter("postCode");
		}
		if(request.getParameter("empNo").equals("")){
			empNo = "%";
		}else{
			empNo = request.getParameter("empNo");
		}
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
	@RequestMapping(value = "/selRight",method = RequestMethod.POST)
	public List<PersAppointS> selPersDataSR(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersAppointS persAppointS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = persAppointS.getCompId();
		String empNo = persAppointS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		persAppointSService.selPersAppointSR(map);
		List<PersAppointS> list = (List<PersAppointS>) map.get("o_cursor");
		DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			list.get(i).setBalDate(df.dateToString2(list.get(i).getBalDate()));
		}
		return list;
	}
	
	@RequestMapping(value = "/prcsPersAppoint", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void crudPersAppointS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<PersAppointS> list = new ArrayList<PersAppointS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<PersAppointS>>(){});
		DateFormatUtil df = new DateFormatUtil();
		
		for(PersAppointS persAppointS : list) {
			persAppointS.setSysEmpNo(sysEmpNo);
			persAppointS.setBalDate(df.dateToString(persAppointS.getBalDate()));
			persAppointS.setPayGbn(persAppointS.getPayGbnNm());
			persAppointS.setBalGbn(persAppointS.getBalGbnNm());
			persAppointS.setServeGbn(persAppointS.getServeGbnNm());
			persAppointS.setJikgun(persAppointS.getJikgunNm());
			persAppointS.setJikmu(persAppointS.getJikmuNm());
			persAppointS.setJikwee(persAppointS.getJikweeNm());
			persAppointS.setJikchak(persAppointS.getJikchakNm());
			persAppointS.setCompId(persAppointS.getCompIdNm());
			
			if("INSERT".equals(persAppointS.getCudKey())) {
				persAppointSService.crudPersAppointS(persAppointS);
			}else if("UPDATE".equals(persAppointS.getCudKey())){
				
				persAppointSService.crudPersAppointS(persAppointS);
			}else if("DELETE".equals(persAppointS.getCudKey())){
				
				persAppointSService.crudPersAppointS(persAppointS);
			}
		}
	}
	
	@RequestMapping(value = "/selBaseCode",method = RequestMethod.POST)
	public List<PersAppointS> selTest(HttpServletRequest request, HttpServletResponse response,PersAppointS persAppointS) throws Exception {
		List<PersAppointS> list = persAppointSService.selPersBaseCode(persAppointS);
		return list;
	}
}
