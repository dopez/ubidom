package com.ubi.erp.user.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import org.apache.commons.io.IOUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.user.domain.Sys;
import com.ubi.erp.user.service.SysService;

@Controller
@RequestMapping(value = "/erp/sys")
public class SysController {

	private static final Logger LOGGER = LoggerFactory.getLogger(SysController.class);

	@Autowired
    private SysService sysService;

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public void selSys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("V_NAME", "%");
		param.put("rst", null);
		sysService.selSys(param);
		List<Sys> list = (List<Sys>) param.get("rst");
		String jsonStr = new ObjectMapper().writeValueAsString(list);
		makeResponse(response, "json", jsonStr);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/excel", method = RequestMethod.POST)
	public void sysExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("V_NAME", "%");
		param.put("rst", null);
		sysService.selSys(param);
		List<Sys> list = (List<Sys>) param.get("rst");

		WritableWorkbook workbook = null;
		WritableSheet sheet = null;
		File file = new File(PropertyUtil.getString("attach.excel.tmpdir") + "/down.xls");

		try {
			workbook = Workbook.createWorkbook(file);
			workbook.createSheet("Sheet", 0);
			sheet = workbook.getSheet(0);

			WritableCellFormat cellFormat = new WritableCellFormat();
			cellFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
			Label label = null;
			int i = 0;

			for (Sys sys : list) {

				label = new jxl.write.Label(0, i, sys.getSysNm(), cellFormat);
				sheet.addCell(label);

				label = new jxl.write.Label(1, i, sys.getViewIdx().toString(), cellFormat);
				sheet.addCell(label);

				label = new jxl.write.Label(2, i, sys.getUseYn(), cellFormat);
				sheet.addCell(label);

				label = new jxl.write.Label(3, i, sys.getStrCdate(), cellFormat);
				sheet.addCell(label);

				label = new jxl.write.Label(4, i, sys.getStrCuser(), cellFormat);
				sheet.addCell(label);

				i++;
			}

			workbook.write();

		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			throw e;
		} finally {
			try {
				if (workbook != null) {
					workbook.close();
				}
			} catch (WriteException e) {
				LOGGER.error(e.getMessage());
			} catch (IOException e) {
				LOGGER.error(e.getMessage());
			}
		}

		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=down.xls");
		FileInputStream fis = null;
		OutputStream os = null;

		try {
			fis = new FileInputStream(file);
			os = response.getOutputStream();
			IOUtils.copy(fis, os);
		} catch (FileNotFoundException ex) {
			LOGGER.error(ex.getMessage());
		} finally {
			if (fis != null)
				fis.close();
			if (os != null)
				os.close();

			file.delete();
		}

	}

	@RequestMapping(value = "/prcs", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void prcsSys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Hashtable<String, String> ht = new Hashtable<String, String>();

		try {
			String jsonData = request.getParameter("jsonData");
			List<Sys> list = new ArrayList<Sys>();
			ObjectMapper mapper = new ObjectMapper();
			list = mapper.readValue(jsonData, new TypeReference<ArrayList<Sys>>() {});
			sysService.prcsSys(list);

			Map<String, String> map = new HashMap<String, String>();
			map.put("rtnCode", "1");
			String jsonStr = new String(JsonUtil.parseToString(map));
			makeResponse(response, "json", jsonStr);
		} catch (DuplicateKeyException e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR005"); // PK 중복
		} catch (Exception e) {
			ht.put("rtnCode", "-1");
			ht.put("EXCEPTION_TYPE", "BIZ");
			ht.put("EXCEPTION_MSG_CODE", "ERR002"); // 서버오류
		} finally {
			if (!ht.isEmpty()) {
				response.setHeader("EXCEPTION", "Y");
				makeResponse(response, "json", JsonUtil.parseToString(ht));
			}
		}
	}

	private void makeResponse(HttpServletResponse response, String resType, String str) throws IOException {
		response.setContentType("application/" + resType + ";");
		ServletOutputStream sos = response.getOutputStream();
		sos.print(new String(str.getBytes("UTF-8"), "8859_1"));
	}
}
