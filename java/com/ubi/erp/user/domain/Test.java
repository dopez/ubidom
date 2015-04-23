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

import org.apache.ibatis.type.Alias;

@Alias("Test")
public class Test implements Serializable {
	private static final long serialVersionUID = 1L;

	private String itemCode;
	private String itemName;
	private String itemSize;
	private String cudKey;

	public Test() {
		super();
	}


	public Test(String itemCode, String itemName, String itemSize, String cudKey) {
		super();
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.itemSize = itemSize;
		this.cudKey = cudKey;
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

	public String getItemSize() {
		return itemSize;
	}

	public void setItemSize(String itemSize) {
		this.itemSize = itemSize;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}