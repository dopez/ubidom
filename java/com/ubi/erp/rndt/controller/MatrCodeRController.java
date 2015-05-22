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
import com.ubi.erp.rndt.domain.MatrCodeR;
import com.ubi.erp.rndt.service.MatrCodeRService;


@RestController
@RequestMapping(value = "/erp/rndt/stan/matrCodeR")
public class MatrCodeRController {

	@Autowired

	private MatrCodeRService MatrCodeRService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public List<MatrCodeR> selMatrCode(HttpServletRequest request, HttpServletResponse response,HttpSession session,MatrCodeR matrCodeR) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String code = request.getParameter("matrCode");
		String name = request.getParameter("matrName");
		String gubn = request.getParameter("matrGubn");
		map.put("V_COMPID", compId);
		map.put("V_MATR_CODE", code);
		map.put("V_MATR_NAME", name);
		map.put("V_MATR_GUBN", gubn);
		map.put("o_cursor", null);
		MatrCodeRService.selMatrCode(map);
		List<MatrCodeR> matrCodelist = (List<MatrCodeR>) map.get("o_cursor");

		return matrCodelist;
	}
}
