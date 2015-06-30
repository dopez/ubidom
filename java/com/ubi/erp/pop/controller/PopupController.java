package com.ubi.erp.pop.controller;

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

import com.ubi.erp.pop.domain.Popup;
import com.ubi.erp.pop.service.PopupService;
import com.ubi.erp.rndt.domain.BomS;

@RestController
@RequestMapping(value = "/erp/pop")
public class PopupController {

	@Autowired
	private PopupService popupService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/len2", method = RequestMethod.POST)
	public List<Popup> selPopLen2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String innerName = request.getParameter("innerName");
		String kind = request.getParameter("kind");
		map.put("compId", compId);
		map.put("innerName", innerName);
		map.put("kind", kind);
		map.put("o_cursor", null);
		popupService.selPopLen2(map);
		List<Popup> list = (List<Popup>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/len4", method = RequestMethod.POST)
	public List<Popup> selPopLen4(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String innerName = request.getParameter("innerName");
		String kind = request.getParameter("kind");
		map.put("compId", compId);
		map.put("innerName", innerName);
		map.put("kind", kind);
		map.put("o_cursor", null);
		popupService.selPopLen4(map);
		List<Popup> list = (List<Popup>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/itemAllCode", method = RequestMethod.POST)
	public List<Popup> selItemAllCode(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String innerName = request.getParameter("innerName");
		String kind = request.getParameter("kind");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_NAME", innerName);
		map.put("V_KIND", kind);
		map.put("o_cursor", null);
		popupService.selItemAllCode(map);
		List<Popup> list = (List<Popup>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selectMatrCode", method = RequestMethod.POST)
	public List<Popup> selSelectMatrCode(HttpServletRequest request, HttpServletResponse response, HttpSession session, BomS BomS) throws Exception {
		String comp = (String) session.getAttribute("compId");
		String innerName = request.getParameter("innerName");
		String gubn = request.getParameter("gubn");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("V_COMPID", comp);
		map.put("V_MATR_NAME", innerName);
		map.put("V_MATR_GUBN", gubn);
		map.put("o_cursor", null);
		popupService.selSelectMatrCode(map);
		List<Popup> list = (List<Popup>) map.get("o_cursor");
		return list;
	}
}
