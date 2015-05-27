package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("EducationDataS")
public class EducationDataS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cudKey;
	private String compId;
	private String empNo;
	private String seq;
	private String eduName;
	private String eduDate;
	private String eduCust;
	private String gbn;
	private String eduTime;
	private String remarks;
	private String sysEmpNo;
	// gridLeft 검색조건
	private String jikgun;
	private String serveGbn;
	private String postCode;
	// gridLeft Columns
	private String korName;
	private String postName;
	// gridRight Column
	private String no;

	public EducationDataS() {
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

	public String getEduName() {
		return eduName;
	}

	public void setEduName(String eduName) {
		this.eduName = eduName;
	}

	public String getEduDate() {
		return eduDate;
	}

	public void setEduDate(String eduDate) {
		this.eduDate = eduDate;
	}

	public String getEduCust() {
		return eduCust;
	}

	public void setEduCust(String eduCust) {
		this.eduCust = eduCust;
	}

	public String getGbn() {
		return gbn;
	}

	public void setGbn(String gbn) {
		this.gbn = gbn;
	}

	public String getEduTime() {
		return eduTime;
	}

	public void setEduTime(String eduTime) {
		this.eduTime = eduTime;
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

	public String getJikgun() {
		return jikgun;
	}

	public void setJikgun(String jikgun) {
		this.jikgun = jikgun;
	}

	public String getServeGbn() {
		return serveGbn;
	}

	public void setServeGbn(String serveGbn) {
		this.serveGbn = serveGbn;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
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
