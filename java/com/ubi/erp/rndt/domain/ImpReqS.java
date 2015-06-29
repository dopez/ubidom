package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("ImpReqS")
public class ImpReqS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String rNum;

	private String setNo;

	private String sysEmpNo;

	private String cudKey;

	private String compId;

	private String setDate;

	private String setSeq;

	private String reqDno;

	private String custCode;

	private String custKorName;

	private String reqEmp;

	private String reqEmpName;

	private String itemCode;

	private String itemName;

	private String reqConts;

	private String state;

	private String endReqDate;

	private String assignsDate;

	private String assignsEmp;

	private String equiCode;

	private String inchEmp;

	private String deliDate;

	private String resultDate;

	private String resultEmp;

	private String reqBefore;

	private String reqAfter;

	private String remarks;

	private String stateName;

	private String inchEmpName;

	private String equiName;

	private String assignsEmpName;

	private String resultEmpName;

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
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

	public String getReqDno() {
		return reqDno;
	}

	public void setReqDno(String reqDno) {
		this.reqDno = reqDno;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}

	public String getReqEmp() {
		return reqEmp;
	}

	public void setReqEmp(String reqEmp) {
		this.reqEmp = reqEmp;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getReqConts() {
		return reqConts;
	}

	public void setReqConts(String reqConts) {
		this.reqConts = reqConts;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getEndReqDate() {
		return endReqDate;
	}

	public void setEndReqDate(String endReqDate) {
		this.endReqDate = endReqDate;
	}

	public String getAssignsDate() {
		return assignsDate;
	}

	public void setAssignsDate(String assignsDate) {
		this.assignsDate = assignsDate;
	}

	public String getAssignsEmp() {
		return assignsEmp;
	}

	public void setAssignsEmp(String assignsEmp) {
		this.assignsEmp = assignsEmp;
	}

	public String getEquiCode() {
		return equiCode;
	}

	public void setEquiCode(String equiCode) {
		this.equiCode = equiCode;
	}

	public String getInchEmp() {
		return inchEmp;
	}

	public void setInchEmp(String inchEmp) {
		this.inchEmp = inchEmp;
	}

	public String getDeliDate() {
		return deliDate;
	}

	public void setDeliDate(String deliDate) {
		this.deliDate = deliDate;
	}

	public String getResultDate() {
		return resultDate;
	}

	public void setResultDate(String resultDate) {
		this.resultDate = resultDate;
	}

	public String getResultEmp() {
		return resultEmp;
	}

	public void setResultEmp(String resultEmp) {
		this.resultEmp = resultEmp;
	}

	public String getReqBefore() {
		return reqBefore;
	}

	public void setReqBefore(String reqBefore) {
		this.reqBefore = reqBefore;
	}

	public String getReqAfter() {
		return reqAfter;
	}

	public void setReqAfter(String reqAfter) {
		this.reqAfter = reqAfter;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCustKorName() {
		return custKorName;
	}

	public void setCustKorName(String custKorName) {
		this.custKorName = custKorName;
	}

	public String getReqEmpName() {
		return reqEmpName;
	}

	public void setReqEmpName(String reqEmpName) {
		this.reqEmpName = reqEmpName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getSetNo() {
		return setNo;
	}

	public void setSetNo(String setNo) {
		this.setNo = setNo;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getInchEmpName() {
		return inchEmpName;
	}

	public void setInchEmpName(String inchEmpName) {
		this.inchEmpName = inchEmpName;
	}

	public String getEquiName() {
		return equiName;
	}

	public void setEquiName(String equiName) {
		this.equiName = equiName;
	}

	public String getAssignsEmpName() {
		return assignsEmpName;
	}

	public void setAssignsEmpName(String assignsEmpName) {
		this.assignsEmpName = assignsEmpName;
	}

	public String getResultEmpName() {
		return resultEmpName;
	}

	public void setResultEmpName(String resultEmpName) {
		this.resultEmpName = resultEmpName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}