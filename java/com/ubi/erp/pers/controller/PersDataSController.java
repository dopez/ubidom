package com.ubi.erp.pers.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
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
		String compId = (String) session.getAttribute("compId");;
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
		String compId = persDataS.getCompId();
		String empNo = persDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		persDataSService.selPersDataSR(map);
		List<PersDataS> list = (List<PersDataS>) map.get("o_cursor");
		DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			list.get(i).setEnterDate(df.dateToString2(list.get(i).getEnterDate()));
			list.get(i).setAmryDate1(df.dateToString2(list.get(i).getAmryDate1()));
			list.get(i).setAmryDate2(df.dateToString2(list.get(i).getAmryDate2()));
			list.get(i).setRetireDate(df.dateToString2(list.get(i).getRetireDate()));
			list.get(i).setRetireMidDate(df.dateToString2(list.get(i).getRetireMidDate()));
		}
		return list;
	}
	
	@RequestMapping(value = "/prcsPersData", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsPersData(HttpServletRequest request, HttpServletResponse response,HttpSession session,PersDataS persDataS) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		DateFormatUtil df = new DateFormatUtil();
		//session 값 set
		persDataS.setSysEmpNo(sysEmpNo);
		// checkBox null Check
		persDataS.setBldKind(nullCheck(persDataS.getBldKind()));
		persDataS.setDisorderYn(nullCheck(persDataS.getDisorderYn()));
		persDataS.setArmySpcase(nullCheck(persDataS.getArmySpcase()));
		persDataS.setArmyMerit(nullCheck(persDataS.getArmyMerit()));
		// calendar format check
		persDataS.setEnterDate(df.dateToString(persDataS.getEnterDate()));
		persDataS.setAmryDate1(df.dateToString(persDataS.getAmryDate1()));
		persDataS.setAmryDate2(df.dateToString(persDataS.getAmryDate2()));
		persDataS.setRetireDate(df.dateToString(persDataS.getRetireDate()));
		persDataS.setRetireMidDate(df.dateToString(persDataS.getRetireMidDate()));
		// armyJong check -- armyJong == armyKind
		persDataS.setArmyJong(persDataS.getArmyKind());

		if("INSERT".equals(persDataS.getCudKey())) {
			persDataSService.crudDeptS(persDataS);
		}else if("UPDATE".equals(persDataS.getCudKey())){
			persDataSService.crudDeptS(persDataS);
		}else if("DELETE".equals(persDataS.getCudKey())){
			persDataSService.crudDeptS(persDataS);
		}	
	}
	
	public String nullCheck(String value){
		if(value == null){
			value = "0";
		}
		return value;
	}
	
	
}
