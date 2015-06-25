package com.ubi.erp.rndt.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.ubi.erp.rndt.domain.ImpReqS;
import com.ubi.erp.rndt.service.ImpReqSService;



@RestController
@RequestMapping(value = "/erp/rndt/good/impReqS")
public class ImpReqSController {
	@Autowired
	private ImpReqSService ImpReqSService;
	private static final Logger logger = LoggerFactory.getLogger(ImpReqSController.class);

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
}