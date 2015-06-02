package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("VariableBaseWageR")
public class VariableBaseWageR implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cudKey;
	private String compId;
	private String empNo;
	private String no;
	private String sysEmpNo;
	private String subjectCode;
	private String subjectKind;
	private String subjectName;
	private double payAmt;
	// gridLeft 검색조건
	private String jikgun;
	private String serveGbn;
	private String postCode;
	private String yymm;
	// gridLeft Columns
	private String korName;
	private String postName;
	private String jikwee;
	private String jikweeName;
	private String regiNumb;

	public VariableBaseWageR() {
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

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectKind() {
		return subjectKind;
	}

	public void setSubjectKind(String subjectKind) {
		this.subjectKind = subjectKind;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public double getPayAmt() {
		return payAmt;
	}

	public void setPayAmt(double payAmt) {
		this.payAmt = payAmt;
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

	public String getYymm() {
		return yymm;
	}

	public void setYymm(String yymm) {
		this.yymm = yymm;
	}

	public String getJikwee() {
		return jikwee;
	}

	public void setJikwee(String jikwee) {
		this.jikwee = jikwee;
	}

	public String getJikweeName() {
		return jikweeName;
	}

	public void setJikweeName(String jikweeName) {
		this.jikweeName = jikweeName;
	}

	public String getRegiNumb() {
		return regiNumb;
	}

	public void setRegiNumb(String regiNumb) {
		this.regiNumb = regiNumb;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
