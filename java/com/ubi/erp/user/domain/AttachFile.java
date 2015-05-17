package com.ubi.erp.user.domain;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("AttachFile")
public class AttachFile implements Serializable {

	private static final long serialVersionUID = 1L;

	private String fileId; // 파일ID

	private int idx; // 파일IDX

	private String fileOrgNm; // 원본파일명

	private String fileSaveNm; // 저장파일명

	private String filePath; // 파일경로

	private String fileSize; // 파일크기

	private String fileExt; // 파일확장자

	private Date createDate; // 생성일

	private String creator; // 생성자

	private Date editDate; // 수정일

	private String editor; // 수정자

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getFileOrgNm() {
		return fileOrgNm;
	}

	public void setFileOrgNm(String fileOrgNm) {
		this.fileOrgNm = fileOrgNm;
	}

	public String getFileSaveNm() {
		return fileSaveNm;
	}

	public void setFileSaveNm(String fileSaveNm) {
		this.fileSaveNm = fileSaveNm;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
