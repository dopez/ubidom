package com.ubi.erp.user.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("comboTest")
public class comboTest implements Serializable {
	private static final long serialVersionUID = 1L;

	private String custCode;
	private String custName;
	public comboTest() {
		super();
	}
	public comboTest(String custCode, String custName) {
		super();

		this.custCode = custCode;
		this.custName = custName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCustCode() {
		return custCode;
	}
	public String getCustName() {
		return custName;
	}
}
