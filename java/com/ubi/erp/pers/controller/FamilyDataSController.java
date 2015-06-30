package com.ubi.erp.pers.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.ubi.erp.cmm.util.MakeResponseUtil;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.pers.domain.FamilyDataS;
import com.ubi.erp.pers.service.FamilyDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/familyDataS")
public class FamilyDataSController implements ApplicationContextAware {

	@Autowired
	private FamilyDataSService familyDataSSservice;

	@SuppressWarnings("unused")
	private WebApplicationContext context = null;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridMstSearch",method = RequestMethod.POST)
	public List<FamilyDataS> selFamilyDataSL(HttpServletRequest request, HttpServletResponse response,HttpSession session,FamilyDataS familyDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String serveGbn = familyDataS.getServeGbn();
		String jikgun = familyDataS.getJikgun();
		String postCode = familyDataS.getPostCode();
		String empNo = familyDataS.getEmpNo();
		map.put("compId", compId);
		map.put("postCode", postCode);
		map.put("empNo",empNo);
		map.put("jikgun",jikgun);
		map.put("serveGbn",serveGbn);
		map.put("o_cursor", null);
		familyDataSSservice.selFamilyDataSL(map);
		List<FamilyDataS> list = (List<FamilyDataS>) map.get("o_cursor");
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<FamilyDataS> selFamilyDataSR(HttpServletRequest request, HttpServletResponse response,FamilyDataS familyDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = familyDataS.getCompId();
		String empNo = familyDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		familyDataSSservice.selFamilyDataSR(map);
		List<FamilyDataS> list = (List<FamilyDataS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsFamilyDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try {
			String sysEmpNo = (String) session.getAttribute("empNo");
			String jsonData = request.getParameter("jsonData");
			List<FamilyDataS> list = new ArrayList<FamilyDataS>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<FamilyDataS>>() {
			});
			familyDataSSservice.prcsFamilyDataS(list, sysEmpNo);

			Map<String, String> map = new HashMap<String, String>();
			map.put("rtnCode", "1");
			String jsonStr = new String(JsonUtil.parseToString(map));
			MakeResponseUtil.makeResponse(response, "json", jsonStr);
		} catch (DuplicateKeyException e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR005");
		} catch (Exception e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR002");
		} finally {
			if (!ht.isEmpty()) {
				response.setHeader("EXCEPTION", "Y");
				MakeResponseUtil.makeResponse(response, "json", JsonUtil.parseToString(ht));
			}
		}
	}

	@RequestMapping(value = "/download")
	public ModelAndView prcsImgDown(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String filename = request.getParameter("filename");
		File file = new File(PropertyUtil.getString("attach.pers.dir") + "/" + filename + ".jpg");
		return new ModelAndView("download", "downloadFile", file);
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		context = (WebApplicationContext) applicationContext;
	}
}
