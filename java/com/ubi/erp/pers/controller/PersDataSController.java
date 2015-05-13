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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.pers.domain.DeptS;
import com.ubi.erp.pers.domain.PersDataS;
import com.ubi.erp.pers.service.PersDataSService;

@RestController
@RequestMapping(value = "/erp/persDataS")
public class PersDataSController {

	@Autowired
	private PersDataSService persDataSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selLeft",method = RequestMethod.POST)
	public List<PersDataS> selPersDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		map.put("compId", compId);
		map.put("postCode", "%");
		map.put("empNo", "%");
		map.put("o_cursor", null);
		persDataSService.selPersDataSL(map);
		List<PersDataS> list = (List<PersDataS>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selRight",method = RequestMethod.POST)
	public List<PersDataS> selPersDataSR(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String empNo = request.getParameter("empNo");
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		persDataSService.selPersDataSR(map);
		List<PersDataS> list = (List<PersDataS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/prcsPersData", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsPersData(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		System.out.println(request.getParameter("email"));
		
		System.out.println(persDataS.getEmail());
	
		DateFormatUtil df = new DateFormatUtil();
		
		/*for(PersDataS persDataS : list) {
			persDataS.setSysEmpNo(sysEmpNo);
			persDataS.setCompId(compId);
			if("INSERT".equals(persDataS.getCudKey())) {
				persDataS.setEnterDate(df.dateToString(persDataS.getEnterDate()));
				persDataS.setAmryDate1(df.dateToString(persDataS.getAmryDate1()));
				persDataS.setAmryDate2(df.dateToString(persDataS.getAmryDate2()));
				persDataS.setRetireDate(df.dateToString(persDataS.getRetireDate()));
				persDataS.setRetireMidDate(df.dateToString(persDataS.getRetireMidDate()));
				persDataSService.crudDeptS(persDataS);
			}else if("UPDATE".equals(persDataS.getCudKey())){
				persDataSService.crudDeptS(persDataS);
			}else if("DELETE".equals(persDataS.getCudKey())){
				persDataSService.crudDeptS(persDataS);
			}
		}*/
	}
	
	
	
}
