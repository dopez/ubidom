package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("DevRsltS")
public class DevRsltS implements Serializable {
	private static final long serialVersionUID = 1L;

	private String cudKey;
	private String compId;
	private String setDate;
	private String setSeq;

	/* master */

	private String empNo;

	private String planNumb;
	private String problemName;

	private String dueDate;
	private String sysEmpNo;

	private String midevalKind;

	private String evaluateNumb;

	/* tab 1,2,3,7 */
	private String contentsKind;
	private String contents;

	/* tab 4 */
	private String itemName;
	private String techName;
	private String targetMatr;

	private String cItemName;

	private String cTechName;

	private String cTargetMatr;

	private String remarks;

	/* tab 5 */
	private String patentLocal;
	private String patentFore;
	private String paperLocal;
	private String paperFore;

	private String cPatentLocal;

	private String cPatentFore;

	private String cPaperLocal;

	private String cPaperFore;

	private String targetItem;

	private String devKind;

	/* tab 6 */
	private String investKind;

	private String dhAmt;

	private String totAmt;

	private String cDhAmt;

	private String cTotAmt;

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

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getPlanNumb() {
		return planNumb;
	}

	public void setPlanNumb(String planNumb) {
		this.planNumb = planNumb;
	}
	public String getProblemName() {
		return problemName;
	}
	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getSysEmpNo() {
		return sysEmpNo;
	}
	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getMidevalKind() {
		return midevalKind;
	}

	public void setMidevalKind(String midevalKind) {
		this.midevalKind = midevalKind;
	}

	public String getEvaluateNumb() {
		return evaluateNumb;
	}

	public void setEvaluateNumb(String evaluateNumb) {
		this.evaluateNumb = evaluateNumb;
	}
	public String getContentsKind() {
		return contentsKind;
	}
	public void setContentsKind(String contentsKind) {
		this.contentsKind = contentsKind;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getTechName() {
		return techName;
	}

	public void setTechName(String techName) {
		this.techName = techName;
	}

	public String getTargetMatr() {
		return targetMatr;
	}

	public void setTargetMatr(String targetMatr) {
		this.targetMatr = targetMatr;
	}

	public String getcItemName() {
		return cItemName;
	}

	public void setcItemName(String cItemName) {
		this.cItemName = cItemName;
	}

	public String getcTechName() {
		return cTechName;
	}

	public void setcTechName(String cTechName) {
		this.cTechName = cTechName;
	}

	public String getcTargetMatr() {
		return cTargetMatr;
	}

	public void setcTargetMatr(String cTargetMatr) {
		this.cTargetMatr = cTargetMatr;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getPatentLocal() {
		return patentLocal;
	}
	public void setPatentLocal(String patentLocal) {
		this.patentLocal = patentLocal;
	}
	public String getPatentFore() {
		return patentFore;
	}
	public void setPatentFore(String patentFore) {
		this.patentFore = patentFore;
	}
	public String getPaperLocal() {
		return paperLocal;
	}
	public void setPaperLocal(String paperLocal) {
		this.paperLocal = paperLocal;
	}
	public String getPaperFore() {
		return paperFore;
	}
	public void setPaperFore(String paperFore) {
		this.paperFore = paperFore;
	}

	public String getcPatentLocal() {
		return cPatentLocal;
	}

	public void setcPatentLocal(String cPatentLocal) {
		this.cPatentLocal = cPatentLocal;
	}

	public String getcPatentFore() {
		return cPatentFore;
	}

	public void setcPatentFore(String cPatentFore) {
		this.cPatentFore = cPatentFore;
	}

	public String getcPaperLocal() {
		return cPaperLocal;
	}

	public void setcPaperLocal(String cPaperLocal) {
		this.cPaperLocal = cPaperLocal;
	}

	public String getcPaperFore() {
		return cPaperFore;
	}

	public void setcPaperFore(String cPaperFore) {
		this.cPaperFore = cPaperFore;
	}

	public String getTargetItem() {
		return targetItem;
	}

	public void setTargetItem(String targetItem) {
		this.targetItem = targetItem;
	}

	public String getDevKind() {
		return devKind;
	}

	public void setDevKind(String devKind) {
		this.devKind = devKind;
	}

	public String getInvestKind() {
		return investKind;
	}

	public void setInvestKind(String investKind) {
		this.investKind = investKind;
	}

	public String getDhAmt() {
		return dhAmt;
	}

	public void setDhAmt(String dhAmt) {
		this.dhAmt = dhAmt;
	}

	public String getTotAmt() {
		return totAmt;
	}

	public void setTotAmt(String totAmt) {
		this.totAmt = totAmt;
	}

	public String getcDhAmt() {
		return cDhAmt;
	}

	public void setcDhAmt(String cDhAmt) {
		this.cDhAmt = cDhAmt;
	}

	public String getcTotAmt() {
		return cTotAmt;
	}

	public void setcTotAmt(String cTotAmt) {
		this.cTotAmt = cTotAmt;
	}

	public String getCudKey() {
		return cudKey;
	}

	public void setCudKey(String cudKey) {
		this.cudKey = cudKey;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}