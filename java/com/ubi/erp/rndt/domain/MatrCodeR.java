package com.ubi.erp.rndt.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("MatrCodeR")
public class MatrCodeR implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String compId;
	
	private String matrCode;
	
	private String matrName;
	
	private String matrSpec;
	
	private int packUnit;
	
	private int morderUnit;
	
	private int inputUnit;
	
	private String matrGubn;
	
	public MatrCodeR() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MatrCodeR(String compId, String matrCode, String matrName,
			String matrSpec, int packUnit, int morderUnit, int inputUnit,
			String matrGubn) {
		super();
		this.compId = compId;
		this.matrCode = matrCode;
		this.matrName = matrName;
		this.matrSpec = matrSpec;
		this.packUnit = packUnit;
		this.morderUnit = morderUnit;
		this.inputUnit = inputUnit;
		this.matrGubn = matrGubn;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getMatrCode() {
		return matrCode;
	}

	public void setMatrCode(String matrCode) {
		this.matrCode = matrCode;
	}

	public String getMatrName() {
		return matrName;
	}

	public void setMatrName(String matrName) {
		this.matrName = matrName;
	}

	public String getMatrSpec() {
		return matrSpec;
	}

	public void setMatrSpec(String matrSpec) {
		this.matrSpec = matrSpec;
	}

	public int getPackUnit() {
		return packUnit;
	}

	public void setPackUnit(int packUnit) {
		this.packUnit = packUnit;
	}

	public int getMorderUnit() {
		return morderUnit;
	}

	public void setMorderUnit(int morderUnit) {
		this.morderUnit = morderUnit;
	}

	public int getInputUnit() {
		return inputUnit;
	}

	public void setInputUnit(int inputUnit) {
		this.inputUnit = inputUnit;
	}

	public String getMatrGubn() {
		return matrGubn;
	}

	public void setMatrGubn(String matrGubn) {
		this.matrGubn = matrGubn;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
