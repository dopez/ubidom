package com.ubi.erp.sale.controller;

import java.io.IOException;
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

import com.ubi.erp.cmm.exception.UbiBizException;
import com.ubi.erp.cmm.file.AttachFileService;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.sale.domain.WorkLogS;
import com.ubi.erp.sale.service.WorkLogSService;
import com.ubi.erp.user.controller.FileController;
import com.ubi.erp.user.domain.AttachFile;

@RestController
@RequestMapping(value="/erp/sale/wlog/workLogS")
public class WorkLogSController {

	
	@Autowired
	private WorkLogSService workLogSService;
	private static final Logger logger = LoggerFactory.getLogger(WorkLogSController.class);

	private static final Logger LOGGER2 = LoggerFactory.getLogger(FileController.class);

	@Autowired
	private AttachFileService attachFileService;

	@RequestMapping(value = "/prcsFile2.sc")
	public void prcsFile(HttpServletRequest request, HttpServletResponse response) throws Exception {

		StringBuffer sb = new StringBuffer();

		try {
			String test = PropertyUtil.getString("attach.savedir");

			// 01. 물리파일 서버저장
			List<AttachFile> uploadFileList = attachFileService.uploadAttachFile(PropertyUtil.getString("attach.savedir"), request, response);

			// 02. 파일업로드 DB처리 (첫번째 파라미터가 "" 일 경우 신규, 수정일 경우 ID 셋팅)
			// attachFileService.prcsAttachFile("", uploadFileList);

			// 03. 파일정보 디버그
			for (AttachFile file : uploadFileList) {
				LOGGER2.debug(file.getFileSaveNm());
				LOGGER2.debug(file.getFileSize());
			}

			// 04. 파일업로드를 위해 Form.submit 했으므로 .do 호출함
			sb.append("<script>\n");
			sb.append("    alert('저장되었습니다.');\n");
			// sb.append("    location.replace('/erp/sale/wlog/workLogS.do');\n");
			sb.append("</script>\n");
		} catch (UbiBizException ube) {
			sb.append("<script>\n");
			sb.append("    MsgManager.alertMsg('ERR004');\n");
			sb.append("    history.go(-1);\n");
			sb.append("</script>\n");
		} catch (IOException ioe) {
			sb.append("<script>\n");
			sb.append("    MsgManager.alertMsg('ERR004');\n");
			sb.append("    history.go(-1);\n");
			sb.append("</script>\n");
		}

		response.setContentType("text/html");
		response.getOutputStream().print(new String(sb.toString().getBytes("UTF-8"), "8859_1"));

	}
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
		mnv2.addObject("logkind", logkind);
		mnv2.addObject("logdate", logdate);
		mnv2.addObject("empNo", logempno);
		mnv2.addObject("logseq", logseq);
		if (logkind.equals("9")) {
			return mnv2;
		} else {
			return mnv;
		}
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