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

@RestController
@RequestMapping(value = "/erp/pop")
public class PopupController {

	@Autowired
	private PopupService popLen2Service;

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
		popLen2Service.selPopLen2(map);
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
		popLen2Service.selPopLen4(map);
		List<Popup> list = (List<Popup>) map.get("o_cursor");
		return list;
	}

}
