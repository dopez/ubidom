package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("BomS")
public class BomS implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String compId;
	private String cudKey;
	
	private String itemCode;
	private String itemName;
	
	private String revNo;
	private String revDate;
	private String revEmpNo;
	private String revCause;
	private String apprEmp;
	private String apprDate;
	private String rmk;
	private String sysEmpNo;
	private String sysDate;
	private String updEmpNo;
	private String updDate;
	private double baseWet;
	private double adjWet;
	private String endDate;
	
	private String gjCode;
	private String gjDate;
	private String empNo;
	private String gjCause;
	private String appvEmpNo;
	private double rpWeight;
	private double adjQty;
	private String edDate;
	private String appvlDate;
	
	private String matrName;
	private String progNaem;
	private String prog;
	private String matrCode;
	private double wet;
	private double loss;
	private String sDate;
	private String eDate;
	/*search Form*/
	private String pCode;
	private String pName;
	private String pGubn;
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
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpGubn() {
		return pGubn;
	}
	public void setpGubn(String pGubn) {
		this.pGubn = pGubn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getRevNo() {
		return revNo;
	}
	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}
	public String getRevDate() {
		return revDate;
	}
	public String getMatrName() {
		return matrName;
	}
	public void setMatrName(String matrName) {
		this.matrName = matrName;
	}
	public String getProgNaem() {
		return progNaem;
	}
	public void setProgNaem(String progNaem) {
		this.progNaem = progNaem;
	}
	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public String getRevEmpNo() {
		return revEmpNo;
	}
	public void setRevEmpNo(String revEmpNo) {
		this.revEmpNo = revEmpNo;
	}
	public String getRevCause() {
		return revCause;
	}
	public void setRevCause(String revCause) {
		this.revCause = revCause;
	}
	public String getApprEmp() {
		return apprEmp;
	}
	public void setApprEmp(String apprEmp) {
		this.apprEmp = apprEmp;
	}
	public String getApprDate() {
		return apprDate;
	}
	public void setApprDate(String apprDate) {
		this.apprDate = apprDate;
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
	public double getBaseWet() {
		return baseWet;
	}
	public void setBaseWet(double baseWet) {
		this.baseWet = baseWet;
	}
	public double getAdjWet() {
		return adjWet;
	}
	public void setAdjWet(double adjWet) {
		this.adjWet = adjWet;
	}
	public String getGjCode() {
		return gjCode;
	}
	public void setGjCode(String gjCode) {
		this.gjCode = gjCode;
	}
	public String getGjDate() {
		return gjDate;
	}
	public void setGjDate(String gjDate) {
		this.gjDate = gjDate;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getGjCause() {
		return gjCause;
	}
	public void setGjCause(String gjCause) {
		this.gjCause = gjCause;
	}
	public String getAppvEmpNo() {
		return appvEmpNo;
	}
	public void setAppvEmpNo(String appvEmpNo) {
		this.appvEmpNo = appvEmpNo;
	}
	public double getRpWeight() {
		return rpWeight;
	}
	public void setRpWeight(double rpWeight) {
		this.rpWeight = rpWeight;
	}
	public double getAdjQty() {
		return adjQty;
	}
	public void setAdjQty(double adjQty) {
		this.adjQty = adjQty;
	}
	public String getEdDate() {
		return edDate;
	}
	public void setEdDate(String edDate) {
		this.edDate = edDate;
	}
	public String getProg() {
		return prog;
	}
	public void setProg(String prog) {
		this.prog = prog;
	}
	public String getMatrCode() {
		return matrCode;
	}
	public void setMatrCode(String matrCode) {
		this.matrCode = matrCode;
	}
	public double getWet() {
		return wet;
	}
	public void setWet(double wet) {
		this.wet = wet;
	}
	public double getLoss() {
		return loss;
	}
	public void setLoss(double loss) {
		this.loss = loss;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getAppvlDate() {
		return appvlDate;
	}
	public void setAppvlDate(String appvlDate) {
		this.appvlDate = appvlDate;
	}
}
