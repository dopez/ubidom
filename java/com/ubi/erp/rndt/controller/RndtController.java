package com.ubi.erp.rndt.controller;

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

import com.ubi.erp.pers.domain.Dept;
import com.ubi.erp.rndt.domain.Rndt;
import com.ubi.erp.rndt.service.RndtService;


@RestController
@RequestMapping(value="/erp/rndt")
public class RndtController {

	
	@Autowired
	private RndtService rndtService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/baseCodeS/getBaseCodeMstSel", method = RequestMethod.GET)
	public List<Rndt> baseCodeMstSel(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		System.out.println(compId);
/*		map.put("V_COMP", "100");
		map.put("V_CODE", "%");
		map.put("V_NAME", "%");
*/		
		map.put("compId", compId);
		map.put("code", "%");
		map.put("codeName", "%");
		map.put("P_RST",null);
		rndtService.selBaseCode(map);
		List<Rndt> codeList = (List<Rndt>) map.get("P_RST");
		//return (List<Rndt>) map.get("P_RST");
		return codeList;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/baseCodeS/baseCodeMstSel", method = RequestMethod.POST)
	public List<Rndt> prsSelDept(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String codeName="";
		if(request.getParameter("codeName").equals("") ||  request.getParameter("codeName") == null){
			codeName = "%";
		}else{
			codeName = request.getParameter("codeName");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compId", compId);
		map.put("code", "%");
		map.put("codeName", codeName);
		map.put("P_RST", null);
		rndtService.selBaseCode(map);
		return (List<Rndt>) map.get("P_RST");
	}	
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/baseCodeS/baseCodeDtlSel", method = RequestMethod.POST)
		public List<Rndt> baseCodeDtlSel(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
			String compId = (String) session.getAttribute("compId");
			String code = request.getParameter("code");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("compId", compId);
			map.put("code", code);
			map.put("P_RST", null);
			rndtService.selInterCode(map);
			/*List<Rndt> list = (List<Rndt>) map.get("P_RST");
			return list;*/
			return (List<Rndt>) map.get("P_RST");
	}
	@RequestMapping(value = "/codeSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void codeSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<Rndt> list = new ArrayList<Rndt>();
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(jsonData);
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<Rndt>>(){});

		for (Rndt rndt : list) {
			System.out.println(rndt.getCode());
			rndt.setCode(rndt.getCode());
			rndt.setSysEmpNo(sysEmpNo);
			rndt.setCompId(compId);
			rndtService.crudRndt(rndt);
		}
	}
	@RequestMapping(value = "/baseCodeS/codeSaveDtl", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void codeSaveDtl(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String compId = (String) session.getAttribute("compId");
		System.out.println(compId);
		String sysEmpNo = (String) session.getAttribute("empNo");
		System.out.println(sysEmpNo);
		String jsonData = request.getParameter("jsonData2");
		List<Rndt> list = new ArrayList<Rndt>();
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(jsonData);
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<Rndt>>(){});
		
		for (Rndt rndt : list) {
			System.out.println(rndt.getCode());
			rndt.setCode(rndt.getCode());
			rndt.setCompId(compId);
			rndt.setInnerCode(rndt.getInnerCode());
			rndt.setSysEmpNo(sysEmpNo);
			rndtService.crudDtlRndt(rndt);
		}
	}
	
}