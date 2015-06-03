package com.ubi.erp.sale.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("WorkLogPersR")
public class WorkLogPersR implements Serializable {
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
	
	private String seq;

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
}
