package com.ubi.erp.prod1.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("InspR")
public class InspR implements Serializable {
	private static final long serialVersionUID = 1L;
	// 공통항목
	private String compId;
	private String no;
	private String cudKey;
	private String equiCode;
	private String equiName;
	private String checkItem;
	private String checkItemName;
	private String cycleKind;
	private String cycleKindName;
	private int cycle;
	private String preFinalDate;
	private String chkPlanDate;
	private String checkDate;
	private String result;
	private String checkEmp;
	private String korName;
	private String rmk;
	// 검색조건
	private String pfDate;
	private String ptDate;
	private String resultGbn;

	public InspR() {
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

	public String getEquiName() {
		return equiName;
	}

	public void setEquiName(String equiName) {
		this.equiName = equiName;
	}

	public String getCycleKind() {
		return cycleKind;
	}

	public void setCycleKind(String cycleKind) {
		this.cycleKind = cycleKind;
	}

	public String getCycleKindName() {
		return cycleKindName;
	}

	public void setCycleKindName(String cycleKindName) {
		this.cycleKindName = cycleKindName;
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

	public String getRmk() {
		return rmk;
	}

	public void setRmk(String rmk) {
		this.rmk = rmk;
	}

	public String getCheckItemName() {
		return checkItemName;
	}

	public void setCheckItemName(String checkItemName) {
		this.checkItemName = checkItemName;
	}

	public String getChkPlanDate() {
		return chkPlanDate;
	}

	public void setChkPlanDate(String chkPlanDate) {
		this.chkPlanDate = chkPlanDate;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getCheckEmp() {
		return checkEmp;
	}

	public void setCheckEmp(String checkEmp) {
		this.checkEmp = checkEmp;
	}

	public String getPreFinalDate() {
		return preFinalDate;
	}

	public void setPreFinalDate(String preFinalDate) {
		this.preFinalDate = preFinalDate;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getPfDate() {
		return pfDate;
	}

	public void setPfDate(String pfDate) {
		this.pfDate = pfDate;
	}

	public String getPtDate() {
		return ptDate;
	}

	public void setPtDate(String ptDate) {
		this.ptDate = ptDate;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	public String getResultGbn() {
		return resultGbn;
	}

	public void setResultGbn(String resultGbn) {
		this.resultGbn = resultGbn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
