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
public class Test implements Serializable 
{
	private static final long serialVersionUID = 1L;
	

	private String useYn;
	private Date createDate;
	private String creator;
	private Date editDate;
	private String editor;
	private String cudKey;
	private String strCdate;
	private String strCuser;
	private String item_code;
	private String item_name;
	private String item_size;
	
	public Test() {
		super();
	}

	public Test(String item_code, String item_name, String item_size, String useYn, Date createDate, String creator, Date editDate, String editor, String cudKey,
			String strCdate, String strCuser) {
		super();
		this.item_code = item_code;
		this.item_name = item_name;
		this.item_size = item_size;
		this.useYn = useYn;
		this.createDate = createDate;
		this.creator = creator;
		this.editDate = editDate;
		this.editor = editor;
		this.cudKey = cudKey;
		this.strCdate = strCdate;
		this.strCuser = strCuser;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getitem_code() {
		return item_code;
	}
	public void setitem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getitem_name() {
		return item_name;
	}
	public void setitem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getitem_size() {
		return item_size;
	}
	public void setitem_size(String item_size) {
		this.item_size = item_size;
	}

	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
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

	@Override
	public String toString() {
		return "Sys [item_code=" + item_code + ", item_name=" + item_name + ", item_size=" + item_size + ", useYn=" + useYn + ", createDate=" + createDate + ", creator="
				+ creator + ", editDate=" + editDate + ", editor=" + editor + ", cudKey=" + cudKey + ", strCdate=" + strCdate + ", strCuser=" + strCuser + "]";
	}


}
