package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("PersDataS")
public class MatrCodeS implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String matrCode;
	
	private String matrName;
	
	private String matrGubn;
	
	private String matrSpec;
	
	private String matrUnit;
	
	private int packUnit;
	
	private int morderUnit;
	
	private String validTime;
	
	private int leadTime;
	
	private int safetyQty;
	
	private String safetyKind;
	
	private int baseWet;
	
	private int totWet;
	
	private String inspYn;
	
	private int keepTemp1;
	
	private int keepTemp2;
	
	private String enterDate;
	
	private String hsCode;
	
	private String useEndDate;
	
	private String useYn;
	
	private String acctKind;
	
	private int inputUnit;
	
	private int outUnit1;
	
	private int outUnit2;
	
	private String makeCust;
	
	
	

}
