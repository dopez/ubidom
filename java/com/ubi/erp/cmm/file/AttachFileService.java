package com.ubi.erp.cmm.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ubi.erp.cmm.exception.UbiBizException;
import com.ubi.erp.cmm.util.PropertyUtil;
import com.ubi.erp.user.dao.AttachFileDao;
import com.ubi.erp.user.domain.AttachFile;


@Service
public class AttachFileService
{
	private static final Logger LOGGER = LoggerFactory.getLogger(AttachFileService.class);

	private AttachFileDao attachFileDao;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		attachFileDao = sqlSession.getMapper(AttachFileDao.class);
	}

	public List<AttachFile> selAttachFileList(AttachFile attachFile) {
		return attachFileDao.selAttachFileList(attachFile);
	}
	
	public AttachFile getAttachFile(AttachFile attachFile) {
		return attachFileDao.getAttachFile(attachFile);
	}

	public String prcsAttachFile(String fileId, List<AttachFile> fileList) {
		if (!fileList.isEmpty()) {
			if ("".equals(fileId)) { // 기존 파일 아이디가 없는 경우 파일 마스터 추가
				fileId = UUID.randomUUID().toString();

				// 마스터 테이블 데이터 추가
				AttachFile attachFile = new AttachFile();
				attachFile.setFileId(fileId);
				attachFile.setCreator("");
				attachFile.setEditor("");
				attachFileDao.insAttachFileMt(attachFile);
			}

			// 첨부파일 갯수만큼 디테일 추가
			for (AttachFile attachFile : fileList) {
				attachFile.setFileId(fileId);
				attachFile.setCreator("");
				attachFile.setEditor("");
				attachFileDao.insAttachFileDt(attachFile);
			}
		}

		return fileId;
	}

	public void deleteAttachFile(AttachFile attachFile) {
		List<AttachFile> targetList = selAttachFileList(attachFile);

		for (AttachFile target : targetList) {
			deleteAttachFilePath(target);
		}

		attachFileDao.delAttachFileDt(attachFile);
		attachFileDao.delAttachFileMt(attachFile);
	}

	public void deleteAttachFilePath(AttachFile attachFile) {
		File targetFile = new File(PropertyUtil.getString("attach.basedir") + attachFile.getFilePath());
		targetFile.delete();
	}

	public List<AttachFile> uploadAttachFile(String saveDir, HttpServletRequest request, HttpServletResponse response) throws IOException {
		File uploadDir = new File(saveDir);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		ArrayList<AttachFile> list = new ArrayList<AttachFile>();

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultiValueMap<String, MultipartFile> multiValueMap = multipartRequest.getMultiFileMap();

		List<MultipartFile> files = multiValueMap.get("attachFile");
		for (MultipartFile file : files) {
			if (!file.isEmpty()) {
				fileFunc(saveDir, list, file);
			}
		}
		return list;
	}

	public void fileFunc(String saveDir, List<AttachFile> list, MultipartFile file) throws IOException {
		long limitSize = Long.parseLong(PropertyUtil.getString("attach.uploadSize"));
		
		if (limitSize > file.getSize()) {
			String fileName = file.getOriginalFilename();
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
			String onlyName = fileName.substring(0, fileName.lastIndexOf("."));
			String saveFilename = fileName;
	
	
			// 파일명이 중복되는 경우 변경처리
			if (new File(saveDir + "/" + fileName).exists()) {
				int fileSeq = 1;
				while (isFileExists(saveDir, onlyName, fileSeq, ext)) {
					fileSeq++;
				}
				saveFilename = onlyName + "_" + fileSeq + "." + ext;
			}
	
	
			// 실제 파일 업로드
			file.transferTo(new File(saveDir + "/" + saveFilename));
			LOGGER.debug("FileSaved => " + saveDir + "/" + saveFilename);
	
			AttachFile attachFile = new AttachFile();
			attachFile.setFileOrgNm(fileName);
			attachFile.setFileSaveNm(saveFilename);
			attachFile.setFileSize("" + file.getSize());
			attachFile.setFilePath(saveDir.replaceAll(PropertyUtil.getString("attach.basedir"), "") + "/" + saveFilename);
			attachFile.setFileExt(ext);
			list.add(attachFile);
		} else {
			throw new UbiBizException("파일업로드 용량초과");
		}
	}

	public boolean isFileExists(String saveDir, String onlyName, int fileSeq, String ext) {
		return new File(saveDir + "/" + onlyName + "_" + (fileSeq) + "." + ext).exists();
	}

}
