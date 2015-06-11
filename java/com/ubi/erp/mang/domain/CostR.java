package com.ubi.erp.mang.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("CostR")
public class CostR implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String itemCode;
	private String itemName;
	private String itemSpec;

	private String compId;
	private String ioChk;
	private String custCode;
	private String custName;
	private String pstDate;
	private String pendDate;
	private String prc;
	private String mnyEa;
	private String bigo;

}
