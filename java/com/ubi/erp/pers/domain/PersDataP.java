package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("PersDataP")
public class PersDataP implements Serializable {
	private static final long serialVersionUID = 1L;
	private String compId; // 사업장
	private String empNo; // 사업번호
	private String korName; // 한국이름
	private String engName; // 영문이름
	private String chaName; // 한자이름
	private String regiNumb; // 주민번호
	private String eMail; // 이메일
	private String enterDate; // 입사일자
	private String postCode; // 부서코드
	private String postName; // 부서이름
	private String jikwee; // 직위
	private String jikchak; // 직책명
	private String disorderCont; // 장애이유(장애사)
	private String baseAddrs; // 본적
	private String address; // 주소
	private String tel; // 전화번호
	private String handPhone; // 후대전화
	private String character; // 성격
	private String taste; // 취미
	private String partCont; // 특기
	private int length; // 신장
	private int weight; // 몸무게
	private String eyeLeft; // 좌시력
	private String eyeRight; // 우시력
	private String blood; // 혈액형
	private String bldKind; // 색맹구분
	private String armyKind; // 군별
	private String amryBarch; // 병과
	private String armyNo; // 군번
	private String amryDate1; // 복무시작일
	private String amryDate2; // 복무종료일
	private String religion; // 종교
	private String armyYn; // 전역구분
	private String armyGd; // 계급
	private String armyMerit; // 보훈유무
	
	private String eduDate1;
	private String eduName;
	private String specCode1;
	private String eduDate2;
	private String eduName2;
	private String specCode1_2;
	private String eduDate3;
	private String eduName3;
	private String specCode1_3;
	private String eduDate4;
	private String eduName4;
	private String specCode1_4;
	private String eduDate5;
	private String eduName5;
	private String specCode1_5;
	private String eduDate6;
	private String eduName6;
	private String specCode1_6;
	
	private String qualNmGd1;
	private String achiDate1;
	private String qualNmGd2;
	private String achiDate2;
	private String qualNmGd3;
	private String achiDate3;
	private String qualNmGd4;
	private String achiDate4;
	private String qualNmGd5;
	private String achiDate5;
	private String qualNmGd6;
	private String achiDate6;
	
	private String famRel;
	private String famName;
	private String juminNo;
	private String scholarship;
	private String job;
	
	private String careerDate;
	private String careerName;
	private String jikmoo;
	private String jikwee2;

	private String imgPath; // 이미지 경로
	
	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getChaName() {
		return chaName;
	}

	public void setChaName(String chaName) {
		this.chaName = chaName;
	}

	public String getRegiNumb() {
		return regiNumb;
	}

