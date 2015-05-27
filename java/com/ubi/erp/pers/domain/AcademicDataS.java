package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("AcademicDataS")
public class AcademicDataS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cudKey;
	private String compId;
	private String empNo;
	private String seq;
	private String eduKind;
	private String eduName;
	private String startDate;
	private String endDate;
	private String specCode1;
	private String specCode2;
	private String gradLast;
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

	public AcademicDataS() {
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

	public String getEduKind() {
		return eduKind;
	}

	public void setEduKind(String eduKind) {
		this.eduKind = eduKind;
	}

	public String getEduName() {
		return eduName;
	}

	public void setEduName(String eduName) {
		this.eduName = eduName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSpecCode1() {
		return specCode1;
	}

	public void setSpecCode1(String specCode1) {
		this.specCode1 = specCode1;
	}

	public String getSpecCode2() {
		return specCode2;
	}

	public void setSpecCode2(String specCode2) {
		this.specCode2 = specCode2;
	}

	public String getGradLast() {
		return gradLast;
	}

	public void setGradLast(String gradLast) {
		this.gradLast = gradLast;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
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
