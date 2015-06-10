package com.ubi.erp.prod1.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("HistoryS")
public class HistoryS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String compId;
	private String cudKey;
	private String equiCode;
	private String equiName;
	private String useProcess;
	private String standard;
	private String capacity;
	private double buyMoney;
	private String empNo;
	private String buyDate;
	private String supplyComp;
	private String regiDate;
	private String makeComp;
	private String useYn;
	private String useStopRemarks;
	private String imgPath;
	private String sysEmpNo;
	private String korName;

	public HistoryS() {
		super();
	}

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

	public String getUseProcess() {
		return useProcess;
	}

	public void setUseProcess(String useProcess) {
		this.useProcess = useProcess;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public double getBuyMoney() {
		return buyMoney;
	}

	public void setBuyMoney(double buyMoney) {
		this.buyMoney = buyMoney;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public String getSupplyComp() {
		return supplyComp;
	}

	public void setSupplyComp(String supplyComp) {
		this.supplyComp = supplyComp;
	}

	public String getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}

	public String getMakeComp() {
		return makeComp;
	}

	public void setMakeComp(String makeComp) {
		this.makeComp = makeComp;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getUseStopRemarks() {
		return useStopRemarks;
	}

	public void setUseStopRemarks(String useStopRemarks) {
		this.useStopRemarks = useStopRemarks;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
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
