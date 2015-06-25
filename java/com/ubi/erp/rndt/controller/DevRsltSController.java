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

import com.ubi.erp.rndt.domain.DevRsltS;
import com.ubi.erp.rndt.service.DevRsltSService;



@RestController
@RequestMapping(value = "/erp/rndt/good/devRsltS")
public class DevRsltSController {
	@Autowired
	private DevRsltSService DevRsltSService;
	private static final Logger logger = LoggerFactory.getLogger(DevRsltSController.class);

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selDevMidS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String empName = request.getParameter("empName");
		String empNo = request.getParameter("empNo");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String openParam = request.getParameter("openParam");
		String planNumb = request.getParameter("planNumb");
		
		ModelAndView mnv = new ModelAndView("/erp/rndt/good/devRsltS");
		mnv.addObject("empName", empName);
		mnv.addObject("empNo", empNo);
		mnv.addObject("setDate", setDate);
		mnv.addObject("setSeq", setSeq);
		mnv.addObject("openParam", openParam);
		mnv.addObject("planNumb", planNumb);
		return mnv;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selPlanNumb", method = RequestMethod.POST)
	public List<DevRsltS> selPlanNumb(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevRsltS DevRsltS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String problemName = request.getParameter("problemName");
		String popParam = request.getParameter("popParam");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_PROBLEM_NAME", problemName);
		map.put("o_cursor", null);
		if (popParam.equals("0")) {
			DevRsltSService.selPlanNumb01(map);
		} else if (popParam.equals("1")) {
			DevRsltSService.selPlanNumb02(map);
		}
		List<DevRsltS> list = (List<DevRsltS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selInitTab4", method = RequestMethod.POST)
	public List<DevRsltS> selInitTab4(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevRsltS DevRsltS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMP_ID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);

		DevRsltSService.selInitTab4(map);

		List<DevRsltS> list = (List<DevRsltS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/frmMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmMainSave(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevRsltS DevRsltS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");

		DevRsltS.setSysEmpNo(sysEmpNo);
		DevRsltS.setCompId(compId);

		DevRsltSService.prcsFrmMainSave(DevRsltS);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selFrmMain", method = RequestMethod.POST)
	public List<DevRsltS> selFrmMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevRsltS DevRsltS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		DevRsltSService.selFrmMain(map);
		List<DevRsltS> list = (List<DevRsltS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/frmTabSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmTabSave(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevRsltS DevRsltS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String tabId = request.getParameter("tabId");

		DevRsltS.setSysEmpNo(sysEmpNo);
		DevRsltS.setCompId(compId);
		if (tabId.equals("a1") || tabId.equals("a2") || tabId.equals("a3") || tabId.equals("a7")) {
			DevRsltSService.prcsFrmTabSave(DevRsltS);
		} else if (tabId.equals("a4")) {
			DevRsltSService.prcsFrmTab4Save(DevRsltS);
		} else if (tabId.equals("a5")) {
			DevRsltSService.prcsFrmTab5Save(DevRsltS);
		}

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selFrmTab", method = RequestMethod.POST)
	public List<DevRsltS> selFrmTab(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevRsltS DevRsltS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String tabId = request.getParameter("tabId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		if (tabId.equals("a1") || tabId.equals("a2") || tabId.equals("a3") || tabId.equals("a7")) {
			if (tabId.equals("a1")) {
				map.put("V_CONTENTS_KIND", "1");
			} else if (tabId.equals("a2")) {
				map.put("V_CONTENTS_KIND", "2");
			} else if (tabId.equals("a3")) {
				map.put("V_CONTENTS_KIND", "3");
			} else if (tabId.equals("a7")) {
				map.put("V_CONTENTS_KIND", "4");
			}
			DevRsltSService.selFrmTabContents(map);
		} else if (tabId.equals("a4")) {
			DevRsltSService.selFrmTab4(map);
		} else if (tabId.equals("a5")) {
			DevRsltSService.selFrmTab5(map);
		}
		List<DevRsltS> list = (List<DevRsltS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridTab6", method = RequestMethod.POST)
	public List<DevRsltS> selGridTab6(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevRsltS DevRsltS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		DevRsltSService.selGridTab6(map);
		List<DevRsltS> list = (List<DevRsltS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridTab6Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridTab6(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		List<DevRsltS> list = new ArrayList<DevRsltS>();

		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData6");

		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<DevRsltS>>() {
		});
		DevRsltSService.prcsGridTab6(list, sysEmpNo, compId);
	}
}