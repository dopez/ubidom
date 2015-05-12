package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("BaseCodeR")
public class BaseCodeR implements Serializable {
	private static final long serialVersionUID = 1L;
	private String compId;
	private String code;
	private String codeName;
	private String innerCode;
	private String innerCodeName;
	private String addVar;
	private String sysEmpNo;
	private String sysDate;
	private String descRmk;
	

	public BaseCodeR() {
		super();
	}


	public BaseCodeR(String compId, String code, String codeName,
			String innerCode, String innerCodeName, String addVar,
			String sysEmpNo, String sysDate, String descRmk) {
		super();
		this.compId = compId;
		this.code = code;
		this.codeName = codeName;
		this.innerCode = innerCode;
		this.innerCodeName = innerCodeName;
		this.addVar = addVar;
		this.sysEmpNo = sysEmpNo;
		this.sysDate = sysDate;
		this.descRmk = descRmk;
	}


	public String getCompId() {
		return compId;
	}


	public void setCompId(String compId) {
		this.compId = compId;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getCodeName() {
		return codeName;
	}


	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}


	public String getInnerCode() {
		return innerCode;
	}


	public void setInnerCode(String innerCode) {
		this.innerCode = innerCode;
	}


	public String getInnerCodeName() {
		return innerCodeName;
	}


	public void setInnerCodeName(String innerCodeName) {
		this.innerCodeName = innerCodeName;
	}


	public String getAddVar() {
		return addVar;
	}


	public void setAddVar(String addVar) {
		this.addVar = addVar;
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


	public String getDescRmk() {
		return descRmk;
	}


	public void setDescRmk(String descRmk) {
		this.descRmk = descRmk;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
