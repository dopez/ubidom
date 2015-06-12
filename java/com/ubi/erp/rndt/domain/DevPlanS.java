package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("DevPlanS")
public class DevPlanS implements Serializable {
	private static final long serialVersionUID = 1L;

	private String compId;

	private String cudKey;

	/* tab cudKey */
	private String cudKey1;

	private String cudKey2;

	private String cudKey5;

	private String cudKey6;

	// mst
	private String setDate;

	private String setSeq;

	private String writerEmp;

	private String ppsEmp;

	private String ppsDept;

	private String problemName;
	private String sysEmpNo;

	// tab 1,2
	private String contentsKind;

	private String contents;

	// tab3
	private String planKind;

	private String planDate;

	private int dayQty;

	private String juDept;

	private String booDept;

	private String role;

	private String outSourcing;

	// tab4
	private String dataKind;

	private int staff;

	private int mm;

	private int totMm;

	private String remarks;

	// tab5
	private String itemName;

	private String techName;

	private String targetMatr;

	// tab6
	private String patentLocal;

	private String patentFore;

	private String paperLocal;

	private String paperFore;

	// tab7
	private String investKind;

	private int dhAmt;

	private int totAmt;

	private String marketKind;

	private String localAmt;

	private String foreAmt;

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

	public String getWriterEmp() {
		return writerEmp;
	}

	public void setWriterEmp(String writerEmp) {
		this.writerEmp = writerEmp;
	}

	public String getPpsEmp() {
		return ppsEmp;
	}

	public void setPpsEmp(String ppsEmp) {
		this.ppsEmp = ppsEmp;
	}

	public String getPpsDept() {
		return ppsDept;
	}

	public void setPpsDept(String ppsDept) {
		this.ppsDept = ppsDept;
	}

	public String getProblemName() {
		return problemName;
	}

	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}
	public String getSysEmpNo() {
		return sysEmpNo;
	}
	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getContentsKind() {
		return contentsKind;
	}

	public void setContentsKind(String contentsKind) {
		this.contentsKind = contentsKind;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public int getDayQty() {
		return dayQty;
	}

	public void setDayQty(int dayQty) {
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

	public int getStaff() {
		return staff;
	}

	public void setStaff(int staff) {
		this.staff = staff;
	}

	public int getMm() {
		return mm;
	}

	public void setMm(int mm) {
		this.mm = mm;
	}

	public int getTotMm() {
		return totMm;
	}

	public void setTotMm(int totMm) {
		this.totMm = totMm;
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

	public String getPatentLocal() {
		return patentLocal;
	}

	public void setPatentLocal(String patentLocal) {
		this.patentLocal = patentLocal;
	}

	public String getPatentFore() {
		return patentFore;
	}

	public void setPatentFore(String patentFore) {
		this.patentFore = patentFore;
	}

	public String getPaperLocal() {
		return paperLocal;
	}

	public void setPaperLocal(String paperLocal) {
		this.paperLocal = paperLocal;
	}

	public String getPaperFore() {
		return paperFore;
	}

	public void setPaperFore(String paperFore) {
		this.paperFore = paperFore;
	}

	public String getInvestKind() {
		return investKind;
	}

	public void setInvestKind(String investKind) {
		this.investKind = investKind;
	}

	public int getDhAmt() {
		return dhAmt;
	}

	public void setDhAmt(int dhAmt) {
		this.dhAmt = dhAmt;
	}

	public int getTotAmt() {
		return totAmt;
	}

	public void setTotAmt(int totAmt) {
		this.totAmt = totAmt;
	}

	public String getMarketKind() {
		return marketKind;
	}

	public void setMarketKind(String marketKind) {
		this.marketKind = marketKind;
	}

	public String getLocalAmt() {
		return localAmt;
	}

	public void setLocalAmt(String localAmt) {
		this.localAmt = localAmt;
	}

	public String getForeAmt() {
		return foreAmt;
	}

	public void setForeAmt(String foreAmt) {
		this.foreAmt = foreAmt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCudKey1() {
		return cudKey1;
	}

	public void setCudKey1(String cudKey1) {
		this.cudKey1 = cudKey1;
	}

	public String getCudKey2() {
		return cudKey2;
	}

	public void setCudKey2(String cudKey2) {
		this.cudKey2 = cudKey2;
	}

	public String getCudKey5() {
		return cudKey5;
	}

	public void setCudKey5(String cudKey5) {
		this.cudKey5 = cudKey5;
	}

	public String getCudKey6() {
		return cudKey6;
	}

	public void setCudKey6(String cudKey6) {
		this.cudKey6 = cudKey6;
	}

}