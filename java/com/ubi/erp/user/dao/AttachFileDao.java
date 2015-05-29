package com.ubi.erp.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ubi.erp.user.domain.AttachFile;
import com.ubi.erp.user.domain.TempData;


public interface AttachFileDao
{
	List<AttachFile> selAttachFileList(AttachFile attachFile);

	AttachFile getAttachFile(AttachFile attachFile);
	
	void insAttachFileMt(AttachFile attachFile);

	void insAttachFileDt(AttachFile attachFile);

	void delAttachFileMt(AttachFile attachFile);

	void delAttachFileDt(AttachFile attachFile);

	TempData getNextTempData(@Param("fmtId") String fmtId);

	void insTempData(TempData tempData);
}