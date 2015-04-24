/**
 * Copyright (c) 2014 BI Matrix Co., Ltd.
 * All right reserved.
 *
 * This software is the confidential and proprietary information of BI Matrix Co., Ltd.
 * You shall not disclose such Confidential Information and
 * shall use it only in accordance with the terms of the license agreement
 * you entered into with BI Matrix Co., Ltd.
 *
 * 작성자 : PCW
 * 작성일 : 2014-07-04
 * 설  명 :
 *
 * 수정내용
 * 수정일자		수정자		수정내용
 * ------------------------      -------------------------            ---------------------------
 
 */

package com.ubi.erp.user.domain;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Test")
public class Test implements Serializable {
	private static final long serialVersionUID = 1L;



	private String itemCode;
	private String itemName;
	private String itemSize;
	private Date createDate;
	private String creator;
	private Date editDate;
	private String editor;
	private String cudKey;
	private String strCdate;
	private String strCuser;
	private String pCode;
	private String pName;
	private String pSize;

	
	public Test() {
		super();
	}

	public Test(String itemCode, String itemName, String itemSize, Date editDate, Date createDate, String creator, String editor, String cudKey, String strCuser, String strCdate, String pSize, String pCode, String pName) {
		super();
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.itemSize = itemSize;
		this.createDate = createDate;
		this.creator = creator;
		this.editDate = editDate;
		this.editor = editor;
		this.cudKey = cudKey;
		this.strCdate = strCdate;
		this.strCuser = strCuser;
		this.pCode = pCode;
		this.pSize = pSize;
		this.pName = pName;
	}

	@Override
	public String toString() {
		return "Test [itemCode=" + itemCode + ", itemName=" + itemName
				+ ", itemSize=" + itemSize + ", createDate=" + createDate
				+ ", creator=" + creator + ", editDate=" + editDate
				+ ", editor=" + editor + ", cudKey=" + cudKey + ", strCdate="
				+ strCdate + ", strCuser=" + strCuser + ", pCode=" + pCode
				+ ", pName=" + pName + ", pSize=" + pSize + "]";
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

	public String getItemSize() {
		return itemSize;
	}

	public void setItemSize(String itemSize) {
		this.itemSize = itemSize;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Date getEditDate() {
		return editDate;
	}

	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getCudKey() {
		return cudKey;
	}

	public void setCudKey(String cudKey) {
		this.cudKey = cudKey;
	}

	public String getStrCdate() {
		return strCdate;
	}

	public void setStrCdate(String strCdate) {
		this.strCdate = strCdate;
	}

	public String getStrCuser() {
		return strCuser;
	}

	public void setStrCuser(String strCuser) {
		this.strCuser = strCuser;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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

	public String getpSize() {
		return pSize;
	}

	public void setpSize(String pSize) {
		this.pSize = pSize;
	}


}