package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("CertificateDataS")
public class CertificateDataS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cudKey;
	private String compId;
	private String empNo;
	private String sysEmpNo;
	private String passpostDate;
	private String passpostNo;
	private String certKind; // 1 : 재직,2:경력
	private String applyDate;
	private String workName; // 담당업무
	private String useType;
	private String custSubject;
	private String balgbja;
	private int maesu;
	// gridRight Column
	private String no;
	// grid 검색조건
	private String stDate;
	private String endDate;
	// pdf Column 추가
	private String korName;
	private String regiNumb;
	private String empAddres;
	private String postCode;
	private String postName;
	private String jikwee;
	private String enterDate;
	private String address;
	private String compName;
	private String presidentName;

	public CertificateDataS() {
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

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getPasspostDate() {
		return passpostDate;
	}

	public void setPasspostDate(String passpostDate) {
		this.passpostDate = passpostDate;
	}

	public String getPasspostNo() {
		return passpostNo;
	}

	public void setPasspostNo(String passpostNo) {
		this.passpostNo = passpostNo;
	}

	public String getCertKind() {
		return certKind;
	}

	public void setCertKind(String certKind) {
		this.certKind = certKind;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public String getUseType() {
		return useType;
	}

	public void setUseType(String useType) {
		this.useType = useType;
	}

	public String getCustSubject() {
		return custSubject;
	}

	public void setCustSubject(String custSubject) {
		this.custSubject = custSubject;
	}

	public String getBalgbja() {
		return balgbja;
	}

	public void setBalgbja(String balgbja) {
		this.balgbja = balgbja;
	}

	public int getMaesu() {
		return maesu;
	}

	public void setMaesu(int maesu) {
		this.maesu = maesu;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getStDate() {
		return stDate;
	}

	public void setStDate(String stDate) {
		this.stDate = stDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getRegiNumb() {
		return regiNumb;
	}

	public void setRegiNumb(String regiNumb) {
		this.regiNumb = regiNumb;
	}

	public String getEmpAddres() {
		return empAddres;
	}

	public void setEmpAddres(String empAddres) {
		this.empAddres = empAddres;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getJikwee() {
		return jikwee;
	}

	public void setJikwee(String jikwee) {
		this.jikwee = jikwee;
	}

	public String getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getPresidentName() {
		return presidentName;
	}

	public void setPresidentName(String presidentName) {
		this.presidentName = presidentName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
