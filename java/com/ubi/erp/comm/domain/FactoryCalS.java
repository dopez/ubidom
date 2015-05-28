package com.ubi.erp.comm.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("FactoryCalS")
public class FactoryCalS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cudKey;
	private String compId;
	private String yyyy;
	private String mm;
	private String dd;
	private String weekKnd;
	private String empNo;
	private String holyKnd;
	private String dayWeek;
	private String workTime;
	private String note;
	private String sysEmpNo;
	private String no;

	public FactoryCalS() {
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

	public String getYyyy() {
		return yyyy;
	}

	public void setYyyy(String yyyy) {
		this.yyyy = yyyy;
	}

	public String getMm() {
		return mm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getWeekKnd() {
		return weekKnd;
	}

	public void setWeekKnd(String weekKnd) {
		this.weekKnd = weekKnd;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getHolyKnd() {
		return holyKnd;
	}

	public void setHolyKnd(String holyKnd) {
		this.holyKnd = holyKnd;
	}

	public String getDayWeek() {
		return dayWeek;
	}

	public void setDayWeek(String dayWeek) {
		this.dayWeek = dayWeek;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
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
