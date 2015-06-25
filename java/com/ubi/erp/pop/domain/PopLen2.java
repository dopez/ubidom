package com.ubi.erp.pop.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("PopLen2")
public class PopLen2 implements Serializable {
	private static final long serialVersionUID = 1L;
	private String compId;
	private String innerCode;
	private String innerName;
	private String kind;
	//Kind 종류
	// '사원' , '부서', '부품', '고객', '개발관리' , ' 설비', '개발01', '개발02'

	public String getCompId() {
		return compId;
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
