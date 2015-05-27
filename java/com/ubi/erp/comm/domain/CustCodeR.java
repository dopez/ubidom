package com.ubi.erp.comm.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("CustCodeR")
public class CustCodeR implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String compid;
	
	private String custCode;
	
	private String custKorName;

	public String getCompid() {
		return compid;
	}

	public void setCompid(String compid) {
		this.compid = compid;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public CustCodeR() {
		super();
	}

	public CustCodeR(String compid, String custCode, String custKorName) {
		super();
		this.compid = compid;
		this.custCode = custCode;
		this.custKorName = custKorName;
	}
	
}
