package com.ubi.erp.pers.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ubi.erp.pers.domain.LicenseDataS;
import com.ubi.erp.pers.service.LicenseDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/licenseDataS")
public class LicenseDataSController {
	
	@Autowired
	private LicenseDataSService licenseDataSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<LicenseDataS> selLicenseDataSR(HttpServletRequest request, HttpServletResponse response,LicenseDataS licenseDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = licenseDataS.getCompId();
		String empNo = licenseDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		licenseDataSService.selLicenseDataSR(map);
		List<LicenseDataS> list = (List<LicenseDataS>) map.get("o_cursor");
		return list;
	}

	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsLicenseDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<LicenseDataS> list = new ArrayList<LicenseDataS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<LicenseDataS>>(){});
		licenseDataSService.prcsLicenseDataS(list,sysEmpNo);
	}
}
