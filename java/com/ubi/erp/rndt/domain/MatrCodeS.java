package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("MatrCodeS")
public class MatrCodeS implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String cudKey;
	
	private String compId;
	
	private String matrCode;
	
	private String matrName;
	
	private String matrGubn;
	
	private String matrSpec;
	
	private String matrUnit;
	
	private int packUnit;
	
	private int morderUnit;
	
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
	
	private int inputUnit;
	
	private int outUnit1;
	
	private int outUnit2;
	
	private String makeCust;
	
	private String matrClass;
	
	private String packingGroup;
	
	private String unNo;
	
	private String inputArea;
	
	private String disKind;
	
	private String inputCust1;
	
	private String inputCust2;
	
	private String inputCustKind1;
	
	private String inputCustKind2;
	
	private String minOrderQty;
	
	private String origin;
	
	private String chemicalKind;
	
	private String sysEmpNo;

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

	public String getMatrCode() {
		return matrCode;
	}

	public void setMatrCode(String matrCode) {
		this.matrCode = matrCode;
	}

	public String getMatrName() {
		return matrName;
	}

	public void setMatrName(String matrName) {
		this.matrName = matrName;
	}

	public String getMatrGubn() {
		return matrGubn;
	}

	public void setMatrGubn(String matrGubn) {
		this.matrGubn = matrGubn;
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

	public int getPackUnit() {
		return packUnit;
	}

	public void setPackUnit(int packUnit) {
		this.packUnit = packUnit;
	}

	public int getMorderUnit() {
		return morderUnit;
	}

	public void setMorderUnit(int morderUnit) {
		this.morderUnit = morderUnit;
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

	public int getInputUnit() {
		return inputUnit;
	}

	public void setInputUnit(int inputUnit) {
		this.inputUnit = inputUnit;
	}

	public int getOutUnit1() {
		return outUnit1;
	}

	public void setOutUnit1(int outUnit1) {
		this.outUnit1 = outUnit1;
	}

	public int getOutUnit2() {
		return outUnit2;
	}

	public void setOutUnit2(int outUnit2) {
		this.outUnit2 = outUnit2;
	}

	public String getMakeCust() {
		return makeCust;
	}

	public void setMakeCust(String makeCust) {
		this.makeCust = makeCust;
	}

	public String getMatrClass() {
		return matrClass;
	}

	public void setMatrClass(String matrClass) {
		this.matrClass = matrClass;
	}

	public String getPackingGroup() {
		return packingGroup;
	}

	public void setPackingGroup(String packingGroup) {
		this.packingGroup = packingGroup;
	}

	public String getUnNo() {
		return unNo;
	}

	public void setUnNo(String unNo) {
		this.unNo = unNo;
	}

	public String getInputArea() {
		return inputArea;
	}

	public void setInputArea(String inputArea) {
		this.inputArea = inputArea;
	}

	public String getDisKind() {
		return disKind;
	}

	public void setDisKind(String disKind) {
		this.disKind = disKind;
	}

	public String getInputCust1() {
		return inputCust1;
	}

	public void setInputCust1(String inputCust1) {
		this.inputCust1 = inputCust1;
	}

	public String getInputCust2() {
		return inputCust2;
	}

	public void setInputCust2(String inputCust2) {
		this.inputCust2 = inputCust2;
	}

	public String getInputCustKind1() {
		return inputCustKind1;
	}

	public void setInputCustKind1(String inputCustKind1) {
		this.inputCustKind1 = inputCustKind1;
	}

	public String getInputCustKind2() {
		return inputCustKind2;
	}

	public void setInputCustKind2(String inputCustKind2) {
		this.inputCustKind2 = inputCustKind2;
	}

	public String getMinOrderQty() {
		return minOrderQty;
	}

	public void setMinOrderQty(String minOrderQty) {
		this.minOrderQty = minOrderQty;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getChemicalKind() {
		return chemicalKind;
	}

	public void setChemicalKind(String chemicalKind) {
		this.chemicalKind = chemicalKind;
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

	public MatrCodeS() {
		super();
	}

	public MatrCodeS(String cudKey, String compId, String matrCode, String matrName,
			String matrGubn, String matrSpec, String matrUnit, int packUnit,
			int morderUnit, String validTime, int leadTime, int safetyQty,
			String safetyKind, int baseWet, int totWet, String inspYn,
			int keepTemp1, int keepTemp2, String enterDate, String hsCode,
			String useEndDate, String useYn, String acctKind, int inputUnit,
			int outUnit1, int outUnit2, String makeCust, String matrClass,
			String packingGroup, String unNo, String inputArea, String disKind,
			String inputCust1, String inputCust2, String inputCustKind1,
			String inputCustKind2, String minOrderQty, String origin,
			String chemicalKind, String sysEmpNo) {
		super();
		this.cudKey = cudKey;
		this.compId = compId;
		this.matrCode = matrCode;
		this.matrName = matrName;
		this.matrGubn = matrGubn;
		this.matrSpec = matrSpec;
		this.matrUnit = matrUnit;
		this.packUnit = packUnit;
		this.morderUnit = morderUnit;
		this.validTime = validTime;
		this.leadTime = leadTime;
		this.safetyQty = safetyQty;
		this.safetyKind = safetyKind;
		this.baseWet = baseWet;
		this.totWet = totWet;
		this.inspYn = inspYn;
		this.keepTemp1 = keepTemp1;
		this.keepTemp2 = keepTemp2;
		this.enterDate = enterDate;
		this.hsCode = hsCode;
		this.useEndDate = useEndDate;
		this.useYn = useYn;
		this.acctKind = acctKind;
		this.inputUnit = inputUnit;
		this.outUnit1 = outUnit1;
		this.outUnit2 = outUnit2;
		this.makeCust = makeCust;
		this.matrClass = matrClass;
		this.packingGroup = packingGroup;
		this.unNo = unNo;
		this.inputArea = inputArea;
		this.disKind = disKind;
		this.inputCust1 = inputCust1;
		this.inputCust2 = inputCust2;
		this.inputCustKind1 = inputCustKind1;
		this.inputCustKind2 = inputCustKind2;
		this.minOrderQty = minOrderQty;
		this.origin = origin;
		this.chemicalKind = chemicalKind;
		this.sysEmpNo = sysEmpNo;
	}
	
}
