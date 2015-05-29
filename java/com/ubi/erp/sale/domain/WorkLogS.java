package com.ubi.erp.sale.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("WorkLogS")
public class WorkLogS implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String crudKey;
	private String compId;
	private String logKind;
	private String logDate;
	private String logSeq;
	private String rNum;
	private String empNo;
	private String korName;
	private String workKind;
	private String logNum;
	private String logName;
	private String custCode;
	private String custKorName;
	private String logNote;
	private String fileName;

}
