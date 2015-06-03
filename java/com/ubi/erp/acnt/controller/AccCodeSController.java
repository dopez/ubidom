package com.ubi.erp.acnt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.codehaus.jackson.type.TypeReference;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.ubi.erp.acnt.domain.AccCodeS;
import com.ubi.erp.acnt.service.AccCodeSService;


@RestController
@RequestMapping(value = "/erp/acnt/stan/accCodeS")
@JsonInclude(Include.NON_NULL)
public class AccCodeSController {

	 	private static final Logger logger = LoggerFactory.getLogger(AccCodeSController.class);

		@Autowired
		private AccCodeSService accCodeSService;

		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/search",method = RequestMethod.POST)
		public List<AccCodeS> getSrh(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

			Map<String, Object> map = new HashMap<String, Object>();
			String acCd1 = request.getParameter("acCd1");

			map.put("V_COMPID", "");
			map.put("V_AC_CD1", acCd1);
			map.put("o_cursor", null);

			accCodeSService.getSrh(map);

			return (List<AccCodeS>) map.get("o_cursor");
		}

		@RequestMapping(value = "/save", method = RequestMethod.POST)
		@ResponseStatus(HttpStatus.OK)
		public void prcsDetailSave(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {

			String compId = (String) session.getAttribute("compId");
		    String sysEmpNo = (String) session.getAttribute("empNo");

		    String jsonData = request.getParameter("jsonData");
			List<AccCodeS> list = new ArrayList<AccCodeS>();

			ObjectMapper mapper = new ObjectMapper();

			list = mapper.readValue(jsonData, new TypeReference<ArrayList<AccCodeS>>(){});

			for (AccCodeS accCodeS : list) {
				accCodeS.setSysEmpNo(sysEmpNo);
				accCodeS.setCompId(compId);
				accCodeSService.prcsSave(accCodeS);
			}
		}
}
