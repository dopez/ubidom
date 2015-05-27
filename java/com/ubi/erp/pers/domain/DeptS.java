package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("DeptS")
public class DeptS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String no;
	private String compId;
	private String postCode;
	private String stDate;
	private String endDate;
	private String postName;
	private String costKind;
	private String sysEmpNo;
	private String sysDate;
	private String postNameMst;
	private String cudKey;

	public DeptS() {
		super();
	}

	public DeptS(String no, String compId, String postCode, String stDate,
			String endDate, String postName, String costKind, String sysEmpNo,
			String sysDate, String postNameMst, String cudKey) {
		super();
		this.no = no;
		this.compId = compId;
		this.postCode = postCode;
		this.stDate = stDate;
		this.endDate = endDate;
		this.postName = postName;
		this.costKind = costKind;
		this.sysEmpNo = sysEmpNo;
		this.sysDate = sysDate;
		this.postNameMst = postNameMst;
		this.cudKey = cudKey;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getStDate() {
		return stDate;
	}

	public void setStDate(String stDate) {
		this.stDate = stDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getCostKind() {
		return costKind;
	}

	public void setCostKind(String costKind) {
		this.costKind = costKind;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getSysDate() {
		return sysDate;
	}

	public void setSysDate(String sysDate) {
		this.sysDate = sysDate;
	}

	public String getPostNameMst() {
		return postNameMst;
	}

	public void setPostNameMst(String postNameMst) {
		this.postNameMst = postNameMst;
	}

	public String getCudKey() {
		return cudKey;
	}

	public void setCudKey(String cudKey) {
		this.cudKey = cudKey;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
