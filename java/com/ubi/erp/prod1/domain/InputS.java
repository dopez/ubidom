package com.ubi.erp.prod1.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("InputS")
public class InputS implements Serializable {
	private static final long serialVersionUID = 1L;

	private String cudKey;

	private String compId;

	private String setDate;

	private String setSeq;

	private String setNo;

	private String inputEmp;

	private String custCode;

	private String partCode;

	private double qty;

	private double cost;

	private double amt;

	private String orderKey;

	private String rmk;

	private String sysEmpNo;

	// SELECT2
	private String inputName;

	private String custKorName;

	private String partName;

	private String partSpec;

	private String partUnit;

	private double orderQty;

	private double miQty;

	// select1
	private double inputQty;

	private String deliReqDate;

	private String deliReqArea;

	private String no;

	private double oldQty;

	public InputS() {
		super();

	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
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

	public String getSetNo() {
		return setNo;
	}

	public void setSetNo(String setNo) {
		this.setNo = setNo;
	}

	public String getInputEmp() {
		return inputEmp;
	}

	public void setInputEmp(String inputEmp) {
		this.inputEmp = inputEmp;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}

	public String getPartCode() {
		return partCode;
	}

	public void setPartCode(String partCode) {
		this.partCode = partCode;
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

	public String getOrderKey() {
		return orderKey;
	}

	public void setOrderKey(String orderKey) {
		this.orderKey = orderKey;
	}

	public String getRmk() {
		return rmk;
	}

	public void setRmk(String rmk) {
		this.rmk = rmk;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getInputName() {
		return inputName;
	}

	public void setInputName(String inputName) {
		this.inputName = inputName;
	}

	public String getCustKorName() {
		return custKorName;
	}

	public void setCustKorName(String custKorName) {
		this.custKorName = custKorName;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getPartSpec() {
		return partSpec;
	}

	public void setPartSpec(String partSpec) {
		this.partSpec = partSpec;
	}

	public String getPartUnit() {
		return partUnit;
	}

	public void setPartUnit(String partUnit) {
		this.partUnit = partUnit;
	}

	public double getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(double orderQty) {
		this.orderQty = orderQty;
	}

	public double getMiQty() {
		return miQty;
	}

	public void setMiQty(double miQty) {
		this.miQty = miQty;
	}

	public double getInputQty() {
		return inputQty;
	}

	public void setInputQty(double inputQty) {
		this.inputQty = inputQty;
	}

	public String getDeliReqDate() {
		return deliReqDate;
	}

	public void setDeliReqDate(String deliReqDate) {
		this.deliReqDate = deliReqDate;
	}

	public String getDeliReqArea() {
		return deliReqArea;
	}

	public void setDeliReqArea(String deliReqArea) {
		this.deliReqArea = deliReqArea;
	}

	public double getOldQty() {
		return oldQty;
	}

	public void setOldQty(double oldQty) {
		this.oldQty = oldQty;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
