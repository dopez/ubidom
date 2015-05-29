package com.ubi.erp.user.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ubi.erp.cmm.exception.UbiBizException;
import com.ubi.erp.cmm.file.AttachFileService;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.cmm.util.StringUtil;
import com.ubi.erp.cmm.util.gson.JsonUtil;
import com.ubi.erp.user.domain.AttachFile;
import com.ubi.erp.user.domain.TempData;

@Controller
@RequestMapping(value = "/file", method = RequestMethod.POST)
public class FileController {

	private static final Logger LOGGER = LoggerFactory.getLogger(FileController.class);

	@Autowired
	private AttachFileService attachFileService;


	@RequestMapping(value = "/prcsFile.sc")
	public void prcsFile(HttpServletRequest request, HttpServletResponse response) throws Exception {

		StringBuffer sb = new StringBuffer();

		try {
			// 01. 물리파일 서버저장
			List<AttachFile> uploadFileList = attachFileService.uploadAttachFile(
					PropertyUtil.getString("attach.savedir"), request, response);

			// 02. 파일업로드 DB처리 (첫번째 파라미터가 "" 일 경우 신규, 수정일 경우 ID 셋팅)
			// attachFileService.prcsAttachFile("", uploadFileList);

			// 03. 파일정보 디버그
			for (AttachFile file : uploadFileList) {
				LOGGER.debug(file.getFileSaveNm());
				LOGGER.debug(file.getFileSize());
			}

			// 04. 파일업로드를 위해 Form.submit 했으므로 .do 호출함
			sb.append("<script>\n");
			sb.append("    alert('저장되었습니다.');\n");
			sb.append("    location.replace('/erp/fileSave.do');\n");
			sb.append("</script>\n");
		} catch (UbiBizException ube) {
			sb.append("<script>\n");
			sb.append("    MsgManager.alertMsg('ERR004');\n");
			sb.append("    history.go(-1);\n");
			sb.append("</script>\n");
		} catch (IOException ioe) {
			sb.append("<script>\n");
			sb.append("    MsgManager.alertMsg('ERR004');\n");
			sb.append("    history.go(-1);\n");
			sb.append("</script>\n");
		}

		response.setContentType("text/html");
		response.getOutputStream().print(new String(sb.toString().getBytes("UTF-8"), "8859_1"));

	}

	@RequestMapping(value = "/prcsExcel.sc")
	public void prcsExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String assignFilename = null;
		String assignFilePath = null;
		String jsonData = null;
		
		List<AttachFile> uploadFileList = attachFileService.uploadAttachFile(
				PropertyUtil.getString("attach.excel.tmpdir"), request, response);
		if (!uploadFileList.isEmpty()) {
			for (AttachFile file : uploadFileList) {
				LOGGER.info("FilePath : " + file.getFilePath());
				assignFilePath = PropertyUtil.getString("attach.excel.tmpdir") + "/" + file.getFileSaveNm();
				assignFilename = file.getFileOrgNm();
			}
		}

		HSSFWorkbook wb = null;
		try {
			wb = new HSSFWorkbook(new FileInputStream(assignFilePath));
		} catch (FileNotFoundException fe) {
			LOGGER.info("FileNotFoundException => " + fe.getMessage());
		} catch (IOException ioe) {
			LOGGER.info("IOException => " + ioe.getMessage());
		}
		HSSFSheet sheet = wb.getSheetAt(0);

		int xlsRows = sheet.getPhysicalNumberOfRows(); // 엑셀파일의 데이터 행의 갯수 추출
		int xlsClms = 0; // 엑셀파일의 사용 컬럼 갯수 추출

		{
			// 헤더에서 값이 있는 컬럼까지만 데이터 조회
			HSSFRow row = sheet.getRow(0);
			HSSFCell cell = null;
			String value = "";

			int tmpXlsClms = row.getPhysicalNumberOfCells();
			for (int cntCol = 0; cntCol < tmpXlsClms; cntCol++) {
				cell = row.getCell(cntCol);
				value = "";

				try {
					switch (cell.getCellType()) {
					case 0: {
						value = "" + cell.getNumericCellValue();
						break;
					}
					case 1: {
						value = cell.getStringCellValue();
						break;
					}
					case 2: {
						value = cell.getCellFormula();
						break;
					}
					default: {
						value = "";
						break;
					}
					}
				} catch (Exception e) {
					LOGGER.info("Error - " + e.toString());
					value = "";
				}

				if ("".equals(value)) {
					break;
				}

				xlsClms++;
			}
		}

		String fmtId = assignFilename.substring(0, 4);
		int regIdx = attachFileService.getNextTempData(fmtId).getRegIdx();

		// 임시 데이터 셋팅
		List<TempData> tempDataList = new ArrayList<TempData>();
		List<Map<String, Object>> tmpList = new ArrayList<Map<String, Object>>();
		Map<String, Object> tmp = new HashMap<String, Object>();

		// 시트 읽기
		HSSFRow row = null;
		HSSFCell cell = null;
		String value = null;
		int columnValueCnt = 0;

		for (int cntRow = 1; cntRow < xlsRows; cntRow++) { // 0번째 행은 헤더이므로 제외하고
															// 1부터
			tmp = new HashMap<String, Object>();

			// 엑셀의 행을 읽어오고, 해당 행의 열을 읽어서 값을 저장
			row = sheet.getRow(cntRow);
			columnValueCnt = 0;

			for (int cntCol = 0; cntCol < xlsClms; cntCol++) {
				cell = row.getCell(cntCol);
				value = "";

				try {
					switch (cell.getCellType()) {
					case 0: {
						value = "" + cell.getNumericCellValue();
						break;
					}
					case 1: {
						value = cell.getStringCellValue();
						break;
					}
					case 2: {
						value = cell.getCellFormula();
						break;
					}
					default: {
						value = "";
						break;
					}
					}
				} catch (Exception e) {
					LOGGER.info("Error - " + e.toString());
					value = "";
				}
				tmp.put("clm" + (cntCol + 1), value);

				if (!"".equals(StringUtil.initStr(value, ""))) {
					columnValueCnt++;
				}
			}

			tmp.put("fmtId", fmtId);
			tmp.put("regIdx", regIdx);
			tmp.put("rowIdx", cntRow);

			if (columnValueCnt > 0) {
				tmpList.add(tmp);
			}
		}

		LOGGER.info("prcsTempData() ----- Row Count = " + tmpList.size());
		jsonData = new String(JsonUtil.parseToString(tmpList));
		ObjectMapper mapper = new ObjectMapper();
		tempDataList = mapper.readValue(jsonData, new TypeReference<ArrayList<TempData>>() {
		});

		attachFileService.insTempData(tempDataList); // 데이터 저장

		// 해당 첨부파일 삭제
		for (AttachFile file : uploadFileList) {
			attachFileService.deleteAttachFilePath(file);
		}

		StringBuffer sb = new StringBuffer();
		sb.append("<script>\n");
		sb.append("    alert('저장되었습니다.');\n");
		sb.append("    document.location = '/erp/excelSave.do';\n");
		sb.append("</script>\n");

		response.setContentType("text/html");
		response.getOutputStream().print(new String(sb.toString().getBytes("UTF-8"), "8859_1"));
	}
}