package com.ubi.erp.pop.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("Popup")
public class Popup implements Serializable {
	private static final long serialVersionUID = 1L;

	private String compId;

	private String innerCode;

	private String innerName;

	private String kind;

	// Kind 종류
	// '사원' , '부서', '부품', '고객', '개발관리' , ' 설비', '개발01', '개발02'

	private String spec;

	private String unit;

	private int packUnit;

	// 4개짜리 kind = 제품, 자재, 설비부품

	private String gubn;

	public String getGubn() {
		return gubn;
	}

	public void setGubn(String gubn) {
		this.gubn = gubn;
	}

	public String getCompId() {
		return compId;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public int getPackUnit() {
		return packUnit;
	}

	public void setPackUnit(int packUnit) {
		this.packUnit = packUnit;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getInnerCode() {
		return innerCode;
	}

	public void setInnerCode(String innerCode) {
		this.innerCode = innerCode;
	}

	public String getInnerName() {
		return innerName;
	}

	public void setInnerName(String innerName) {
		this.innerName = innerName;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
