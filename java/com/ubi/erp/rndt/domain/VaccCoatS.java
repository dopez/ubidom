package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("VaccCoatS")
public class VaccCoatS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String rNum;
	private String equiCode;
	private String equiName;
	private String compId;
	private String matrCodeMj;
	private String matrCode;
	private String applyDate;
	private String temperature;
	private String vacuumRate;
	private String etching1;
	private String assist;
	private String thickness;
	private String rate;
	private String ecthing2;
	private String method;
	private String sysEmpNo;
	private String sysDate;
	private String updEmpNo;
	private String updDate;
	
	private String matrCodeMjName;
	private String cudKey;
	//pop var
	private String matrName;
	private String matrSpec;
	private String matrKind;
	public String getEquiCode() {
		return equiCode;
	}
	public void setEquiCode(String equiCode) {
		this.equiCode = equiCode;
	}
	public String getEquiName() {
		return equiName;
	}
	public void setEquiName(String equiName) {
		this.equiName = equiName;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getMatrCodeMj() {
		return matrCodeMj;
	}
	public void setMatrCodeMj(String matrCodeMj) {
		this.matrCodeMj = matrCodeMj;
	}
	public String getMatrCode() {
		return matrCode;
	}
	public void setMatrCode(String matrCode) {
		this.matrCode = matrCode;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getVacuumRate() {
		return vacuumRate;
	}
	public void setVacuumRate(String vacuumRate) {
		this.vacuumRate = vacuumRate;
	}
	public String getEtching1() {
		return etching1;
	}
	public void setEtching1(String etching1) {
		this.etching1 = etching1;
	}
	public String getAssist() {
		return assist;
	}
	public void setAssist(String assist) {
		this.assist = assist;
	}
	public String getThickness() {
		return thickness;
	}
	public void setThickness(String thickness) {
		this.thickness = thickness;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getEcthing2() {
		return ecthing2;
	}
	public void setEcthing2(String ecthing2) {
		this.ecthing2 = ecthing2;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
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
	public String getMatrKind() {
		return matrKind;
	}
	public void setMatrKind(String matrKind) {
		this.matrKind = matrKind;
	}
	public String getMatrCodeMjName() {
		return matrCodeMjName;
	}
	public void setMatrCodeMjName(String matrCodeMjName) {
		this.matrCodeMjName = matrCodeMjName;
	}
	public String getCudKey() {
		return cudKey;
	}
	public void setCudKey(String cudKey) {
		this.cudKey = cudKey;
	}
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
