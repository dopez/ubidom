package com.ubi.erp.sale.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("WorkLogAllR")
public class WorkLogAllR implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String cudKey;
	private String compId;
	private String logKind;
	private String logDate;
	private String logSeq;
	private int rNum;
	private String empNo;
	private String korName;
	private String workKind;
	private String logNum;
	private String logName;
	private String custCode;
	private String custKorName;
	private String logNote;
	private String fileName;
	private String sysEmpNo;
	private String frDate;
	private String toDate;
	private String HlogKind;
	private String HworkKind;
	
	
	private String seq;

	private int col1;
	private int col2;
	private int col3;
	private int col4;
	private int col5;
	private int col6;
	private int col7;
	private int col8;
	private int colSum;

	public String getCudKey() {
		return cudKey;
	}

	public void setCudKey(String cudKey) {
		this.cudKey = cudKey;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getLogKind() {
		return logKind;
	}

	public void setLogKind(String logKind) {
		this.logKind = logKind;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public String getLogSeq() {
		return logSeq;
	}

	public void setLogSeq(String logSeq) {
		this.logSeq = logSeq;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getWorkKind() {
		return workKind;
	}

	public void setWorkKind(String workKind) {
		this.workKind = workKind;
	}

	public String getLogNum() {
		return logNum;
	}

	public void setLogNum(String logNum) {
		this.logNum = logNum;
	}

	public String getLogName() {
		return logName;
	}

	public void setLogName(String logName) {
		this.logName = logName;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}

	public String getCustKorName() {
		return custKorName;
	}

	public void setCustKorName(String custKorName) {
		this.custKorName = custKorName;
	}

	public String getLogNote() {
		return logNote;
	}

	public void setLogNote(String logNote) {
		this.logNote = logNote;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public int getCol1() {
		return col1;
	}

	public void setCol1(int col1) {
		this.col1 = col1;
	}

	public int getCol2() {
		return col2;
	}

	public void setCol2(int col2) {
		this.col2 = col2;
	}

	public int getCol3() {
		return col3;
	}

	public void setCol3(int col3) {
		this.col3 = col3;
	}

	public int getCol4() {
		return col4;
	}

	public void setCol4(int col4) {
		this.col4 = col4;
	}

	public int getCol5() {
		return col5;
	}

	public void setCol5(int col5) {
		this.col5 = col5;
	}

	public int getCol6() {
		return col6;
	}

	public void setCol6(int col6) {
		this.col6 = col6;
	}

	public int getCol7() {
		return col7;
	}

	public void setCol7(int col7) {
		this.col7 = col7;
	}

	public int getCol8() {
		return col8;
	}

	public void setCol8(int col8) {
		this.col8 = col8;
	}

	public int getColSum() {
		return colSum;
	}

	public void setColSum(int colSum) {
		this.colSum = colSum;
	}

	public String getFrDate() {
		return frDate;
	}

	public void setFrDate(String frDate) {
		this.frDate = frDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getHlogKind() {
		return HlogKind;
	}

	public void setHlogKind(String hlogKind) {
		HlogKind = hlogKind;
	}

	public String getHworkKind() {
		return HworkKind;
	}

	public void setHworkKind(String hworkKind) {
		HworkKind = hworkKind;
	}
}
