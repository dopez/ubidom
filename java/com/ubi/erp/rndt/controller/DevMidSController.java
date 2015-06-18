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

import com.ubi.erp.rndt.domain.DevMidS;
import com.ubi.erp.rndt.service.DevMidSService;



@RestController
@RequestMapping(value = "/erp/rndt/good/devMidS")
public class DevMidSController {
	@Autowired
	private DevMidSService DevMidSService;
	private static final Logger logger = LoggerFactory.getLogger(DevMidSController.class);

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selDevMidS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String empName = request.getParameter("empName");
		String empNo = request.getParameter("empNo");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String openParam = request.getParameter("openParam");
		String problemName = request.getParameter("problemName");
		String planNumb = request.getParameter("planNumb");
		ModelAndView mnv = new ModelAndView("/erp/rndt/good/devMidS");
		mnv.addObject("empName", empName);
		mnv.addObject("empNo", empNo);
		mnv.addObject("setDate", setDate);
		mnv.addObject("setSeq", setSeq);
		mnv.addObject("problemName", problemName);
		mnv.addObject("planNumb", planNumb);
		mnv.addObject("openParam", openParam);
		return mnv;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/planNumbChk", method = RequestMethod.POST)
	public List<DevMidS> selPlanNumbChk(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevMidS DevMidS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String planNumb = request.getParameter("planNumb");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_PLAN_NUMB", planNumb);
		map.put("o_cursor", null);
		DevMidSService.selPlanNumbChk(map);
		List<DevMidS> list = (List<DevMidS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selDevPlanPop", method = RequestMethod.POST)
	public List<DevMidS> selDevPlanPop(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevMidS DevMidS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String problemName = request.getParameter("problemName");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_PROBLEM_NAME", problemName);
		map.put("o_cursor", null);
		DevMidSService.selDevPlanPop(map);
		List<DevMidS> list = (List<DevMidS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selFrmMain", method = RequestMethod.POST)
	public List<DevMidS> selFrmMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevMidS DevMidS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		DevMidSService.selFrmMain(map);
		List<DevMidS> list = (List<DevMidS>) map.get("o_cursor");
		return list;
	}
	@RequestMapping(value = "/frmMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmMainSave(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevMidS DevMidS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");

		DevMidS.setSysEmpNo(sysEmpNo);
		DevMidS.setCompId(compId);

		DevMidSService.prcsFrmMainSave(DevMidS);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridTab", method = RequestMethod.POST)
	public List<DevMidS> selGridTab(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevMidS DevMidS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String tabId = request.getParameter("tabId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		if (tabId.equals("a1")) {
			DevMidSService.selGridTab1(map);
		} /*
		 * else if (tabId.equals("a4")) { DevMidSService.selGridTab4(map); } /*
		 * else if (tabId.equals("a7")) { DevMidSService.selGridTab7(map); }
		 * else if (tabId.equals("a8")) { DevMidSService.selGridTab8(map); }
		 */
		List<DevMidS> list = (List<DevMidS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selFrmTab", method = RequestMethod.POST)
	public List<DevMidS> selFrmTab(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevMidS DevMidS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String tabId = request.getParameter("tabId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		if (tabId.equals("a2")) {
			DevMidSService.selFrmTab2(map);
		} else if (tabId.equals("a3")) {
			DevMidSService.selFrmTab3(map);
		} else if (tabId.equals("a4")) {
			DevMidSService.selFrmTab4(map);
		}
		/*
		 * else if (tabId.equals("a6")) { DevMidSService.selFrmTab6(map); }
		 */
		List<DevMidS> list = (List<DevMidS>) map.get("o_cursor");
		return list;
	}
	@RequestMapping(value = "/gridTabSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridTab(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		List<DevMidS> list = new ArrayList<DevMidS>();
		String jsonData = "";
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String tabId = request.getParameter("tabId");
		if (tabId.equals("a1")) {
			jsonData = request.getParameter("jsonData1");
		} else if (tabId.equals("a5")) {
			jsonData = request.getParameter("jsonData5");
		}
		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<DevMidS>>() {
		});
		DevMidSService.prcsGridTab(list, sysEmpNo, compId, tabId);

	}

	@RequestMapping(value = "/frmTabSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmTabSave(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevMidS DevMidS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String tabId = request.getParameter("tabId");

		DevMidS.setSysEmpNo(sysEmpNo);
		DevMidS.setCompId(compId);
		if (tabId.equals("a2") || tabId.equals("a3") || tabId.equals("a4")) {
			DevMidSService.prcsFrmTabSave(DevMidS);
		}

	}
}