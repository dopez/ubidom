package com.ubi.erp.pers.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("PersDataS")
public class PersDataS implements Serializable {
	private static final long serialVersionUID = 1L;
	private String sysEmpNo; // 로그인사원번호
	private String no; // grid no
	private String postNo; // 우편번호
	private String postCode; // 부서코드
	private String postName; // 부서이름
	private String compId; // 사업장
	private String empNo; // 사업번호
	private String korName; // 한국이름
	private String engName; // 영문이름
	private String chaName; // 한자이름
	private String regiNumb; // 주민번호
	private String jikwee; // 직위
	private String jikmu; // 직무명
	private String jikchak; // 직책명
	private String address; // 주소
	private String baseAddrs; // 본적
	private String tel; // 전화번호
	private String handPhone; // 후대전화
	private String email; // 이메일
	private String character; // 성격
	private String taste; // 취미
	private String partCont; // 특기
	private int length; // 신장
	private int weight; // 몸무게
	private String blood; // 혈액형
	private String eyeLeft; // 좌시력
	private String eyeRight; // 우시력
	private String disaYn; // 결혼유무
	private String bldKind; // 색맹구분
	private String disorderYn; // 장애구분
	private String disorderCont; // 장애이유(장애사)
	private String armyKind; // 군별
	private String armyJong; // 군종
	private String amryBarch; // 병과
	private String armyGd; // 계급
	private String armyYn; // 전역구분
	private String armyNo; // 군번
	private String amryDate1; // 복무시작일
	private String amryDate2; // 복무종료일
	private String enterDate; // 입사일자
	private String retireDate; // 퇴사일자
	private String retireMidDate; // 중간정산일자
	private String bankCode; // 인행코드
	private String bankNumb; // 계좌번호
	private String religion; // 종교
	private String armySpcase; // 병력특례유무
	private String armyMerit; // 보훈유무
	private String cudKey;
	private String imgName; // 이미지 이름

	public PersDataS() {
		super();
	}

	public String getSysEmpNo() {
		return sysEmpNo;
	}

	public void setSysEmpNo(String sysEmpNo) {
		this.sysEmpNo = sysEmpNo;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
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

	public String getJikwee() {
		return jikwee;
	}

	public void setJikwee(String jikwee) {
		this.jikwee = jikwee;
	}

	public String getJikmu() {
		return jikmu;
	}

	public void setJikmu(String jikmu) {
		this.jikmu = jikmu;
	}

	public String getJikchak() {
		return jikchak;
	}

	public void setJikchak(String jikchak) {
		this.jikchak = jikchak;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBaseAddrs() {
		return baseAddrs;
	}

	public void setBaseAddrs(String baseAddrs) {
		this.baseAddrs = baseAddrs;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getBlood() {
		return blood;
	}

	public void setBlood(String blood) {
		this.blood = blood;
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

	public String getDisaYn() {
		return disaYn;
	}

	public void setDisaYn(String disaYn) {
		this.disaYn = disaYn;
	}

	public String getBldKind() {
		return bldKind;
	}

	public void setBldKind(String bldKind) {
		this.bldKind = bldKind;
	}

	public String getDisorderYn() {
		return disorderYn;
	}

	public void setDisorderYn(String disorderYn) {
		this.disorderYn = disorderYn;
	}

	public String getDisorderCont() {
		return disorderCont;
	}

	public void setDisorderCont(String disorderCont) {
		this.disorderCont = disorderCont;
	}

	public String getArmyKind() {
		return armyKind;
	}

	public void setArmyKind(String armyKind) {
		this.armyKind = armyKind;
	}

	public String getArmyJong() {
		return armyJong;
	}

	public void setArmyJong(String armyJong) {
		this.armyJong = armyJong;
	}

	public String getAmryBarch() {
		return amryBarch;
	}

	public void setAmryBarch(String amryBarch) {
		this.amryBarch = amryBarch;
	}

	public String getArmyGd() {
		return armyGd;
	}

	public void setArmyGd(String armyGd) {
		this.armyGd = armyGd;
	}

	public String getArmyYn() {
		return armyYn;
	}

	public void setArmyYn(String armyYn) {
		this.armyYn = armyYn;
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

	public String getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}

	public String getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(String retireDate) {
		this.retireDate = retireDate;
	}

	public String getRetireMidDate() {
		return retireMidDate;
	}

	public void setRetireMidDate(String retireMidDate) {
		this.retireMidDate = retireMidDate;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBankNumb() {
		return bankNumb;
	}

	public void setBankNumb(String bankNumb) {
		this.bankNumb = bankNumb;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getArmySpcase() {
		return armySpcase;
	}

	public void setArmySpcase(String armySpcase) {
		this.armySpcase = armySpcase;
	}

	public String getArmyMerit() {
		return armyMerit;
	}

	public void setArmyMerit(String armyMerit) {
		this.armyMerit = armyMerit;
	}

	public String getCudKey() {
		return cudKey;
	}

	public void setCudKey(String cudKey) {
		this.cudKey = cudKey;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
