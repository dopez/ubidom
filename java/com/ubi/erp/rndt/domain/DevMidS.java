package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("DevMidS")
public class DevMidS implements Serializable {
	private static final long serialVersionUID = 1L;

	private int cnt;

	private String rNum;

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
	}

	private String compId;

	private String sysEmpNo;

	private String cudKey;

	private String planNumb;

	private String problemName;

	/* 폼 마스터 */;

	private String setDate;

	private String setSeq;

	private String empNo;

	private String opKind;

	/* tab1 */;

	private String entryKind;

	private String contents;
	/* tab234 */;

	private String evaluateKind;
	/* tab5 */;

	private String planKind;

	private String planDate;

	private String dayQty;

	private String juDept;

	private String booDept;

	private String cPlanDate;

	private String cDayQty;

	private String cJuDept;

	private String cBooDept;

	private String role;

	private String outSourcing;

	/* tab6 */;

	private String dataKind;

	private String staff;

	private String mm;

	private String totMm;

	private String cStaff;

	private String cMm;

	private String cTotMm;

	private String remarks;
	/* tab7 */;

	private String itemName;

	private String techName;

	private String targetMatr;

	private String cItemName;

	private String cTechName;

	private String cTargetMatr;
	/* tab8 */;

	private String investKind;

	private String dhAmt;

	private String totAmt;

	private String cDhAmt;

	private String cTotAmt;

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

	public String getOpKind() {
		return opKind;
	}

	public void setOpKind(String opKind) {
		this.opKind = opKind;
	}

	public String getEntryKind() {
		return entryKind;
	}

	public void setEntryKind(String entryKind) {
		this.entryKind = entryKind;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getEvaluateKind() {
		return evaluateKind;
	}

	public void setEvaluateKind(String evaluateKind) {
		this.evaluateKind = evaluateKind;
	}

	public String getPlanKind() {
		return planKind;
	}

	public void setPlanKind(String planKind) {
		this.planKind = planKind;
	}

	public String getPlanDate() {
		return planDate;
	}

	public void setPlanDate(String planDate) {
		this.planDate = planDate;
	}

	public String getDayQty() {
		return dayQty;
	}

	public void setDayQty(String dayQty) {
		this.dayQty = dayQty;
	}

	public String getJuDept() {
		return juDept;
	}

	public void setJuDept(String juDept) {
		this.juDept = juDept;
	}

	public String getBooDept() {
		return booDept;
	}

	public void setBooDept(String booDept) {
		this.booDept = booDept;
	}

	public String getcPlanDate() {
		return cPlanDate;
	}

	public void setcPlanDate(String cPlanDate) {
		this.cPlanDate = cPlanDate;
	}

	public String getcDayQty() {
		return cDayQty;
	}

	public void setcDayQty(String cDayQty) {
		this.cDayQty = cDayQty;
	}

	public String getcJuDept() {
		return cJuDept;
	}

	public void setcJuDept(String cJuDept) {
		this.cJuDept = cJuDept;
	}

	public String getcBooDept() {
		return cBooDept;
	}

	public void setcBooDept(String cBooDept) {
		this.cBooDept = cBooDept;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getOutSourcing() {
		return outSourcing;
	}

	public void setOutSourcing(String outSourcing) {
		this.outSourcing = outSourcing;
	}

	public String getDataKind() {
		return dataKind;
	}

	public void setDataKind(String dataKind) {
		this.dataKind = dataKind;
	}

	public String getStaff() {
		return staff;
	}

	public void setStaff(String staff) {
		this.staff = staff;
	}

	public String getMm() {
		return mm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public String getTotMm() {
		return totMm;
	}

	public void setTotMm(String totMm) {
		this.totMm = totMm;
	}

	public String getcStaff() {
		return cStaff;
	}

	public void setcStaff(String cStaff) {
		this.cStaff = cStaff;
	}

	public String getcMm() {
		return cMm;
	}

	public void setcMm(String cMm) {
		this.cMm = cMm;
	}

	public String getcTotMm() {
		return cTotMm;
	}

	public void setcTotMm(String cTotMm) {
		this.cTotMm = cTotMm;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getTechName() {
		return techName;
	}

	public void setTechName(String techName) {
		this.techName = techName;
	}

	public String getTargetMatr() {
		return targetMatr;
	}

	public void setTargetMatr(String targetMatr) {
		this.targetMatr = targetMatr;
	}

	public String getcItemName() {
		return cItemName;
	}

	public void setcItemName(String cItemName) {
		this.cItemName = cItemName;
	}

	public String getcTechName() {
		return cTechName;
	}

	public void setcTechName(String cTechName) {
		this.cTechName = cTechName;
	}

	public String getcTargetMatr() {
		return cTargetMatr;
	}

	public void setcTargetMatr(String cTargetMatr) {
		this.cTargetMatr = cTargetMatr;
	}

	public String getInvestKind() {
		return investKind;
	}

	public void setInvestKind(String investKind) {
		this.investKind = investKind;
	}

	public String getDhAmt() {
		return dhAmt;
	}

	public void setDhAmt(String dhAmt) {
		this.dhAmt = dhAmt;
	}

	public String getTotAmt() {
		return totAmt;
	}

	public void setTotAmt(String totAmt) {
		this.totAmt = totAmt;
	}

	public String getcDhAmt() {
		return cDhAmt;
	}

	public void setcDhAmt(String cDhAmt) {
		this.cDhAmt = cDhAmt;
	}

	public String getcTotAmt() {
		return cTotAmt;
	}

	public void setcTotAmt(String cTotAmt) {
		this.cTotAmt = cTotAmt;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



}