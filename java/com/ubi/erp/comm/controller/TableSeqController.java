package com.ubi.erp.comm.controller;

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

import com.ubi.erp.comm.domain.TableSeq;
import com.ubi.erp.comm.service.TableSeqService;

@RestController
@RequestMapping(value = "/erp/comm/stan/tableSeq")
public class TableSeqController {
	
	@Autowired
	private TableSeqService tableSeqSservice;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selTableSeq1",method = RequestMethod.POST)
	public List<TableSeq> selTableSeq1(HttpServletRequest request, HttpServletResponse response,HttpSession session,TableSeq tableSeq) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String tableName = tableSeq.getTableName();
		String seqColumn = tableSeq.getSeqColumn();
		String dateColumn1 = tableSeq.getDateColumn1();
		String columnData1 = tableSeq.getColumnData1();
		int returnLen = tableSeq.getReturnLen();
		map.put("compId", compId);
		map.put("tableName", tableName);
		map.put("seqColumn", seqColumn);
		map.put("dateColumn1", dateColumn1);
		map.put("columnData1", columnData1);
		map.put("returnLen", returnLen);
		map.put("o_cursor", null);
		tableSeqSservice.selTableSeq1(map);
		List<TableSeq> list = (List<TableSeq>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selTableSeq2",method = RequestMethod.POST)
	public List<TableSeq> selTableSeq2(HttpServletRequest request, HttpServletResponse response,HttpSession session,TableSeq tableSeq) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String tableName = tableSeq.getTableName();
		String seqColumn = tableSeq.getSeqColumn();
		String dateColumn1 = tableSeq.getDateColumn1();
		String columnData1 = tableSeq.getColumnData1();
		String dateColumn2 = tableSeq.getDateColumn2();
		String columnData2 = tableSeq.getColumnData2();
		int returnLen = tableSeq.getReturnLen();
		map.put("compId", compId);
		map.put("tableName", tableName);
		map.put("seqColumn", seqColumn);
		map.put("dateColumn1", dateColumn1);
		map.put("columnData1", columnData1);
		map.put("dateColumn2", dateColumn2);
		map.put("columnData2", columnData2);
		map.put("returnLen", returnLen);
		map.put("o_cursor", null);
		tableSeqSservice.selTableSeq2(map);
		List<TableSeq> list = (List<TableSeq>) map.get("o_cursor");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/selTableSeq3",method = RequestMethod.POST)
	public List<TableSeq> selTableSeq3(HttpServletRequest request, HttpServletResponse response,HttpSession session,TableSeq tableSeq) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String compId = (String) session.getAttribute("compId");
		String tableName = tableSeq.getTableName();
		String seqColumn = tableSeq.getSeqColumn();
		String dateColumn1 = tableSeq.getDateColumn1();
		String columnData1 = tableSeq.getColumnData1();
		String dateColumn2 = tableSeq.getDateColumn2();
		String columnData2 = tableSeq.getColumnData2();
		String dateColumn3 = tableSeq.getDateColumn3();
		String columnData3 = tableSeq.getColumnData3();
		int returnLen = tableSeq.getReturnLen();
		map.put("compId", compId);
		map.put("tableName", tableName);
		map.put("seqColumn", seqColumn);
		map.put("dateColumn1", dateColumn1);
		map.put("columnData1", columnData1);
		map.put("dateColumn2", dateColumn2);
		map.put("columnData2", columnData2);
		map.put("dateColumn3", dateColumn3);
		map.put("columnData3", columnData3);
		map.put("returnLen", returnLen);
		map.put("o_cursor", null);
		tableSeqSservice.selTableSeq3(map);
		List<TableSeq> list = (List<TableSeq>) map.get("o_cursor");
		return list;
	}
}