	public void setRegiNumb(String regiNumb) {
		this.regiNumb = regiNumb;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getJikwee() {
		return jikwee;
	}

	public void setJikwee(String jikwee) {
		this.jikwee = jikwee;
	}

	public String getJikchak() {
		return jikchak;
	}

	public void setJikchak(String jikchak) {
		this.jikchak = jikchak;
	}

	public String getDisorderCont() {
		return disorderCont;
	}

	public void setDisorderCont(String disorderCont) {
		this.disorderCont = disorderCont;
	}

	public String getBaseAddrs() {
		return baseAddrs;
	}

	public void setBaseAddrs(String baseAddrs) {
		this.baseAddrs = baseAddrs;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHandPhone() {
		return handPhone;
	}

	public void setHandPhone(String handPhone) {
		this.handPhone = handPhone;
	}

	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getPartCont() {
		return partCont;
	}

	public void setPartCont(String partCont) {
		this.partCont = partCont;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getEyeLeft() {
		return eyeLeft;
	}

	public void setEyeLeft(String eyeLeft) {
		this.eyeLeft = eyeLeft;
	}

	public String getEyeRight() {
		return eyeRight;
	}

	public void setEyeRight(String eyeRight) {
		this.eyeRight = eyeRight;
	}

	public String getBlood() {
		return blood;
	}

	public void setBlood(String blood) {
		this.blood = blood;
	}

	public String getBldKind() {
		return bldKind;
	}

	public void setBldKind(String bldKind) {
		this.bldKind = bldKind;
	}

	public String getArmyKind() {
		return armyKind;
	}

	public void setArmyKind(String armyKind) {
		this.armyKind = armyKind;
	}

	public String getAmryBarch() {
		return amryBarch;
	}

	public void setAmryBarch(String amryBarch) {
		this.amryBarch = amryBarch;
	}

	public String getArmyNo() {
		return armyNo;
	}

	public void setArmyNo(String armyNo) {
		this.armyNo = armyNo;
	}

	public String getAmryDate1() {
		return amryDate1;
	}

	public void setAmryDate1(String amryDate1) {
		this.amryDate1 = amryDate1;
	}

	public String getAmryDate2() {
		return amryDate2;
	}

	public void setAmryDate2(String amryDate2) {
		this.amryDate2 = amryDate2;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getArmyYn() {
		return armyYn;
	}

	public void setArmyYn(String armyYn) {
		this.armyYn = armyYn;
	}

	public String getArmyGd() {
		return armyGd;
	}

	public void setArmyGd(String armyGd) {
		this.armyGd = armyGd;
	}

	public String getArmyMerit() {
		return armyMerit;
	}

	public void setArmyMerit(String armyMerit) {
		this.armyMerit = armyMerit;
	}

	public String getEduDate1() {
		return eduDate1;
	}

	public void setEduDate1(String eduDate1) {
		this.eduDate1 = eduDate1;
	}

	public String getEduName() {
		return eduName;
	}

	public void setEduName(String eduName) {
		this.eduName = eduName;
	}

	public String getSpecCode1() {
		return specCode1;
	}

	public void setSpecCode1(String specCode1) {
		this.specCode1 = specCode1;
	}

	public String getEduDate2() {
		return eduDate2;
	}

	public void setEduDate2(String eduDate2) {
		this.eduDate2 = eduDate2;
	}

	public String getEduName2() {
		return eduName2;
	}

	public void setEduName2(String eduName2) {
		this.eduName2 = eduName2;
	}

	public String getSpecCode1_2() {
		return specCode1_2;
	}

	public void setSpecCode1_2(String specCode1_2) {
		this.specCode1_2 = specCode1_2;
	}

	public String getEduDate3() {
		return eduDate3;
	}

	public void setEduDate3(String eduDate3) {
		this.eduDate3 = eduDate3;
	}

	public String getEduName3() {
		return eduName3;
	}

	public void setEduName3(String eduName3) {
		this.eduName3 = eduName3;
	}

	public String getSpecCode1_3() {
		return specCode1_3;
	}

	public void setSpecCode1_3(String specCode1_3) {
		this.specCode1_3 = specCode1_3;
	}

	public String getEduDate4() {
		return eduDate4;
	}

	public void setEduDate4(String eduDate4) {
		this.eduDate4 = eduDate4;
	}

	public String getEduName4() {
		return eduName4;
	}

	public void setEduName4(String eduName4) {
		this.eduName4 = eduName4;
	}

	public String getSpecCode1_4() {
		return specCode1_4;
	}

	public void setSpecCode1_4(String specCode1_4) {
		this.specCode1_4 = specCode1_4;
	}

	public String getEduDate5() {
		return eduDate5;
	}

	public void setEduDate5(String eduDate5) {
		this.eduDate5 = eduDate5;
	}

	public String getEduName5() {
		return eduName5;
	}

	public void setEduName5(String eduName5) {
		this.eduName5 = eduName5;
	}

	public String getSpecCode1_5() {
		return specCode1_5;
	}

	public void setSpecCode1_5(String specCode1_5) {
		this.specCode1_5 = specCode1_5;
	}

	public String getEduDate6() {
		return eduDate6;
	}

	public void setEduDate6(String eduDate6) {
		this.eduDate6 = eduDate6;
	}

	public String getEduName6() {
		return eduName6;
	}

	public void setEduName6(String eduName6) {
		this.eduName6 = eduName6;
	}

	public String getSpecCode1_6() {
		return specCode1_6;
	}

	public void setSpecCode1_6(String specCode1_6) {
		this.specCode1_6 = specCode1_6;
	}

	public String getQualNmGd1() {
		return qualNmGd1;
	}

	public void setQualNmGd1(String qualNmGd1) {
		this.qualNmGd1 = qualNmGd1;
	}

	public String getAchiDate1() {
		return achiDate1;
	}

	public void setAchiDate1(String achiDate1) {
		this.achiDate1 = achiDate1;
	}

	public String getQualNmGd2() {
		return qualNmGd2;
	}

	public void setQualNmGd2(String qualNmGd2) {
		this.qualNmGd2 = qualNmGd2;
	}

	public String getAchiDate2() {
		return achiDate2;
	}

	public void setAchiDate2(String achiDate2) {
		this.achiDate2 = achiDate2;
	}

	public String getQualNmGd3() {
		return qualNmGd3;
	}

	public void setQualNmGd3(String qualNmGd3) {
		this.qualNmGd3 = qualNmGd3;
	}

	public String getAchiDate3() {
		return achiDate3;
	}

	public void setAchiDate3(String achiDate3) {
		this.achiDate3 = achiDate3;
	}

	public String getQualNmGd4() {
		return qualNmGd4;
	}

	public void setQualNmGd4(String qualNmGd4) {
		this.qualNmGd4 = qualNmGd4;
	}

	public String getAchiDate4() {
		return achiDate4;
	}

	public void setAchiDate4(String achiDate4) {
		this.achiDate4 = achiDate4;
	}

	public String getQualNmGd5() {
		return qualNmGd5;
	}

	public void setQualNmGd5(String qualNmGd5) {
		this.qualNmGd5 = qualNmGd5;
	}

	public String getAchiDate5() {
		return achiDate5;
	}

	public void setAchiDate5(String achiDate5) {
		this.achiDate5 = achiDate5;
	}

	public String getQualNmGd6() {
		return qualNmGd6;
	}

	public void setQualNmGd6(String qualNmGd6) {
		this.qualNmGd6 = qualNmGd6;
	}

	public String getAchiDate6() {
		return achiDate6;
	}

	public void setAchiDate6(String achiDate6) {
		this.achiDate6 = achiDate6;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getFamRel() {
		return famRel;
	}

	public void setFamRel(String famRel) {
		this.famRel = famRel;
	}

	public String getFamName() {
		return famName;
	}

	public void setFamName(String famName) {
		this.famName = famName;
	}

	public String getJuminNo() {
		return juminNo;
	}

	public void setJuminNo(String juminNo) {
		this.juminNo = juminNo;
	}

	public String getScholarship() {
		return scholarship;
	}

	public void setScholarship(String scholarship) {
		this.scholarship = scholarship;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getCareerDate() {
		return careerDate;
	}

	public void setCareerDate(String careerDate) {
		this.careerDate = careerDate;
	}

	public String getCareerName() {
		return careerName;
	}

	public void setCareerName(String careerName) {
		this.careerName = careerName;
	}

	public String getJikmoo() {
		return jikmoo;
	}

	public void setJikmoo(String jikmoo) {
		this.jikmoo = jikmoo;
	}

	public String getJikwee2() {
		return jikwee2;
	}

	public void setJikwee2(String jikwee2) {
		this.jikwee2 = jikwee2;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
