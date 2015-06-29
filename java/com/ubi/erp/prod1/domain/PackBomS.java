package com.ubi.erp.prod1.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("PackBomS")
public class PackBomS implements Serializable {
	private static final long serialVersionUID = 1L;

	private String cudKey;

	private String compId;

	private String keyValue;

	private String keyvalue1;

	private String keyvalue2;

	private int ea;

	private int loss;

	private int raw_len;

	private String sDate;

	private String eDate;

	private String pKey;

	private String eKey;

	private String rmk;

	private String useDate;

	private String useYn;

	private String itemCode;

	private String itemName;

	private String itemSpec;

	private String itemUnit;

	private String sysEmpNo;

	private String progCode;

	private String prodKind;

	private int progSeq;

	private String path;

	private String lv;

	private int sortKey;

	private String no;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
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

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getProgCode() {
		return progCode;
	}

	public void setProgCode(String progCode) {
		this.progCode = progCode;
	}

	public String getProdKind() {
		return prodKind;
	}

	public void setProdKind(String prodKind) {
		this.prodKind = prodKind;
	}

	public int getProgSeq() {
		return progSeq;
	}

	public void setProgSeq(int progSeq) {
		this.progSeq = progSeq;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
	}

	public int getSortKey() {
		return sortKey;
	}

	public void setSortKey(int sortKey) {
		this.sortKey = sortKey;
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

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

	public String getKeyvalue1() {
		return keyvalue1;
	}

	public void setKeyvalue1(String keyvalue1) {
		this.keyvalue1 = keyvalue1;
	}

	public String getKeyvalue2() {
		return keyvalue2;
	}

	public void setKeyvalue2(String keyvalue2) {
		this.keyvalue2 = keyvalue2;
	}

	public int getEa() {
		return ea;
	}

	public void setEa(int ea) {
		this.ea = ea;
	}

	public int getLoss() {
		return loss;
	}

	public void setLoss(int loss) {
		this.loss = loss;
	}

	public int getRaw_len() {
		return raw_len;
	}

	public void setRaw_len(int raw_len) {
		this.raw_len = raw_len;
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

	public String getpKey() {
		return pKey;
	}

	public void setpKey(String pKey) {
		this.pKey = pKey;
	}

	public String geteKey() {
		return eKey;
	}

	public void seteKey(String eKey) {
		this.eKey = eKey;
	}

	public String getRmk() {
		return rmk;
	}

	public void setRmk(String rmk) {
		this.rmk = rmk;
	}

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
