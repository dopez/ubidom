package com.ubi.erp.mang.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("CostS")
public class CostS implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String itemCode;
	private String itemName;
	private String itemSpec;

	private String compId;
	private String ioChk;
	private String custCode;
	private String custName;
	private String pstDate;
	private String pendDate;
	private String prc;
	private String mnyEa;
	private String bigo;

	private String crud;
	private String sysEmpNo;

	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemSpec() {
		return itemSpec;
	}
	public void setItemSpec(String itemSpec) {
		this.itemSpec = itemSpec;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getIoChk() {
		return ioChk;
	}
	public void setIoChk(String ioChk) {
		this.ioChk = ioChk;
	}
	public String getCustCode() {
		return custCode;
	}
	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getPstDate() {
		return pstDate;
	}
	public void setPstDate(String pstDate) {
		this.pstDate = pstDate;
	}
	public String getPendDate() {
		return pendDate;
	}
	public void setPendDate(String pendDate) {
		this.pendDate = pendDate;
	}
	public String getPrc() {
		return prc;
	}
	public void setPrc(String prc) {
		this.prc = prc;
	}
	public String getMnyEa() {
		return mnyEa;
	}
	public void setMnyEa(String mnyEa) {
		this.mnyEa = mnyEa;
	}
	public String getBigo() {
		return bigo;
	}
	public void setBigo(String bigo) {
		this.bigo = bigo;
	}
	public String getCrud() {
		return crud;
	}
	public void setCrud(String crud) {
		this.crud = crud;
	}
	public String getSysEmpNo() {
		return sysEmpNo;
	}
	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
