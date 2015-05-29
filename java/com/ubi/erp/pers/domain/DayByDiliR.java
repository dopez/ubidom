package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("DayByDiliR")
public class DayByDiliR implements Serializable {
	private static final long serialVersionUID = 1L;
	private String no;
	private String compId;
	private String empNo;
	private String postCode;
	private String korName;
	private String postName;
	private String jikweeName;
	private String jikgun;
	private String workDate;
	private String workKind;
	private double overTime;
	private double nightTime;
	private double workTime;
	private double partTime;
	private double holiTime;
	private double earlyTime;
	private double lateTime;
	private double totalTime;
	private String sysEmpNo;
	// popup Column
	private String frDate;
	private String toDate;
	private String inoutChk;

	public DayByDiliR() {
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

	public String getJikweeName() {
		return jikweeName;
	}

	public void setJikweeName(String jikweeName) {
		this.jikweeName = jikweeName;
	}

	public String getJikgun() {
		return jikgun;
	}

	public void setJikgun(String jikgun) {
		this.jikgun = jikgun;
	}

	public String getWorkDate() {
		return workDate;
	}

	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}

	public String getWorkKind() {
		return workKind;
	}

	public void setWorkKind(String workKind) {
		this.workKind = workKind;
	}

	public double getOverTime() {
		return overTime;
	}

	public void setOverTime(double overTime) {
		this.overTime = overTime;
	}

	public double getHoliTime() {
		return holiTime;
	}

	public void setHoliTime(double holiTime) {
		this.holiTime = holiTime;
	}

	public double getNightTime() {
		return nightTime;
	}

	public void setNightTime(double nightTime) {
		this.nightTime = nightTime;
	}

	public double getWorkTime() {
		return workTime;
	}

	public void setWorkTime(double workTime) {
		this.workTime = workTime;
	}

	public double getPartTime() {
		return partTime;
	}

	public void setPartTime(double partTime) {
		this.partTime = partTime;
	}

	public double getEarlyTime() {
		return earlyTime;
	}

	public void setEarlyTime(double earlyTime) {
		this.earlyTime = earlyTime;
	}

	public double getLateTime() {
		return lateTime;
	}

	public void setLateTime(double lateTime) {
		this.lateTime = lateTime;
	}

	public double getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(double totalTime) {
		this.totalTime = totalTime;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getFrDate() {
		return frDate;
	}

	public void setFrDate(String frDate) {
		this.frDate = frDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getInoutChk() {
		return inoutChk;
	}

	public void setInoutChk(String inoutChk) {
		this.inoutChk = inoutChk;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
