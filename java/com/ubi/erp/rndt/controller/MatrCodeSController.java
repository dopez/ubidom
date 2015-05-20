package com.ubi.erp.rndt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.rndt.domain.MatrCodeS;
import com.ubi.erp.pers.service.PersDataSService;
import com.ubi.erp.rndt.service.MatrCodeSService;

@RestController
@RequestMapping(value = "/erp/rndt/stan/matrCodeS")
public class MatrCodeSController {

	@Autowired
	private PersDataSService persDataSService;
	private MatrCodeSService MatrCodeSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selLeft",method = RequestMethod.POST)
	public List<MatrCodeS> selPersDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,MatrCodeS persDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");;
		map.put("compId", compId);
		map.put("postCode", "%");
		map.put("empNo", "%");
		map.put("o_cursor", null);
		MatrCodeSService.selPersDataSL(map);
		List<MatrCodeS> list = (List<MatrCodeS>) map.get("o_cursor");
		return list;
	}
	

	
	
}
