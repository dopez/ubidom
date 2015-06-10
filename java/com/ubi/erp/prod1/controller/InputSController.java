package com.ubi.erp.prod1.controller;

import java.text.ParseException;
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
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.prod1.domain.InputS;
import com.ubi.erp.prod1.service.InputSService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/inputS")
public class InputSController {
	
	@Autowired
	private InputSService inputSSservice;
	
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		ModelAndView mnv = new ModelAndView("/erp/prod1/equi/inputS");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		return mnv;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selEquiInspRtoInspS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		ModelAndView mnv = new ModelAndView("/erp/prod1/equi/inputS");
		mnv.addObject("setDate", setDate);
		mnv.addObject("setSeq", setSeq);
		return mnv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch", method = RequestMethod.POST)
	public List<InputS> selEquiInputSL(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		map.put("compId", compId);
		map.put("o_cursor", null);
		inputSSservice.selEquiInputSL(map);
		List<InputS> list = (List<InputS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch", method = RequestMethod.POST)
	public List<InputS> selEquiInputSR(HttpServletRequest request, HttpServletResponse response, HttpSession session, InputS inputS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId;
		if (inputS.getCompId() == null) {
			compId = (String) session.getAttribute("compId");
		} else {
			compId = inputS.getCompId();
		}
		String setDate = request.getParameter("stDate");
		String setSeq = inputS.getSetSeq();
		String custCode = inputS.getCustCode();
		map.put("compId", compId);
		map.put("setDate", setDate);
		map.put("setSeq", setSeq);
		map.put("custCode", custCode);
		map.put("o_cursor", null);
		inputSSservice.selEquiInputSR(map);
		List<InputS> list = (List<InputS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEquiOrderS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String compId = (String) session.getAttribute("compId");
		String jsonData = request.getParameter("jsonData");
		String setDate = request.getParameter("setDate");
		List<InputS> list = new ArrayList<InputS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<InputS>>() {
		});
		inputSSservice.prcsEquiInputS(list, sysEmpNo, compId, setDate);
	}
}
