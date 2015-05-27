package com.ubi.erp.sale.domain;

import org.apache.ibatis.type.Alias;

@Alias("CustCompR")
public class CustCompR {

	private static final long serialVersionUID = 1L;

    private String compId;
    private String custCode;
    private String custKorName;
    private String custNumb;
    private String regiNumb;
    private String lawNumb;
    private String director;
    private String bussCode;
	private String bussKind;
    private String postNo;
    private String custAddress;
    private String custAddressB;
    private String telNo;
    private String hpNo;
    private String faxNo;
    private String homePage;
    private String eMail;
    private String useYn;
    private String custKindA;
    private String custKindB;
    private String custKindL;
    private String custKindH;
    private String custKindQ;
    private String custKindZ;
    private String custKindE;
    private String remarks;
    private String empNo;
    private String empName;
    private String jobPosition;
    private String deptName;
    private String hpNoEmp;
    private String telNoEmp;
    private String emailEmp;
    private String startDate;
    public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getCustCode() {
		return custCode;
	}
	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}
	public String getCustKorName() {
		return custKorName;
	}
	public void setCustKorName(String custKorName) {
		this.custKorName = custKorName;
	}
	public String getCustNumb() {
		return custNumb;
	}
	public void setCustNumb(String custNumb) {
		this.custNumb = custNumb;
	}
	public String getRegiNumb() {
		return regiNumb;
	}
	public void setRegiNumb(String regiNumb) {
		this.regiNumb = regiNumb;
	}
	public String getLawNumb() {
		return lawNumb;
	}
	public void setLawNumb(String lawNumb) {
		this.lawNumb = lawNumb;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getBussCode() {
		return bussCode;
	}
	public void setBussCode(String bussCode) {
		this.bussCode = bussCode;
	}
	public String getBussKind() {
		return bussKind;
	}
	public void setBussKind(String bussKind) {
		this.bussKind = bussKind;
	}
	public String getPostNo() {
		return postNo;
	}
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	public String getCustAddress() {
		return custAddress;
	}
	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}
	public String getCustAddressB() {
		return custAddressB;
	}
	public void setCustAddressB(String custAddressB) {
		this.custAddressB = custAddressB;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	public String getHpNo() {
		return hpNo;
	}
	public void setHpNo(String hpNo) {
		this.hpNo = hpNo;
	}
	public String getFaxNo() {
		return faxNo;
	}
	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getCustKindA() {
		return custKindA;
	}
	public void setCustKindA(String custKindA) {
		this.custKindA = custKindA;
	}
	public String getCustKindB() {
		return custKindB;
	}
	public void setCustKindB(String custKindB) {
		this.custKindB = custKindB;
	}
	public String getCustKindL() {
		return custKindL;
	}
	public void setCustKindL(String custKindL) {
		this.custKindL = custKindL;
	}
	public String getCustKindH() {
		return custKindH;
	}
	public void setCustKindH(String custKindH) {
		this.custKindH = custKindH;
	}
	public String getCustKindQ() {
		return custKindQ;
	}
	public void setCustKindQ(String custKindQ) {
		this.custKindQ = custKindQ;
	}
	public String getCustKindZ() {
		return custKindZ;
	}
	public void setCustKindZ(String custKindZ) {
		this.custKindZ = custKindZ;
	}
	public String getCustKindE() {
		return custKindE;
	}
	public void setCustKindE(String custKindE) {
		this.custKindE = custKindE;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getJobPosition() {
		return jobPosition;
	}
	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getHpNoEmp() {
		return hpNoEmp;
	}
	public void setHpNoEmp(String hpNoEmp) {
		this.hpNoEmp = hpNoEmp;
	}
	public String getTelNoEmp() {
		return telNoEmp;
	}
	public void setTelNoEmp(String telNoEmp) {
		this.telNoEmp = telNoEmp;
	}
	public String getEmailEmp() {
		return emailEmp;
	}
	public void setEmailEmp(String emailEmp) {
		this.emailEmp = emailEmp;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
