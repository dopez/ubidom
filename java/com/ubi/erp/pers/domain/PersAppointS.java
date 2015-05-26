package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("PersAppointS")
public class PersAppointS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String no;
	private String compId;
	private String cudKey;
	private String empNo;
	private String postCode;
	private String postName;
	private String korName;
	private String balDate;
	private String payGbn;
	private String serveGbn;
	private String balGbn;
	private String jikgun;
	private String jikwee;
	private String jikmu;
	private String jikchak;
	private String basePay;
	private String sysEmpNo;
	private String code;
	// 내부코드, 내부코드명 받아오는 변수
	private String interCode;
	private String interName;

	public PersAppointS() {
		super();
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getCudKey() {
		return cudKey;
	}

	public void setCudKey(String cudKey) {
		this.cudKey = cudKey;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
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

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getBalDate() {
		return balDate;
	}

	public void setBalDate(String balDate) {
		this.balDate = balDate;
	}

	public String getPayGbn() {
		return payGbn;
	}

	public void setPayGbn(String payGbn) {
		this.payGbn = payGbn;
	}

	public String getServeGbn() {
		return serveGbn;
	}

	public void setServeGbn(String serveGbn) {
		this.serveGbn = serveGbn;
	}

	public String getBalGbn() {
		return balGbn;
	}

	public void setBalGbn(String balGbn) {
		this.balGbn = balGbn;
	}

	public String getJikgun() {
		return jikgun;
	}

	public void setJikgun(String jikgun) {
		this.jikgun = jikgun;
	}

	public String getJikwee() {
		return jikwee;
	}

	public void setJikwee(String jikwee) {
		this.jikwee = jikwee;
	}

	public String getJikmu() {
		return jikmu;
	}

	public void setJikmu(String jikmu) {
		this.jikmu = jikmu;
	}

	public String getJikchak() {
		return jikchak;
	}

	public void setJikchak(String jikchak) {
		this.jikchak = jikchak;
	}

	public String getBasePay() {
		return basePay;
	}

	public void setBasePay(String basePay) {
		this.basePay = basePay;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
