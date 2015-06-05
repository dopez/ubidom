package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("GoodsCodeS")
public class GoodsCodeS implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String compId;
	private String cudKey;
	
	private String itemCode;
	private String itemName;
	private String itemGubn;
	private String itemKind1;
	private String itemKind2;
	private String itemKind3;
	private String itemNumb;
	private String itemSpec;
	private String itemUnit;
	private int packUnit;
	private String disKind;
	private String validTime;
	private int leadTime;
	private int safetyQty;
	private String safetyKind;
	private int baseWet;
	private int totWet;
	private String inspYn;
	private int keepTemp1;
	private int keepTemp2;
	private String enterDate;
	private String hsCode;
	private String useEndDate;
	private String useYn;
	private String acctKind;
	private String sysEmpNo;
	
	/*search Form*/
	private String pCode;
	private String pName;
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
	public String getItemGubn() {
		return itemGubn;
	}
	public void setItemGubn(String itemGubn) {
		this.itemGubn = itemGubn;
	}
	public String getItemKind1() {
		return itemKind1;
	}
	public void setItemKind1(String itemKind1) {
		this.itemKind1 = itemKind1;
	}
	public String getItemKind2() {
		return itemKind2;
	}
	public void setItemKind2(String itemKind2) {
		this.itemKind2 = itemKind2;
	}
	public String getItemKind3() {
		return itemKind3;
	}
	public void setItemKind3(String itemKind3) {
		this.itemKind3 = itemKind3;
	}
	public String getItemNumb() {
		return itemNumb;
	}
	public void setItemNumb(String itemNumb) {
		this.itemNumb = itemNumb;
	}
	public String getItemSpec() {
		return itemSpec;
	}
	public void setItemSpec(String itemSpec) {
		this.itemSpec = itemSpec;
	}
	public String getItemUnit() {
		return itemUnit;
	}
	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
	}
	public int getPackUnit() {
		return packUnit;
	}
	public void setPackUnit(int packUnit) {
		this.packUnit = packUnit;
	}
	public String getDisKind() {
		return disKind;
	}
	public void setDisKind(String disKind) {
		this.disKind = disKind;
	}
	public String getValidTime() {
		return validTime;
	}
	public void setValidTime(String validTime) {
		this.validTime = validTime;
	}
	public int getLeadTime() {
		return leadTime;
	}
	public void setLeadTime(int leadTime) {
		this.leadTime = leadTime;
	}
	public int getSafetyQty() {
		return safetyQty;
	}
	public void setSafetyQty(int safetyQty) {
		this.safetyQty = safetyQty;
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
	public String getSafetyKind() {
		return safetyKind;
	}
	public void setSafetyKind(String safetyKind) {
		this.safetyKind = safetyKind;
	}
	public int getBaseWet() {
		return baseWet;
	}
	public void setBaseWet(int baseWet) {
		this.baseWet = baseWet;
	}
	public int getTotWet() {
		return totWet;
	}
	public void setTotWet(int totWet) {
		this.totWet = totWet;
	}
	public String getInspYn() {
		return inspYn;
	}
	public void setInspYn(String inspYn) {
		this.inspYn = inspYn;
	}
	public int getKeepTemp1() {
		return keepTemp1;
	}
	public void setKeepTemp1(int keepTemp1) {
		this.keepTemp1 = keepTemp1;
	}
	public int getKeepTemp2() {
		return keepTemp2;
	}
	public void setKeepTemp2(int keepTemp2) {
		this.keepTemp2 = keepTemp2;
	}
	public String getEnterDate() {
		return enterDate;
	}
	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}
	public String getHsCode() {
		return hsCode;
	}
	public void setHsCode(String hsCode) {
		this.hsCode = hsCode;
	}
	public String getUseEndDate() {
		return useEndDate;
	}
	public void setUseEndDate(String useEndDate) {
		this.useEndDate = useEndDate;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getAcctKind() {
		return acctKind;
	}
	public void setAcctKind(String acctKind) {
		this.acctKind = acctKind;
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
