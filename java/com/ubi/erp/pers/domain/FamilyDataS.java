package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("FamilyDataS")
public class FamilyDataS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cudKey;
	private String compId;
	private String empNo;
	private String seq;
	private String famRel;
	private String famName;
	private int depend;
	private String juminNo;
	private String liveWith;
	private String disaYn;
	private String job;
	private String scholarship;
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

	public FamilyDataS() {
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

	public String getFamRel() {
		return famRel;
	}

	public void setFamRel(String famRel) {
		this.famRel = famRel;
	}

	public String getFamName() {
		return famName;
	}

	public void setFamName(String famName) {
		this.famName = famName;
	}

	public int getDepend() {
		return depend;
	}

	public void setDepend(int depend) {
		this.depend = depend;
	}

	public String getJuminNo() {
		return juminNo;
	}

	public void setJuminNo(String juminNo) {
		this.juminNo = juminNo;
	}

	public String getLiveWith() {
		return liveWith;
	}

	public void setLiveWith(String liveWith) {
		this.liveWith = liveWith;
	}

	public String getDisaYn() {
		return disaYn;
	}

	public void setDisaYn(String disaYn) {
		this.disaYn = disaYn;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getScholarship() {
		return scholarship;
	}

	public void setScholarship(String scholarship) {
		this.scholarship = scholarship;
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
