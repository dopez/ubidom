package com.ubi.erp.user.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("SubTest")
public class SubTest implements Serializable {
	private static final long serialVersionUID = 1L;

	private String itemCode;
	private String itemName;
	private String itemSize;
	private String cudKey;

	public SubTest() {
		super();
	}

	public SubTest(String itemCode, String itemName, String itemSize,
			String cudKey) {
		super();
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.itemSize = itemSize;
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
