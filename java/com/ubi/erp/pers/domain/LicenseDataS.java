package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("LicenseDataS")
public class LicenseDataS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cudKey;
	private String compId;
	private String empNo;
	private String seq;
	private String qualKind;
	private String qualPay;
	private String achiDate;
	private String apprCust;
	private String qualName;
	private String qualGd;
	private String sysEmpNo;
	// gridRight Column
	private String no;

	public LicenseDataS() {
		super();
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

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getQualKind() {
		return qualKind;
	}

	public void setQualKind(String qualKind) {
		this.qualKind = qualKind;
	}

	public String getQualPay() {
		return qualPay;
	}

	public void setQualPay(String qualPay) {
		this.qualPay = qualPay;
	}

	public String getAchiDate() {
		return achiDate;
	}

	public void setAchiDate(String achiDate) {
		this.achiDate = achiDate;
	}

	public String getApprCust() {
		return apprCust;
	}

	public void setApprCust(String apprCust) {
		this.apprCust = apprCust;
	}

	public String getQualName() {
		return qualName;
	}

	public void setQualName(String qualName) {
		this.qualName = qualName;
	}

	public String getQualGd() {
		return qualGd;
	}

	public void setQualGd(String qualGd) {
		this.qualGd = qualGd;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
