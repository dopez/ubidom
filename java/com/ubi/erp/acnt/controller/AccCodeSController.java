package com.ubi.erp.acnt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
			String compId = (String) session.getAttribute("compId");
			String acCd1 = request.getParameter("acCd1");
			logger.debug("compId"+compId);
			logger.debug("acCd1"+acCd1);
			map.put("V_COMPID", "");
			map.put("V_AC_CD1", acCd1);
			map.put("o_cursor", null);

			accCodeSService.getSrh(map);
			logger.debug("RESULT"+(List<AccCodeS>) map.get("o_cursor"));
			return (List<AccCodeS>) map.get("o_cursor");
		}
}
