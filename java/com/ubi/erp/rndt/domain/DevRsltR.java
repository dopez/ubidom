package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("DevRsltR")
public class DevRsltR implements Serializable {
	private static final long serialVersionUID = 1L;

	private String compId;
	private String setDate;
	private String setSeq;
	private String empNo;
	private String empName;

	private String ppsEmp;

	private String ppsEmpName;

	private String planNumb;

	private String problemName;

	private String dueDate;

	private String targetItem;
	private String totAmt;

	private String stDate;
	private String endDate;

	private String dd;

	private String sumCDhAmt;
	private String cStDate;
	private String cEndDate;

	private String cDd;

	private String midevalKind;
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getSetDate() {
		return setDate;
	}
	public void setSetDate(String setDate) {
		this.setDate = setDate;
	}
	public String getSetSeq() {
		return setSeq;
	}
	public void setSetSeq(String setSeq) {
		this.setSeq = setSeq;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getPpsEmp() {
		return ppsEmp;
	}

	public void setPpsEmp(String ppsEmp) {
		this.ppsEmp = ppsEmp;
	}

	public String getPpsEmpName() {
		return ppsEmpName;
	}

	public void setPpsEmpName(String ppsEmpName) {
		this.ppsEmpName = ppsEmpName;
	}

	public String getPlanNumb() {
		return planNumb;
	}

	public void setPlanNumb(String planNumb) {
		this.planNumb = planNumb;
	}

	public String getProblemName() {
		return problemName;
	}

	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getTargetItem() {
		return targetItem;
	}

	public void setTargetItem(String targetItem) {
		this.targetItem = targetItem;
	}
	public String getTotAmt() {
		return totAmt;
	}
	public void setTotAmt(String totAmt) {
		this.totAmt = totAmt;
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

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getSumCDhAmt() {
		return sumCDhAmt;
	}

	public void setSumCDhAmt(String sumCDhAmt) {
		this.sumCDhAmt = sumCDhAmt;
	}
	public String getcStDate() {
		return cStDate;
	}
	public void setcStDate(String cStDate) {
		this.cStDate = cStDate;
	}
	public String getcEndDate() {
		return cEndDate;
	}
	public void setcEndDate(String cEndDate) {
		this.cEndDate = cEndDate;
	}

	public String getcDd() {
		return cDd;
	}

	public void setcDd(String cDd) {
		this.cDd = cDd;
	}

	public String getMidevalKind() {
		return midevalKind;
	}

	public void setMidevalKind(String midevalKind) {
		this.midevalKind = midevalKind;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}