package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("ProvDeductSetS")
public class ProvDeductSetS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String no;
	private String cudKey;
	private String compId;
	private String subjectKind;
	private String subjectCode;
	private String subjectName;
	private String useOrder;
	private String calcKind;
	private double avgKind;
	private String taxYnO;
	private String taxYnM;
	private double nonTaxAmt;
	private String remarks;
	private String sysEmpNo;

	public ProvDeductSetS() {
		super();
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

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

	public String getSubjectKind() {
		return subjectKind;
	}

	public void setSubjectKind(String subjectKind) {
		this.subjectKind = subjectKind;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getUseOrder() {
		return useOrder;
	}

	public void setUseOrder(String useOrder) {
		this.useOrder = useOrder;
	}

	public String getCalcKind() {
		return calcKind;
	}

	public void setCalcKind(String calcKind) {
		this.calcKind = calcKind;
	}

	public String getTaxYnO() {
		return taxYnO;
	}

	public void setTaxYnO(String taxYnO) {
		this.taxYnO = taxYnO;
	}

	public String getTaxYnM() {
		return taxYnM;
	}

	public void setTaxYnM(String taxYnM) {
		this.taxYnM = taxYnM;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public double getAvgKind() {
		return avgKind;
	}

	public void setAvgKind(double avgKind) {
		this.avgKind = avgKind;
	}

	public double getNonTaxAmt() {
		return nonTaxAmt;
	}

	public void setNonTaxAmt(double nonTaxAmt) {
		this.nonTaxAmt = nonTaxAmt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
