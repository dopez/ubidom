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

import com.ubi.erp.rndt.domain.DevPlanS;
import com.ubi.erp.rndt.service.DevPlanSService;

@RestController
@RequestMapping(value = "/erp/rndt/good/devPlanS")
public class DevPlanSController {

	@Autowired
	private DevPlanSService DevPlanSService;

	private static final Logger logger = LoggerFactory.getLogger(DevPlanSController.class);

	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		ModelAndView mnv = new ModelAndView("/erp/rndt/good/devPlanS");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		return mnv;

	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selDevPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String openParam = request.getParameter("openParam");
		ModelAndView mnv = new ModelAndView("/erp/rndt/good/devPlanS");
		mnv.addObject("setDate", setDate);
		mnv.addObject("setSeq", setSeq);
		mnv.addObject("openParam", openParam);
		return mnv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selFrmMain", method = RequestMethod.POST)
	public List<DevPlanS> selFrmMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanS DevPlanS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		DevPlanSService.selFrmMain(map);
		List<DevPlanS> list = (List<DevPlanS>) map.get("o_cursor");
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selFrmTab", method = RequestMethod.POST)
	public List<DevPlanS> selFrmTab(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanS DevPlanS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String tabId = request.getParameter("tabId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		if(tabId.equals("a1")){
			DevPlanSService.selFrmTab1(map);		
		}else if(tabId.equals("a2")){
			DevPlanSService.selFrmTab2(map);		
		}else if(tabId.equals("a5")){
			DevPlanSService.selFrmTab5(map);
		}else if(tabId.equals("a6")){
			DevPlanSService.selFrmTab6(map);
		}
		List<DevPlanS> list = (List<DevPlanS>) map.get("o_cursor");
		return list;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selGridTab", method = RequestMethod.POST)
	public List<DevPlanS> selGridTab(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanS DevPlanS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		String tabId = request.getParameter("tabId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		if(tabId.equals("a3")){
			DevPlanSService.selGridTab3(map);		
		}else if(tabId.equals("a4")){
			DevPlanSService.selGridTab4(map);		
		}else if(tabId.equals("a7")){
			DevPlanSService.selGridTab7(map);
		}else if(tabId.equals("a8")){
			DevPlanSService.selGridTab8(map);
		}
		List<DevPlanS> list = (List<DevPlanS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/frmMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmMainSave(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanS DevPlanS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");

		DevPlanS.setSysEmpNo(sysEmpNo);
		DevPlanS.setCompId(compId);

		DevPlanSService.prcsFrmMainSave(DevPlanS);
	}

	@RequestMapping(value = "/frmTab1Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmTab1Save(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanS DevPlanS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");


		DevPlanS.setSysEmpNo(sysEmpNo);
		DevPlanS.setCompId(compId);

		String gubn = request.getParameter("gubn");
		if (gubn == null) {
			/* tab1 */
		DevPlanSService.prcsFrmTab1Save(DevPlanS);
		} else {
			/* tab2 */
			DevPlanSService.prcsFrmTab2Save(DevPlanS);
		}
	}

	@RequestMapping(value = "/gridTab3Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridTab3(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		List<DevPlanS> list = new ArrayList<DevPlanS>();

		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData3");

		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<DevPlanS>>() {
		});
		DevPlanSService.prcsGridTab3(list, sysEmpNo, compId);
	}

	@RequestMapping(value = "/gridTab4Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridTab4(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		List<DevPlanS> list = new ArrayList<DevPlanS>();

		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData4");

		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<DevPlanS>>() {
		});
		DevPlanSService.prcsGridTab4(list, sysEmpNo, compId);
	}

	@RequestMapping(value = "/frmTab5Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmTab5Save(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanS DevPlanS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");

		DevPlanS.setSysEmpNo(sysEmpNo);
		DevPlanS.setCompId(compId);

		DevPlanSService.prcsFrmTab5Save(DevPlanS);

	}

	@RequestMapping(value = "/frmTab6Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFrmTab6Save(HttpServletRequest request, HttpServletResponse response, HttpSession session, DevPlanS DevPlanS) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");

		DevPlanS.setSysEmpNo(sysEmpNo);
		DevPlanS.setCompId(compId);

		DevPlanSService.prcsFrmTab6Save(DevPlanS);

	}

	@RequestMapping(value = "/gridTab7Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridTab7(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		List<DevPlanS> list = new ArrayList<DevPlanS>();

		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData7");

		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<DevPlanS>>() {
		});
		DevPlanSService.prcsGridTab7(list, sysEmpNo, compId);
	}

	@RequestMapping(value = "/gridTab8Save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsGridTab8(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		List<DevPlanS> list = new ArrayList<DevPlanS>();

		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData8");

		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<DevPlanS>>() {
		});
		DevPlanSService.prcsGridTab8(list, sysEmpNo, compId);
	}
}