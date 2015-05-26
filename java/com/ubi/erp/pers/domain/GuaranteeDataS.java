package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("GuaranteeDataS")
public class GuaranteeDataS implements Serializable {
	private static final long serialVersionUID = 1L;
	// 공통사용 Column
	private String cudKey;
	private String compId;
	private String empNo;
	private String seq;
	private String sysEmpNo;
	// 보증보험
	private String startDate;
	private String endDate;
	private String insuCont;
	private int premium;
	private int insuAmt;
	private String insuComp;
	// 신원조회
	private String relatKind;
	private String relatName;
	private String juminNo;
	private String compName;
	private String jikweeName;
	private String scholName;
	private String addrs;
	// gridLeft 검색조건
	private String jikgun;
	private String serveGbn;
	private String postCode;
	// gridLeft Columns
	private String korName;
	private String postName;
	// gridRight Column
	private String no;

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

	public String getInsuCont() {
		return insuCont;
	}

	public void setInsuCont(String insuCont) {
		this.insuCont = insuCont;
	}

	public int getPremium() {
		return premium;
	}

	public void setPremium(int premium) {
		this.premium = premium;
	}

	public int getInsuAmt() {
		return insuAmt;
	}

	public void setInsuAmt(int insuAmt) {
		this.insuAmt = insuAmt;
	}

	public String getInsuComp() {
		return insuComp;
	}

	public void setInsuComp(String insuComp) {
		this.insuComp = insuComp;
	}

	public String getRelatKind() {
		return relatKind;
	}

	public void setRelatKind(String relatKind) {
		this.relatKind = relatKind;
	}

	public String getRelatName() {
		return relatName;
	}

	public void setRelatName(String relatName) {
		this.relatName = relatName;
	}

	public String getJuminNo() {
		return juminNo;
	}

	public void setJuminNo(String juminNo) {
		this.juminNo = juminNo;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getJikweeName() {
		return jikweeName;
	}

	public void setJikweeName(String jikweeName) {
		this.jikweeName = jikweeName;
	}

	public String getScholName() {
		return scholName;
	}

	public void setScholName(String scholName) {
		this.scholName = scholName;
	}

	public String getAddrs() {
		return addrs;
	}

	public void setAddrs(String addrs) {
		this.addrs = addrs;
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
