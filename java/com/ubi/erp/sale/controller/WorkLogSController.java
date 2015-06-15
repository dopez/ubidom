package com.ubi.erp.sale.controller;

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

import com.ubi.erp.sale.domain.WorkLogS;
import com.ubi.erp.sale.service.WorkLogSService;



@RestController
@RequestMapping(value="/erp/sale/wlog/workLogS")
public class WorkLogSController {

	
	@Autowired
	private WorkLogSService workLogSService;
	private static final Logger logger = LoggerFactory.getLogger(WorkLogSController.class);
	
	
	public ModelAndView getSession(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException{
		String empNo = (String) session.getAttribute("empNo");
		String empName = (String) session.getAttribute("empName");
		ModelAndView mnv = new ModelAndView("/erp/sale/wlog/workLogS");
		mnv.addObject("empNo", empNo);
		mnv.addObject("empName", empName);
		return mnv;
		
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView selDevPlanS(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String logkind = request.getParameter("logkind");
		String logdate = request.getParameter("logdate");
		String logempno = request.getParameter("logempno");
		String logseq = request.getParameter("logseq");
		ModelAndView mnv = new ModelAndView("/erp/sale/wlog/workLogS");
		ModelAndView mnv2 = new ModelAndView("/erp/rndt/wlog/workLogS");
		mnv.addObject("logkind", logkind);
		mnv.addObject("logdate", logdate);
		mnv.addObject("empNo", logempno);
		mnv.addObject("logseq", logseq);
		mnv.addObject("logkind", logkind);
		mnv.addObject("logdate", logdate);
		mnv.addObject("empNo", logempno);
		mnv.addObject("logseq", logseq);
		return mnv;
	}

	/*
	 * @RequestMapping(method = RequestMethod.POST) public ModelAndView
	 * selRndtWlogs(HttpServletRequest request, HttpServletResponse response,
	 * HttpSession session) throws ParseException { String logkind =
	 * request.getParameter("logkind"); String logdate =
	 * request.getParameter("logdate"); String logempno =
	 * request.getParameter("logempno"); String logseq =
	 * request.getParameter("logseq"); ModelAndView mnv = new
	 * ModelAndView("/erp/rndt/wlog/workLogS"); mnv.addObject("logkind",
	 * logkind); mnv.addObject("logdate", logdate); mnv.addObject("empNo",
	 * logempno); mnv.addObject("logseq", logseq); return mnv; }
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMainSel", method = RequestMethod.POST)
	public List<WorkLogS> gridMainSel(HttpServletRequest request, HttpServletResponse response,HttpSession session, WorkLogS workLogS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String logKind = workLogS.getLogKind();
		String logDate = workLogS.getStDate();
		String logSeq = workLogS.getSeqNo();
		String empNo = workLogS.getEmpNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_LOG_KIND", logKind);
		map.put("V_LOG_DATE", logDate);
		map.put("V_EMP_NO", empNo);
		map.put("V_LOG_SEQ", logSeq);
		map.put("o_cursor", null);
		workLogSService.gridMainSel(map);
		List<WorkLogS> list  = (List<WorkLogS>) map.get("o_cursor");
		return list;
	}	
	
/*	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void gridMainSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		DateFormatUtil df = new DateFormatUtil();
		
		List<WorkLogS> list = new ArrayList<WorkLogS>();
		
		ObjectMapper mapper = new ObjectMapper();
		
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<WorkLogS>>(){});
		logger.debug("resultset is "+list);
		
		for(WorkLogS workLogs : list) {
			workLogs.setLogDate(df.dateToString(workLogs.getLogDate()));
			workLogs.setSysEmpNo(sysEmpNo);
			workLogs.setCompId(compId);
			workLogSService.gridMainSave(workLogs);
		}

	}*/
	
	@RequestMapping(value = "/gridMainSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void gridMainSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		List<WorkLogS> list = new ArrayList<WorkLogS>();
		
		String compId = (String) session.getAttribute("compId");
		String sysEmpNo = (String) session.getAttribute("empNo");		
		String jsonData = request.getParameter("jsonData");
		
		list = new ObjectMapper().readValue(jsonData, new TypeReference<ArrayList<WorkLogS>>(){});		
		workLogSService.prcsGridMain(list, sysEmpNo, compId);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/seqReturn",method = RequestMethod.POST)
	public List<WorkLogS> getSeqReturn(HttpServletRequest request,HttpServletResponse response, HttpSession session, WorkLogS WorkLogS) throws Exception {

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

		workLogSService.getSeqReturn(map);

		List<WorkLogS> list = (List<WorkLogS>) map.get("o_cursor");

		logger.debug("resultset is "+list);

		return list;
	}

}