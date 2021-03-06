package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("MonthByDiliR")
public class MonthByDiliR implements Serializable {
	private static final long serialVersionUID = 1L;
	private String no;
	private String compId;
	private String yymm;
	private String empNo;
	private String postCode;
	private String korName;
	private String postName;
	private String jikweeName;
	private String jikgun;
	private double workDay;
	private double workTime;
	private double overTime;
	private double nightTime;
	private double partTime;
	private double midnightTime;
	private double earlyTime;
	private double lateTime;
	private double holiTime;
	private double holiOver;
	private double totalTime;
	private double weekHoliy;
	private double absence;
	private double awol;
	private double yuncha;
	private String frYymm;
	private String toYymm;

	public MonthByDiliR() {
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

	public String getYymm() {
		return yymm;
	}

	public void setYymm(String yymm) {
		this.yymm = yymm;
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

	public double getWorkDay() {
		return workDay;
	}

	public void setWorkDay(double workDay) {
		this.workDay = workDay;
	}

	public double getWorkTime() {
		return workTime;
	}

	public void setWorkTime(double workTime) {
		this.workTime = workTime;
	}

	public double getOverTime() {
		return overTime;
	}

	public void setOverTime(double overTime) {
		this.overTime = overTime;
	}

	public double getNightTime() {
		return nightTime;
	}

	public void setNightTime(double nightTime) {
		this.nightTime = nightTime;
	}

	public double getPartTime() {
		return partTime;
	}

	public void setPartTime(double partTime) {
		this.partTime = partTime;
	}

	public double getMidnightTime() {
		return midnightTime;
	}

	public void setMidnightTime(double midnightTime) {
		this.midnightTime = midnightTime;
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

	public double getHoliTime() {
		return holiTime;
	}

	public void setHoliTime(double holiTime) {
		this.holiTime = holiTime;
	}

	public double getHoliOver() {
		return holiOver;
	}

	public void setHoliOver(double holiOver) {
		this.holiOver = holiOver;
	}

	public double getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(double totalTime) {
		this.totalTime = totalTime;
	}

	public double getWeekHoliy() {
		return weekHoliy;
	}

	public void setWeekHoliy(double weekHoliy) {
		this.weekHoliy = weekHoliy;
	}

	public double getAbsence() {
		return absence;
	}

	public void setAbsence(double absence) {
		this.absence = absence;
	}

	public double getAwol() {
		return awol;
	}

	public void setAwol(double awol) {
		this.awol = awol;
	}

	public double getYuncha() {
		return yuncha;
	}

	public void setYuncha(double yuncha) {
		this.yuncha = yuncha;
	}

	public String getFrYymm() {
		return frYymm;
	}

	public void setFrYymm(String frYymm) {
		this.frYymm = frYymm;
	}

	public String getToYymm() {
		return toYymm;
	}

	public void setToYymm(String toYymm) {
		this.toYymm = toYymm;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
