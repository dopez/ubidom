package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("RewardDataS")
public class RewardDataS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cudKey;
	private String compId;
	private String empNo;
	private String seq;
	private String sysEmpNo;
	private String przPun; // 상벌구분 1: 상, 2: 벌
	private String apprCust; // 시행처
	private String stDate; // 시행날짜
	private String przPunCont; // 상벌내역
	// gridRight Column
	private String no;

	public RewardDataS() {
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

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getPrzPun() {
		return przPun;
	}

	public void setPrzPun(String przPun) {
		this.przPun = przPun;
	}

	public String getApprCust() {
		return apprCust;
	}

	public void setApprCust(String apprCust) {
		this.apprCust = apprCust;
	}

	public String getStDate() {
		return stDate;
	}

	public void setStDate(String stDate) {
		this.stDate = stDate;
	}

	public String getPrzPunCont() {
		return przPunCont;
	}

	public void setPrzPunCont(String przPunCont) {
		this.przPunCont = przPunCont;
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
