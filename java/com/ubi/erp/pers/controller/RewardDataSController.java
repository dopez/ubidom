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

import com.ubi.erp.cmm.util.gson.DateFormatUtil;
import com.ubi.erp.pers.domain.RewardDataS;
import com.ubi.erp.pers.service.RewardDataSService;

@RestController
@RequestMapping(value = "/erp/pers/pers/rewardDataS")
public class RewardDataSController {
	
	@Autowired
	private RewardDataSService rewardDataSService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/gridDtlSearch",method = RequestMethod.POST)
	public List<RewardDataS> selRewardDataSR(HttpServletRequest request, HttpServletResponse response,RewardDataS rewardDataS) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = rewardDataS.getCompId();
		String empNo = rewardDataS.getEmpNo();
		map.put("compId", compId);
		map.put("empNo", empNo);
		map.put("o_cursor", null);
		rewardDataSService.selRewardDataSR(map);
		List<RewardDataS> list = (List<RewardDataS>) map.get("o_cursor");
		DateFormatUtil df = new DateFormatUtil();
		for(int i = 0; i<list.size();i++){
			list.get(i).setStDate(df.dateToString2(list.get(i).getStDate()));
		}
		return list;
	}

	@RequestMapping(value = "/gridDtlSave", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsLicenseDataS(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		String sysEmpNo = (String) session.getAttribute("empNo");
		String jsonData = request.getParameter("jsonData");
		List<RewardDataS> list = new ArrayList<RewardDataS>();
		ObjectMapper mapper = new ObjectMapper();
		list = mapper.readValue(jsonData, new TypeReference<ArrayList<RewardDataS>>(){});
		
		for(RewardDataS rewardDataS : list) {
			rewardDataS.setSysEmpNo(sysEmpNo);
			rewardDataSService.prcsRewardDataS(rewardDataS);
		}
	}
}
