package com.ubi.erp.rndt.controller;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.rndt.domain.ImpReqS;
import com.ubi.erp.rndt.service.ImpReqSService;



@RestController
@RequestMapping(value = "/erp/rndt/good/impReqS")
public class ImpReqSController {
	@Autowired
	private ImpReqSService ImpReqSService;
	private static final Logger logger = LoggerFactory.getLogger(ImpReqSController.class);

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selDevMidS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String empName = request.getParameter("empName");
		String empNo = request.getParameter("empNo");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String setNo = request.getParameter("setNo");

		ModelAndView mnv = new ModelAndView("/erp/rndt/good/impReqS");
		mnv.addObject("empName", empName);
		mnv.addObject("empNo", empNo);
		mnv.addObject("setDate", setDate);
		mnv.addObject("setSeq", setSeq);
		mnv.addObject("setNo", setNo);
		return mnv;
	}
	@RequestMapping(value = "/saveGridMain", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridMain(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		List<ImpReqS> list = new ArrayList<ImpReqS>();

		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");

		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<ImpReqS>>() {
		});
		ImpReqSService.prcsGridMain(list, sysEmpNo, compId);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridMain", method = RequestMethod.POST)
	public List<ImpReqS> selGridMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, ImpReqS ImpReqS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setSeq = request.getParameter("setSeq");
		String setDate = request.getParameter("setDate");
		String setNo = request.getParameter("setNo");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_SET_DATE", setSeq);
		map.put("V_SET_SEQ", setDate);
		map.put("V_SET_NO", setNo);
		map.put("o_cursor", null);
		ImpReqSService.selGridMain(map);
		List<ImpReqS> list = (List<ImpReqS>) map.get("o_cursor");
		return list;
	}
}