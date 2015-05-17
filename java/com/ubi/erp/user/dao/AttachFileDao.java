package com.ubi.erp.user.dao;

import java.util.List;

import com.ubi.erp.user.domain.AttachFile;


public interface AttachFileDao
{
	List<AttachFile> selAttachFileList(AttachFile attachFile);

	AttachFile getAttachFile(AttachFile attachFile);
	
	void insAttachFileMt(AttachFile attachFile);

	void insAttachFileDt(AttachFile attachFile);

	void delAttachFileMt(AttachFile attachFile);

	void delAttachFileDt(AttachFile attachFile);

}
