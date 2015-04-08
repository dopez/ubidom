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

@Alias("Sys")
public class Sys implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private String sysCd;
	private String sysNm;
	private Integer viewIdx;
	private String useYn;
	private Date createDate;
	private String creator;
	private Date editDate;
	private String editor;
	private String cudKey;
	private String strCdate;
	private String strCuser;

	public Sys() {
		super();
	}

	public Sys(String sysCd, String sysNm, Integer viewIdx, String useYn, Date createDate, String creator, Date editDate, String editor, String cudKey,
			String strCdate, String strCuser) {
		super();
		this.sysCd = sysCd;
		this.sysNm = sysNm;
		this.viewIdx = viewIdx;
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
	public String getSysCd() {
		return sysCd;
	}
	public void setSysCd(String sysCd) {
		this.sysCd = sysCd;
	}
	public String getSysNm() {
		return sysNm;
	}
	public void setSysNm(String sysNm) {
		this.sysNm = sysNm;
	}
	public Integer getViewIdx() {
		return viewIdx;
	}
	public void setViewIdx(Integer viewIdx) {
		this.viewIdx = viewIdx;
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
		return "Sys [sysCd=" + sysCd + ", sysNm=" + sysNm + ", viewIdx=" + viewIdx + ", useYn=" + useYn + ", createDate=" + createDate + ", creator="
				+ creator + ", editDate=" + editDate + ", editor=" + editor + ", cudKey=" + cudKey + ", strCdate=" + strCdate + ", strCuser=" + strCuser + "]";
	}

}
