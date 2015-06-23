package com.ubi.erp.plan.controller;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.plan.domain.PurcConferS;
import com.ubi.erp.plan.service.PurcConferSService;
import com.ubi.erp.sale.controller.WorkLogSController;

@RestController
@RequestMapping(value="/erp/plan/purc/purcConferS")
public class PurcConferSController {

	private static final Logger logger = LoggerFactory.getLogger(WorkLogSController.class);
	
	@Autowired
	private PurcConferSService purcConferSService;
	
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		String comp = (String) session.getAttribute("compId");
		ModelAndView mnv = new ModelAndView("/erp/plan/purc/purcConferS");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		mnv.addObject("compId", comp);
		return mnv;
	}	
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selPurcConferS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String setDate = request.getParameter("setDate");
		String setSeq = request.getParameter("setSeq");
		ModelAndView mnv = new ModelAndView("/erp/plan/purc/purcConferS");
		mnv.addObject("setDate", setDate);
		mnv.addObject("setSeq", setSeq);
		return mnv;
	}	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/topMainSel", method = RequestMethod.POST)
	public List<PurcConferS> topMainSel(HttpServletRequest request, HttpServletResponse response,HttpSession session, PurcConferS purcConferS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = purcConferS.getSetDate();
		String setSeq = purcConferS.getSetSeq();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		purcConferSService.topMainSel(map);
		List<PurcConferS> list  = (List<PurcConferS>) map.get("o_cursor");
		
		logger.debug("resultset is "+list);
		
		return list;
	}			
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<PurcConferS> gridMainSel(HttpServletRequest request, HttpServletResponse response,HttpSession session, PurcConferS purcConferS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String setDate = purcConferS.getSetDate();
		String setSeq = purcConferS.getSetSeq();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_SET_DATE", setDate);
		map.put("V_SET_SEQ", setSeq);
		map.put("o_cursor", null);
		purcConferSService.gridMainSel(map);
		List<PurcConferS> list  = (List<PurcConferS>) map.get("o_cursor");
		
		logger.debug("resultset is "+list);
		
		return list;
	}		
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/seqReturn",method = RequestMethod.POST)
	public List<PurcConferS> getSeqReturn(HttpServletRequest request,HttpServletResponse response, HttpSession session, PurcConferS purcConferS) throws Exception {

	    Map<String, Object> map = new HashMap<String, Object>();
	    String compId = (String) session.getAttribute("compId");

	    String tableName = request.getParameter("tableName");
	    String seqColumn = request.getParameter("seqColumn");
	    String dateColumn1 = request.getParameter("dateColumn1");
	    String columnData1 = request.getParameter("columnData1");
	    String dateColumn2 = request.getParameter("dateColumn2");
	    String columnData2 = request.getParameter("columnData2");
	    String returnLen_string=request.getParameter("returnLen");
	    int returnLen=Integer.parseInt(returnLen_string);
	    
		map.put("V_COMPID",compId);
		map.put("V_TABLE_NAME",tableName);
		map.put("V_SEQ_COLUMN",seqColumn);
		map.put("V_DATE_COLUMN1",dateColumn1);
		map.put("V_COLUMN_DATA1", columnData1);
		map.put("V_DATE_COLUMN2", dateColumn2);
		map.put("V_COLUMN_DATA2", columnData2);
		map.put("V_RETURN_LEN", returnLen);
		map.put("o_cursor", null);

		purcConferSService.getSeqReturn(map);

		List<PurcConferS> list = (List<PurcConferS>) map.get("o_cursor");

		logger.debug("resultset is "+list);

		return list;
	}	
	
	@RequestMapping(value = "/gridTopSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void gridTopSave(HttpSession session, @RequestBody PurcConferS purcConferS, ModelMap map) throws Exception {
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		purcConferSService.prcsGridTop(purcConferS, sysEmpNo, compId);
	}	
	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void gridMainSave(HttpServletRequest request, HttpServletResponse response,HttpSession session, PurcConferS purcConferS) throws Exception {
		List<PurcConferS> list = new ArrayList<PurcConferS>();
		
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");		
		String jsonData = request.getParameter("jsonData");
		
		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<PurcConferS>>(){});		
		purcConferSService.prcsGridMain(list, sysEmpNo, compId);
	}	
	
}
