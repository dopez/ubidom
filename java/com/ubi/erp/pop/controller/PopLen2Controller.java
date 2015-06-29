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

import com.ubi.erp.pop.domain.PopLen2;
import com.ubi.erp.pop.service.PopLen2Service;

@RestController
@RequestMapping(value = "/erp/pop")
public class PopLen2Controller {

	@Autowired
	private PopLen2Service popLen2Service;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/len2", method = RequestMethod.POST)
	public List<PopLen2> selEquiHistoryR(HttpServletRequest request,HttpServletResponse response, HttpSession session)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String innerName = request.getParameter("innerName");
		String kind = request.getParameter("kind");
		map.put("compId", compId);
		map.put("innerName", innerName);
		map.put("kind", kind);
		map.put("o_cursor", null);
		popLen2Service.selPopLen2(map);
		List<PopLen2> list = (List<PopLen2>) map.get("o_cursor");
		return list;
	}

}
