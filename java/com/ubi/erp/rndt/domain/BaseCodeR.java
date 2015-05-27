package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("BaseCodeR")
public class BaseCodeR implements Serializable {
	private static final long serialVersionUID = 1L;
	private String comp;
	private String code;
	private String codeName;
	private String interCode;
	private String interName;
	private String addVar;
	private String sysEmpNo;
	private String sysDate;
	private String descRmk;

	public BaseCodeR() {
		super();
	}

	public BaseCodeR(String comp, String code, String codeName,
			String interCode, String interName, String addVar, String sysEmpNo,
			String sysDate, String descRmk) {
		super();
		this.comp = comp;
		this.code = code;
		this.codeName = codeName;
		this.interCode = interCode;
		this.interName = interName;
		this.addVar = addVar;
		this.sysEmpNo = sysEmpNo;
		this.sysDate = sysDate;
		this.descRmk = descRmk;
	}

	public String getComp() {
		return comp;
	}

	public void setComp(String comp) {
		this.comp = comp;
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

	public String getInterCode() {
		return interCode;
	}

	public void setInterCode(String interCode) {
		this.interCode = interCode;
	}

	public String getInterName() {
		return interName;
	}

	public void setInterName(String interName) {
		this.interName = interName;
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
