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
	private String interCode;
	private String interName;

	// 가 코드 데이터 set Column
	private String payGbnNm;
	private String serveGbnNm;
	private String balGbnNm;
	private String jikgunNm;
	private String jikmuNm;
	private String jikweeNm;
	private String jikchakNm;
	private String compIdNm;

	public PersAppointS() {
		super();

	}

	public PersAppointS(String no, String compId, String cudKey, String empNo,
			String postCode, String postName, String korName, String balDate,
			String payGbn, String serveGbn, String balGbn, String jikgun,
			String jikwee, String jikmu, String jikchak, String basePay,
			String sysEmpNo, String code, String interCode, String interName,
			String payGbnNm, String serveGbnNm, String balGbnNm,
			String jikgunNm, String jikmuNm, String jikweeNm, String jikchakNm,
			String compIdNm) {
		super();
		this.no = no;
		this.compId = compId;
		this.cudKey = cudKey;
		this.empNo = empNo;
		this.postCode = postCode;
		this.postName = postName;
		this.korName = korName;
		this.balDate = balDate;
		this.payGbn = payGbn;
		this.serveGbn = serveGbn;
		this.balGbn = balGbn;
		this.jikgun = jikgun;
		this.jikwee = jikwee;
		this.jikmu = jikmu;
		this.jikchak = jikchak;
		this.basePay = basePay;
		this.sysEmpNo = sysEmpNo;
		this.code = code;
		this.interCode = interCode;
		this.interName = interName;
		this.payGbnNm = payGbnNm;
		this.serveGbnNm = serveGbnNm;
		this.balGbnNm = balGbnNm;
		this.jikgunNm = jikgunNm;
		this.jikmuNm = jikmuNm;
		this.jikweeNm = jikweeNm;
		this.jikchakNm = jikchakNm;
		this.compIdNm = compIdNm;
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

	public String getPayGbnNm() {
		return payGbnNm;
	}

	public void setPayGbnNm(String payGbnNm) {
		this.payGbnNm = payGbnNm;
	}

	public String getServeGbnNm() {
		return serveGbnNm;
	}

	public void setServeGbnNm(String serveGbnNm) {
		this.serveGbnNm = serveGbnNm;
	}

	public String getBalGbnNm() {
		return balGbnNm;
	}

	public void setBalGbnNm(String balGbnNm) {
		this.balGbnNm = balGbnNm;
	}

	public String getJikgunNm() {
		return jikgunNm;
	}

	public void setJikgunNm(String jikgunNm) {
		this.jikgunNm = jikgunNm;
	}

	public String getJikmuNm() {
		return jikmuNm;
	}

	public void setJikmuNm(String jikmuNm) {
		this.jikmuNm = jikmuNm;
	}

	public String getJikweeNm() {
		return jikweeNm;
	}

	public void setJikweeNm(String jikweeNm) {
		this.jikweeNm = jikweeNm;
	}

	public String getJikchakNm() {
		return jikchakNm;
	}

	public void setJikchakNm(String jikchakNm) {
		this.jikchakNm = jikchakNm;
	}

	public String getCompIdNm() {
		return compIdNm;
	}

	public void setCompIdNm(String compIdNm) {
		this.compIdNm = compIdNm;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
