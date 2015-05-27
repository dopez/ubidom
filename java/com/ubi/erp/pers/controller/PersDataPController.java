package com.ubi.erp.pers.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.JasperReportUtil;
import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.pers.domain.PersDataP;
import com.ubi.erp.pers.service.PersDataPService;



@RestController
@RequestMapping(value = "/erp/pers/pers/persDataS")
public class PersDataPController {
	@Autowired
	private PersDataPService PersDataPService;

	@SuppressWarnings("unchecked")
	@RequestMapping("/report/persDataP")
	public ModelAndView persDataP(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ParseException {
		String compId = (String) session.getAttribute("compId");
		String empno = request.getParameter("empNo");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", compId);
		map.put("V_EMP_NO", empno);
		map.put("o_cursor", null);
		PersDataPService.selPersData(map);
		List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("o_cursor");
		/*DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			((PersDataP) list.get(i)).seta(df.dateToString2(((PersDataP) list.get(i)).getStDate()));
			((PersDataP) list.get(i)).setEndDate(df.dateToString2(((PersDataP) list.get(i)).getEndDate()));
		}*/
		return JasperReportUtil.render("PersDataP",list, "pdf");
	}
	
}
