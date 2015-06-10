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

import com.ubi.erp.prod1.domain.OrderS;
import com.ubi.erp.prod1.service.OrderSService;

@RestController
@RequestMapping(value = "/erp/prod1/equi/orderS")
public class OrderSController {
	
	@Autowired
	private OrderSService orderSSservice;
	
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		ModelAndView mnv = new ModelAndView("/erp/prod1/equi/orderS");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		return mnv;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selEquiInspRtoInspS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		ModelAndView mnv = new ModelAndView("/erp/prod1/equi/orderS");
		mnv.addObject("setDate", setDate);
		mnv.addObject("setSeq", setSeq);
		return mnv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSearch",method = RequestMethod.POST)
	public List<OrderS> selEquiOrderS(HttpServletRequest request, HttpServletResponse response, HttpSession session, OrderS orderS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String setDate = request.getParameter("stDate");
		String setSeq = orderS.getSetSeq();
		map.put("compId", compId);
		map.put("setDate", setDate);
		map.put("setSeq", setSeq);
		map.put("o_cursor", null);
		orderSSservice.selEquiOrderS(map);
		List<OrderS> list = (List<OrderS>) map.get("o_cursor");
		return list;
	}
	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsEquiOrderS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String compId = (String) session.getAttribute("compId");
		String jsonData = request.getParameter("jsonData");
		String setDate = request.getParameter("setDate");
		List<OrderS> list = new ArrayList<OrderS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<OrderS>>(){});
		orderSSservice.prcsEquiOrderS(list, sysEmpNo, compId,setDate);
	}
}
