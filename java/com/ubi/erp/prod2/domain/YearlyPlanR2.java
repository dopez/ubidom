package com.ubi.erp.prod2.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("YearlyPlanR2")
public class YearlyPlanR2 implements Serializable {
	private static final long serialVersionUID = 1L;

	private String no;

	private String sysEmpNo;

	private String compId;

	private String cudKey;

	private String setNumb;

	private String planYear;

	private String prodKind;

	private String equiCode;

	private String itemCode;

	private String itemName;

	private String itemUnit;

	private String packUnit;

	private int planQty1;

	private int planQty2;

	private int planQty3;

	private int planQty4;

	private int planQty5;

	private int planQty6;

	private int planQty7;

	private int planQty8;

	private int planQty9;

	private int planQty10;

	private int planQty11;

	private int planQty12;

	private int planQtySum;

	private String frYear;

	private String toYear;

	public String getFrYear() {
		return frYear;
	}

	public void setFrYear(String frYear) {
		this.frYear = frYear;
	}

	public String getToYear() {
		return toYear;
	}

	public void setToYear(String toYear) {
		this.toYear = toYear;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getCudKey() {
		return cudKey;
	}

	public void setCudKey(String cudKey) {
		this.cudKey = cudKey;
	}

	public String getSetNumb() {
		return setNumb;
	}

	public void setSetNumb(String setNumb) {
		this.setNumb = setNumb;
	}

	public String getPlanYear() {
		return planYear;
	}

	public void setPlanYear(String planYear) {
		this.planYear = planYear;
	}

	public String getProdKind() {
		return prodKind;
	}

	public void setProdKind(String prodKind) {
		this.prodKind = prodKind;
	}

	public String getEquiCode() {
		return equiCode;
	}

	public void setEquiCode(String equiCode) {
		this.equiCode = equiCode;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemUnit() {
		return itemUnit;
	}

	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
	}

	public String getPackUnit() {
		return packUnit;
	}

	public void setPackUnit(String packUnit) {
		this.packUnit = packUnit;
	}

	public int getPlanQty1() {
		return planQty1;
	}

	public void setPlanQty1(int planQty1) {
		this.planQty1 = planQty1;
	}

	public int getPlanQty2() {
		return planQty2;
	}

	public void setPlanQty2(int planQty2) {
		this.planQty2 = planQty2;
	}

	public int getPlanQty3() {
		return planQty3;
	}

	public void setPlanQty3(int planQty3) {
		this.planQty3 = planQty3;
	}

	public int getPlanQty4() {
		return planQty4;
	}

	public void setPlanQty4(int planQty4) {
		this.planQty4 = planQty4;
	}

	public int getPlanQty5() {
		return planQty5;
	}

	public void setPlanQty5(int planQty5) {
		this.planQty5 = planQty5;
	}

	public int getPlanQty6() {
		return planQty6;
	}

	public void setPlanQty6(int planQty6) {
		this.planQty6 = planQty6;
	}

	public int getPlanQty7() {
		return planQty7;
	}

	public void setPlanQty7(int planQty7) {
		this.planQty7 = planQty7;
	}

	public int getPlanQty8() {
		return planQty8;
	}

	public void setPlanQty8(int planQty8) {
		this.planQty8 = planQty8;
	}

	public int getPlanQty9() {
		return planQty9;
	}

	public void setPlanQty9(int planQty9) {
		this.planQty9 = planQty9;
	}

	public int getPlanQty10() {
		return planQty10;
	}

	public void setPlanQty10(int planQty10) {
		this.planQty10 = planQty10;
	}

	public int getPlanQty11() {
		return planQty11;
	}

	public void setPlanQty11(int planQty11) {
		this.planQty11 = planQty11;
	}

	public int getPlanQty12() {
		return planQty12;
	}

	public void setPlanQty12(int planQty12) {
		this.planQty12 = planQty12;
	}

	public int getPlanQtySum() {
		return planQtySum;
	}

	public void setPlanQtySum(int planQtySum) {
		this.planQtySum = planQtySum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
