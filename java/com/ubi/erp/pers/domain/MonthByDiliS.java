package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("MonthByDiliS")
public class MonthByDiliS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String no;
	private String cudKey;
	private String compId;
	private String empNo;
	private String postCode;
	private String korName;
	private String postName;
	private String jikweeName;
	private String jikgun;
	private String sysEmpNo;
}
