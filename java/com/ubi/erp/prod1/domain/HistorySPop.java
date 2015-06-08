package com.ubi.erp.prod1.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("HistorySPop")
public class HistorySPop implements Serializable {
	private static final long serialVersionUID = 1L;
	// 공통항목
	private String compId;
	private String no;
	private String cudKey;
	private String equiCode;
	private String sysEmpNo;
	private String cycleKind;
	private int cycle;
	// 점검항목
	private String checkItem;
	private String finalDate;
	private String rmk;
	// 소모성 이력 부품등록
	private String partCode;
	private String partName;
	private String partSpec;
	private String partUnit;
	private int safeStock;
	private String insurance;

	public HistorySPop() {
		super();
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
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

	public String getEquiCode() {
		return equiCode;
	}

	public void setEquiCode(String equiCode) {
		this.equiCode = equiCode;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getCycleKind() {
		return cycleKind;
	}

	public void setCycleKind(String cycleKind) {
		this.cycleKind = cycleKind;
	}

	public int getCycle() {
		return cycle;
	}

	public void setCycle(int cycle) {
		this.cycle = cycle;
	}

	public String getCheckItem() {
		return checkItem;
	}

	public void setCheckItem(String checkItem) {
		this.checkItem = checkItem;
	}

	public String getFinalDate() {
		return finalDate;
	}

	public void setFinalDate(String finalDate) {
		this.finalDate = finalDate;
	}

	public String getRmk() {
		return rmk;
	}

	public void setRmk(String rmk) {
		this.rmk = rmk;
	}

	public String getPartCode() {
		return partCode;
	}

	public void setPartCode(String partCode) {
		this.partCode = partCode;
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

	public int getSafeStock() {
		return safeStock;
	}

	public void setSafeStock(int safeStock) {
		this.safeStock = safeStock;
	}

	public String getInsurance() {
		return insurance;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
