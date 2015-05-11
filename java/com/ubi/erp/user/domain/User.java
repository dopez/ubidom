package com.ubi.erp.user.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("User")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	private String custCode;
	private String custName;
	private String empNo;
	private String empName;
	private String compId;

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
