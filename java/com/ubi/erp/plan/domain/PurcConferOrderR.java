package com.ubi.erp.plan.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("PurcConferOrderR")
public class PurcConferOrderR implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String compId;
	private String setDate;
	private String setSeq;
	private String setNo;
	private String empNo;
	private String custCode;
	private String custName;
	private String purcConsultMstKey;
	private String purcConsultKey;
	private String itemCode;
	private String itemName;
	private double qty;
	private double cost;
	private double amt;
	private String deliDate;
	private String deliPlace;
	private String rmk;
	private String purcExceptReason;
	private String purcYn;
	private String settle1State;
	private String settle1Emp;
	private String settle1Date;
	private String settle2State;
	private String settle2Emp;
	private String settle2Date;
	private String settle3State;
	private String settle3Emp;
	private String settle3Date;	
	private String settle4State;
	private String settle4Emp;
	private String settle4Date;		
	private String temp1;
	private String temp2;
	private String temp3;
	private String temp4;
	private String sysEmpNo;
	private String sysDate;
	private String updEmpNo;
	private String updDate;	
	private String seq;
	private String matrName;
	private String matrSpec;
	private String matrUnit;
	private String setSDate;
	private String setEDate;
	private String empName;
	private String postCode;
	private String mstEmpNo;
	private String mstEmpName;
	
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getMstEmpNo() {
		return mstEmpNo;
	}
	public void setMstEmpNo(String mstEmpNo) {
		this.mstEmpNo = mstEmpNo;
	}
	public String getMstEmpName() {
		return mstEmpName;
	}
	public void setMstEmpName(String mstEmpName) {
		this.mstEmpName = mstEmpName;
	}
	public String getSetSDate() {
		return setSDate;
	}
	public void setSetSDate(String setSDate) {
		this.setSDate = setSDate;
	}
	public String getSetEDate() {
		return setEDate;
	}
	public void setSetEDate(String setEDate) {
		this.setEDate = setEDate;
	}
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
	public String getSetNo() {
		return setNo;
	}
	public void setSetNo(String setNo) {
		this.setNo = setNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getCustCode() {
		return custCode;
	}
	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}
	public String getPurcConsultMstKey() {
		return purcConsultMstKey;
	}
	public void setPurcConsultMstKey(String purcConsultMstKey) {
		this.purcConsultMstKey = purcConsultMstKey;
	}
	public String getPurcConsultKey() {
		return purcConsultKey;
	}
	public void setPurcConsultKey(String purcConsultKey) {
		this.purcConsultKey = purcConsultKey;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public double getQty() {
		return qty;
	}
	public void setQty(double qty) {
		this.qty = qty;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public double getAmt() {
		return amt;
	}
	public void setAmt(double amt) {
		this.amt = amt;
	}
	public String getDeliDate() {
		return deliDate;
	}
	public void setDeliDate(String deliDate) {
		this.deliDate = deliDate;
	}
	public String getDeliPlace() {
		return deliPlace;
	}
	public void setDeliPlace(String deliPlace) {
		this.deliPlace = deliPlace;
	}
	public String getRmk() {
		return rmk;
	}
	public void setRmk(String rmk) {
		this.rmk = rmk;
	}
	public String getPurcExceptReason() {
		return purcExceptReason;
	}
	public void setPurcExceptReason(String purcExceptReason) {
		this.purcExceptReason = purcExceptReason;
	}
	public String getPurcYn() {
		return purcYn;
	}
	public void setPurcYn(String purcYn) {
		this.purcYn = purcYn;
	}
	public String getSettle1State() {
		return settle1State;
	}
	public void setSettle1State(String settle1State) {
		this.settle1State = settle1State;
	}
	public String getSettle1Emp() {
		return settle1Emp;
	}
	public void setSettle1Emp(String settle1Emp) {
		this.settle1Emp = settle1Emp;
	}
	public String getSettle1Date() {
		return settle1Date;
	}
	public void setSettle1Date(String settle1Date) {
		this.settle1Date = settle1Date;
	}
	public String getSettle2State() {
		return settle2State;
	}
	public void setSettle2State(String settle2State) {
		this.settle2State = settle2State;
	}
	public String getSettle2Emp() {
		return settle2Emp;
	}
	public void setSettle2Emp(String settle2Emp) {
		this.settle2Emp = settle2Emp;
	}
	public String getSettle2Date() {
		return settle2Date;
	}
	public void setSettle2Date(String settle2Date) {
		this.settle2Date = settle2Date;
	}
	public String getSettle3State() {
		return settle3State;
	}
	public void setSettle3State(String settle3State) {
		this.settle3State = settle3State;
	}
	public String getSettle3Emp() {
		return settle3Emp;
	}
	public void setSettle3Emp(String settle3Emp) {
		this.settle3Emp = settle3Emp;
	}
	public String getSettle3Date() {
		return settle3Date;
	}
	public void setSettle3Date(String settle3Date) {
		this.settle3Date = settle3Date;
	}
	public String getSettle4State() {
		return settle4State;
	}
	public void setSettle4State(String settle4State) {
		this.settle4State = settle4State;
	}
	public String getSettle4Emp() {
		return settle4Emp;
	}
	public void setSettle4Emp(String settle4Emp) {
		this.settle4Emp = settle4Emp;
	}
	public String getSettle4Date() {
		return settle4Date;
	}
	public void setSettle4Date(String settle4Date) {
		this.settle4Date = settle4Date;
	}
	public String getTemp1() {
		return temp1;
	}
	public void setTemp1(String temp1) {
		this.temp1 = temp1;
	}
	public String getTemp2() {
		return temp2;
	}
	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}
	public String getTemp3() {
		return temp3;
	}
	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}
	public String getTemp4() {
		return temp4;
	}
	public void setTemp4(String temp4) {
		this.temp4 = temp4;
	}
	public String getSysEmpNo() {
		return sysEmpNo;
	}
	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}
	public String getSysDate() {
		return sysDate;
	}
	public void setSysDate(String sysDate) {
		this.sysDate = sysDate;
	}
	public String getUpdEmpNo() {
		return updEmpNo;
	}
	public void setUpdEmpNo(String updEmpNo) {
		this.updEmpNo = updEmpNo;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMatrName() {
		return matrName;
	}
	public void setMatrName(String matrName) {
		this.matrName = matrName;
	}
	public String getMatrSpec() {
		return matrSpec;
	}
	public void setMatrSpec(String matrSpec) {
		this.matrSpec = matrSpec;
	}
	public String getMatrUnit() {
		return matrUnit;
	}
	public void setMatrUnit(String matrUnit) {
		this.matrUnit = matrUnit;
	}	
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
}
