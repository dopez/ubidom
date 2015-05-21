package com.ubi.erp.comm.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("CompS")
public class CompS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String no;
	private String cudKey;
	private String compId;
	private String compName;
	private String placeName;
	private String presidentName;
	private String compNo;
	private String corpNo;
	private String bizStatus;
	private String bizItem;
	private String zipCode;
	private String address;
	private String tel;
	private String fax;
	private String email;
	private String url;
	private String startDate;
	private String fiYear;
	private String fiFlag;
	private String inventoryAssetKind;
	private String taxofficeCode;
	private String eCompName;
	private String eAddress;
	private String eTel;
	private String eFax;
	private String eEmail;
	private String confirmNo;
	private String sysEmpNo;

	public CompS() {
		super();
	}

	public CompS(String no, String cudKey, String compId, String compName,
			String placeName, String presidentName, String compNo,
			String corpNo, String bizStatus, String bizItem, String zipCode,
			String address, String tel, String fax, String email, String url,
			String startDate, String fiYear, String fiFlag,
			String inventoryAssetKind, String taxofficeCode, String eCompName,
			String eAddress, String eTel, String eFax, String eEmail,
			String confirmNo, String sysEmpNo) {
		super();
		this.no = no;
		this.cudKey = cudKey;
		this.compId = compId;
		this.compName = compName;
		this.placeName = placeName;
		this.presidentName = presidentName;
		this.compNo = compNo;
		this.corpNo = corpNo;
		this.bizStatus = bizStatus;
		this.bizItem = bizItem;
		this.zipCode = zipCode;
		this.address = address;
		this.tel = tel;
		this.fax = fax;
		this.email = email;
		this.url = url;
		this.startDate = startDate;
		this.fiYear = fiYear;
		this.fiFlag = fiFlag;
		this.inventoryAssetKind = inventoryAssetKind;
		this.taxofficeCode = taxofficeCode;
		this.eCompName = eCompName;
		this.eAddress = eAddress;
		this.eTel = eTel;
		this.eFax = eFax;
		this.eEmail = eEmail;
		this.confirmNo = confirmNo;
		this.sysEmpNo = sysEmpNo;

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

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPresidentName() {
		return presidentName;
	}

	public void setPresidentName(String presidentName) {
		this.presidentName = presidentName;
	}

	public String getCompNo() {
		return compNo;
	}

	public void setCompNo(String compNo) {
		this.compNo = compNo;
	}

	public String getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(String corpNo) {
		this.corpNo = corpNo;
	}

	public String getBizStatus() {
		return bizStatus;
	}

	public void setBizStatus(String bizStatus) {
		this.bizStatus = bizStatus;
	}

	public String getBizItem() {
		return bizItem;
	}

	public void setBizItem(String bizItem) {
		this.bizItem = bizItem;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getFiYear() {
		return fiYear;
	}

	public void setFiYear(String fiYear) {
		this.fiYear = fiYear;
	}

	public String getFiFlag() {
		return fiFlag;
	}

	public void setFiFlag(String fiFlag) {
		this.fiFlag = fiFlag;
	}

	public String getInventoryAssetKind() {
		return inventoryAssetKind;
	}

	public void setInventoryAssetKind(String inventoryAssetKind) {
		this.inventoryAssetKind = inventoryAssetKind;
	}

	public String getTaxofficeCode() {
		return taxofficeCode;
	}

	public void setTaxofficeCode(String taxofficeCode) {
		this.taxofficeCode = taxofficeCode;
	}

	public String geteCompName() {
		return eCompName;
	}

	public void seteCompName(String eCompName) {
		this.eCompName = eCompName;
	}

	public String geteAddress() {
		return eAddress;
	}

	public void seteAddress(String eAddress) {
		this.eAddress = eAddress;
	}

	public String geteTel() {
		return eTel;
	}

	public void seteTel(String eTel) {
		this.eTel = eTel;
	}

	public String geteFax() {
		return eFax;
	}

	public void seteFax(String eFax) {
		this.eFax = eFax;
	}

	public String geteEmail() {
		return eEmail;
	}

	public void seteEmail(String eEmail) {
		this.eEmail = eEmail;
	}

	public String getConfirmNo() {
		return confirmNo;
	}

	public void setConfirmNo(String confirmNo) {
		this.confirmNo = confirmNo;
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
