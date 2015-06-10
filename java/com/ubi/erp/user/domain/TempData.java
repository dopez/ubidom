package com.ubi.erp.user.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("TempData")
public class TempData implements Serializable
{
	private static final long serialVersionUID = 1L;

	private String fmtId; 	    // FMT_ID		   VARCHAR2(4)			    양식ID(PK1)
	private int regIdx;		    // REG_IDX         NUMBER(5)     	         등록IDX(PK2)
	private int rowIdx; 	    // ROW_IDX         NUMBER(5)     	         행IDX(PK3)
    private String clm1;        // CLM1            VARCHAR2(2000)          CLM1
    private String clm2;        // CLM2            VARCHAR2(2000)          CLM2
    private String clm3;        // CLM3            VARCHAR2(2000)          CLM3
    private String clm4;        // CLM4            VARCHAR2(2000)          CLM4
    private String clm5;        // CLM5            VARCHAR2(2000)          CLM5
    private String clm6;        // CLM6            VARCHAR2(2000)          CLM6
    private String clm7;        // CLM7            VARCHAR2(2000)          CLM7
    private String clm8;        // CLM8            VARCHAR2(2000)          CLM8
    private String clm9;        // CLM9            VARCHAR2(2000)          CLM9
    private String clm10;        // CLM10           VARCHAR2(2000)          CLM10
    private String clm11;        // CLM11           VARCHAR2(2000)          CLM11
    private String clm12;        // CLM12           VARCHAR2(2000)          CLM12
    private String clm13;        // CLM13           VARCHAR2(2000)          CLM13
    private String clm14;        // CLM14           VARCHAR2(2000)          CLM14
    private String clm15;        // CLM15           VARCHAR2(2000)          CLM15
    private String clm16;        // CLM16           VARCHAR2(2000)          CLM16
    private String clm17;        // CLM17           VARCHAR2(2000)          CLM17
    private String clm18;        // CLM18           VARCHAR2(2000)          CLM18
    private String clm19;        // CLM19           VARCHAR2(2000)          CLM19
    private String clm20;        // CLM20           VARCHAR2(2000)          CLM20
    private String clm21;        // CLM21           VARCHAR2(2000)          CLM21
    private String clm22;        // CLM22           VARCHAR2(2000)          CLM22
    private String clm23;        // CLM23           VARCHAR2(2000)          CLM23
    private String clm24;        // CLM24           VARCHAR2(2000)          CLM24
    private String clm25;        // CLM25           VARCHAR2(2000)          CLM25
    private String clm26;        // CLM26           VARCHAR2(2000)          CLM26
    private String clm27;        // CLM27           VARCHAR2(2000)          CLM27
    private String clm28;        // CLM28           VARCHAR2(2000)          CLM28
    private String clm29;        // CLM29           VARCHAR2(2000)          CLM29
    private String clm30;        // CLM30           VARCHAR2(2000)          CLM30
    private String clm31;        // CLM31           VARCHAR2(2000)          CLM31
    private String clm32;        // CLM32           VARCHAR2(2000)          CLM32
    private String clm33;        // CLM33           VARCHAR2(2000)          CLM33
    private String clm34;        // CLM34           VARCHAR2(2000)          CLM34
    private String clm35;        // CLM35           VARCHAR2(2000)          CLM35
    private String clm36;        // CLM36           VARCHAR2(2000)          CLM36
    private String clm37;        // CLM37           VARCHAR2(2000)          CLM37
    private String clm38;        // CLM38           VARCHAR2(2000)          CLM38
    private String clm39;        // CLM39           VARCHAR2(2000)          CLM39
    private String clm40;        // CLM40           VARCHAR2(2000)          CLM40
    private String clm41;        // CLM41           VARCHAR2(2000)          CLM41
    private String clm42;        // CLM42           VARCHAR2(2000)          CLM42
    private String clm43;        // CLM43           VARCHAR2(2000)          CLM43
    private String clm44;        // CLM44           VARCHAR2(2000)          CLM44
    private String clm45;        // CLM45           VARCHAR2(2000)          CLM45
    private String clm46;        // CLM46           VARCHAR2(2000)          CLM46
    private String clm47;        // CLM47           VARCHAR2(2000)          CLM47
    private String clm48;        // CLM48           VARCHAR2(2000)          CLM48
    private String clm49;        // CLM49           VARCHAR2(2000)          CLM49
    private String clm50;        // CLM50           VARCHAR2(2000)          CLM50
    private String clm51;        // CLM51           VARCHAR2(2000)          CLM51
    private String clm52;        // CLM52           VARCHAR2(2000)          CLM52
    private String clm53;        // CLM53           VARCHAR2(2000)          CLM53
    private String clm54;        // CLM54           VARCHAR2(2000)          CLM54
    private String clm55;        // CLM55           VARCHAR2(2000)          CLM55
    private String clm56;        // CLM56           VARCHAR2(2000)          CLM56
    private String clm57;        // CLM57           VARCHAR2(2000)          CLM57
    private String clm58;        // CLM58           VARCHAR2(2000)          CLM58
    private String clm59;        // CLM59           VARCHAR2(2000)          CLM59
    private String clm60;        // CLM60           VARCHAR2(2000)          CLM60
    private String clm61;        // CLM61           VARCHAR2(2000)          CLM61
    private String clm62;        // CLM62           VARCHAR2(2000)          CLM62
    private String clm63;        // CLM63           VARCHAR2(2000)          CLM63
    private String clm64;        // CLM64           VARCHAR2(2000)          CLM64
    private String clm65;        // CLM65           VARCHAR2(2000)          CLM65
    private String clm66;        // CLM66           VARCHAR2(2000)          CLM66
    private String clm67;        // CLM67           VARCHAR2(2000)          CLM67
    private String clm68;        // CLM68           VARCHAR2(2000)          CLM68
    private String clm69;        // CLM69           VARCHAR2(2000)          CLM69
    private String clm70;        // CLM70           VARCHAR2(2000)          CLM70
    private String clm71;        // CLM71           VARCHAR2(2000)          CLM71
    private String clm72;        // CLM72           VARCHAR2(2000)          CLM72
    private String clm73;        // CLM73           VARCHAR2(2000)          CLM73
    private String clm74;        // CLM74           VARCHAR2(2000)          CLM74
    private String clm75;        // CLM75           VARCHAR2(2000)          CLM75
    private String clm76;        // CLM76           VARCHAR2(2000)          CLM76
    private String clm77;        // CLM77           VARCHAR2(2000)          CLM77
    private String clm78;        // CLM78           VARCHAR2(2000)          CLM78
    private String clm79;        // CLM79           VARCHAR2(2000)          CLM79
    private String clm80;        // CLM80           VARCHAR2(2000)          CLM80
    private String clm81;        // CLM81           VARCHAR2(2000)          CLM81
    private String clm82;        // CLM82           VARCHAR2(2000)          CLM82
    private String clm83;        // CLM83           VARCHAR2(2000)          CLM83
    private String clm84;        // CLM84           VARCHAR2(2000)          CLM84
    private String clm85;        // CLM85           VARCHAR2(2000)          CLM85
    private String clm86;        // CLM86           VARCHAR2(2000)          CLM86
    private String clm87;        // CLM87           VARCHAR2(2000)          CLM87
    private String clm88;        // CLM88           VARCHAR2(2000)          CLM88
    private String clm89;        // CLM89           VARCHAR2(2000)          CLM89
    private String clm90;        // CLM90           VARCHAR2(2000)          CLM90
    private String clm91;        // CLM91           VARCHAR2(2000)          CLM91
    private String clm92;        // CLM92           VARCHAR2(2000)          CLM92
    private String clm93;        // CLM93           VARCHAR2(2000)          CLM93
    private String clm94;        // CLM94           VARCHAR2(2000)          CLM94
    private String clm95;        // CLM95           VARCHAR2(2000)          CLM95
    private String clm96;        // CLM96           VARCHAR2(2000)          CLM96
    private String clm97;        // CLM97           VARCHAR2(2000)          CLM97
    private String clm98;        // CLM98           VARCHAR2(2000)          CLM98
    private String clm99;        // CLM99           VARCHAR2(2000)          CLM99
    private String clm100;		 // CLM100          VARCHAR2(2000)          CLM100

	public String getFmtId() {
		return fmtId;
	}
	public void setFmtId(String fmtId) {
		this.fmtId = fmtId;
	}
	public int getRegIdx() {
		return regIdx;
	}
	public void setRegIdx(int regIdx) {
		this.regIdx = regIdx;
	}
	public int getRowIdx() {
		return rowIdx;
	}
	public void setRowIdx(int rowIdx) {
		this.rowIdx = rowIdx;
	}
	public String getClm1() {
		return clm1;
	}
	public void setClm1(String clm1) {
		this.clm1 = clm1;
	}
	public String getClm2() {
		return clm2;
	}
	public void setClm2(String clm2) {
		this.clm2 = clm2;
	}
	public String getClm3() {
		return clm3;
	}
	public void setClm3(String clm3) {
		this.clm3 = clm3;
	}
	public String getClm4() {
		return clm4;
	}
	public void setClm4(String clm4) {
		this.clm4 = clm4;
	}
	public String getClm5() {
		return clm5;
	}
	public void setClm5(String clm5) {
		this.clm5 = clm5;
	}
	public String getClm6() {
		return clm6;
	}
	public void setClm6(String clm6) {
		this.clm6 = clm6;
	}
	public String getClm7() {
		return clm7;
	}
	public void setClm7(String clm7) {
		this.clm7 = clm7;
	}
	public String getClm8() {
		return clm8;
	}
	public void setClm8(String clm8) {
		this.clm8 = clm8;
	}
	public String getClm9() {
		return clm9;
	}
	public void setClm9(String clm9) {
		this.clm9 = clm9;
	}
	public String getClm10() {
		return clm10;
	}
	public void setClm10(String clm10) {
		this.clm10 = clm10;
	}
	public String getClm11() {
		return clm11;
	}
	public void setClm11(String clm11) {
		this.clm11 = clm11;
	}
	public String getClm12() {
		return clm12;
	}
	public void setClm12(String clm12) {
		this.clm12 = clm12;
	}
	public String getClm13() {
		return clm13;
	}
	public void setClm13(String clm13) {
		this.clm13 = clm13;
	}
	public String getClm14() {
		return clm14;
	}
	public void setClm14(String clm14) {
		this.clm14 = clm14;
	}
	public String getClm15() {
		return clm15;
	}
	public void setClm15(String clm15) {
		this.clm15 = clm15;
	}
	public String getClm16() {
		return clm16;
	}
	public void setClm16(String clm16) {
		this.clm16 = clm16;
	}
	public String getClm17() {
		return clm17;
	}
	public void setClm17(String clm17) {
		this.clm17 = clm17;
	}
	public String getClm18() {
		return clm18;
	}
	public void setClm18(String clm18) {
		this.clm18 = clm18;
	}
	public String getClm19() {
		return clm19;
	}
	public void setClm19(String clm19) {
		this.clm19 = clm19;
	}
	public String getClm20() {
		return clm20;
	}
	public void setClm20(String clm20) {
		this.clm20 = clm20;
	}
	public String getClm21() {
		return clm21;
	}
	public void setClm21(String clm21) {
		this.clm21 = clm21;
	}
	public String getClm22() {
		return clm22;
	}
	public void setClm22(String clm22) {
		this.clm22 = clm22;
	}
	public String getClm23() {
		return clm23;
	}
	public void setClm23(String clm23) {
		this.clm23 = clm23;
	}
	public String getClm24() {
		return clm24;
	}
	public void setClm24(String clm24) {
		this.clm24 = clm24;
	}
	public String getClm25() {
		return clm25;
	}
	public void setClm25(String clm25) {
		this.clm25 = clm25;
	}
	public String getClm26() {
		return clm26;
	}
	public void setClm26(String clm26) {
		this.clm26 = clm26;
	}
	public String getClm27() {
		return clm27;
	}
	public void setClm27(String clm27) {
		this.clm27 = clm27;
	}
	public String getClm28() {
		return clm28;
	}
	public void setClm28(String clm28) {
		this.clm28 = clm28;
	}
	public String getClm29() {
		return clm29;
	}
	public void setClm29(String clm29) {
		this.clm29 = clm29;
	}
	public String getClm30() {
		return clm30;
	}
	public void setClm30(String clm30) {
		this.clm30 = clm30;
	}
	public String getClm31() {
		return clm31;
	}
	public void setClm31(String clm31) {
		this.clm31 = clm31;
	}
	public String getClm32() {
		return clm32;
	}
	public void setClm32(String clm32) {
		this.clm32 = clm32;
	}
	public String getClm33() {
		return clm33;
	}
	public void setClm33(String clm33) {
		this.clm33 = clm33;
	}
	public String getClm34() {
		return clm34;
	}
	public void setClm34(String clm34) {
		this.clm34 = clm34;
	}
	public String getClm35() {
		return clm35;
	}
	public void setClm35(String clm35) {
		this.clm35 = clm35;
	}
	public String getClm36() {
		return clm36;
	}
	public void setClm36(String clm36) {
		this.clm36 = clm36;
	}
	public String getClm37() {
		return clm37;
	}
	public void setClm37(String clm37) {
		this.clm37 = clm37;
	}
	public String getClm38() {
		return clm38;
	}
	public void setClm38(String clm38) {
		this.clm38 = clm38;
	}
	public String getClm39() {
		return clm39;
	}
	public void setClm39(String clm39) {
		this.clm39 = clm39;
	}
	public String getClm40() {
		return clm40;
	}
	public void setClm40(String clm40) {
		this.clm40 = clm40;
	}
	public String getClm41() {
		return clm41;
	}
	public void setClm41(String clm41) {
		this.clm41 = clm41;
	}
	public String getClm42() {
		return clm42;
	}
	public void setClm42(String clm42) {
		this.clm42 = clm42;
	}
	public String getClm43() {
		return clm43;
	}
	public void setClm43(String clm43) {
		this.clm43 = clm43;
	}
	public String getClm44() {
		return clm44;
	}
	public void setClm44(String clm44) {
		this.clm44 = clm44;
	}
	public String getClm45() {
		return clm45;
	}
	public void setClm45(String clm45) {
		this.clm45 = clm45;
	}
	public String getClm46() {
		return clm46;
	}
	public void setClm46(String clm46) {
		this.clm46 = clm46;
	}
	public String getClm47() {
		return clm47;
	}
	public void setClm47(String clm47) {
		this.clm47 = clm47;
	}
	public String getClm48() {
		return clm48;
	}
	public void setClm48(String clm48) {
		this.clm48 = clm48;
	}
	public String getClm49() {
		return clm49;
	}
	public void setClm49(String clm49) {
		this.clm49 = clm49;
	}
	public String getClm50() {
		return clm50;
	}
	public void setClm50(String clm50) {
		this.clm50 = clm50;
	}
	public String getClm51() {
		return clm51;
	}
	public void setClm51(String clm51) {
		this.clm51 = clm51;
	}
	public String getClm52() {
		return clm52;
	}
	public void setClm52(String clm52) {
		this.clm52 = clm52;
	}
	public String getClm53() {
		return clm53;
	}
	public void setClm53(String clm53) {
		this.clm53 = clm53;
	}
	public String getClm54() {
		return clm54;
	}
	public void setClm54(String clm54) {
		this.clm54 = clm54;
	}
	public String getClm55() {
		return clm55;
	}
	public void setClm55(String clm55) {
		this.clm55 = clm55;
	}
	public String getClm56() {
		return clm56;
	}
	public void setClm56(String clm56) {
		this.clm56 = clm56;
	}
	public String getClm57() {
		return clm57;
	}
	public void setClm57(String clm57) {
		this.clm57 = clm57;
	}
	public String getClm58() {
		return clm58;
	}
	public void setClm58(String clm58) {
		this.clm58 = clm58;
	}
	public String getClm59() {
		return clm59;
	}
	public void setClm59(String clm59) {
		this.clm59 = clm59;
	}
	public String getClm60() {
		return clm60;
	}
	public void setClm60(String clm60) {
		this.clm60 = clm60;
	}
	public String getClm61() {
		return clm61;
	}
	public void setClm61(String clm61) {
		this.clm61 = clm61;
	}
	public String getClm62() {
		return clm62;
	}
	public void setClm62(String clm62) {
		this.clm62 = clm62;
	}
	public String getClm63() {
		return clm63;
	}
	public void setClm63(String clm63) {
		this.clm63 = clm63;
	}
	public String getClm64() {
		return clm64;
	}
	public void setClm64(String clm64) {
		this.clm64 = clm64;
	}
	public String getClm65() {
		return clm65;
	}
	public void setClm65(String clm65) {
		this.clm65 = clm65;
	}
	public String getClm66() {
		return clm66;
	}
	public void setClm66(String clm66) {
		this.clm66 = clm66;
	}
	public String getClm67() {
		return clm67;
	}
	public void setClm67(String clm67) {
		this.clm67 = clm67;
	}
	public String getClm68() {
		return clm68;
	}
	public void setClm68(String clm68) {
		this.clm68 = clm68;
	}
	public String getClm69() {
		return clm69;
	}
	public void setClm69(String clm69) {
		this.clm69 = clm69;
	}
	public String getClm70() {
		return clm70;
	}
	public void setClm70(String clm70) {
		this.clm70 = clm70;
	}
	public String getClm71() {
		return clm71;
	}
	public void setClm71(String clm71) {
		this.clm71 = clm71;
	}
	public String getClm72() {
		return clm72;
	}
	public void setClm72(String clm72) {
		this.clm72 = clm72;
	}
	public String getClm73() {
		return clm73;
	}
	public void setClm73(String clm73) {
		this.clm73 = clm73;
	}
	public String getClm74() {
		return clm74;
	}
	public void setClm74(String clm74) {
		this.clm74 = clm74;
	}
	public String getClm75() {
		return clm75;
	}
	public void setClm75(String clm75) {
		this.clm75 = clm75;
	}
	public String getClm76() {
		return clm76;
	}
	public void setClm76(String clm76) {
		this.clm76 = clm76;
	}
	public String getClm77() {
		return clm77;
	}
	public void setClm77(String clm77) {
		this.clm77 = clm77;
	}
	public String getClm78() {
		return clm78;
	}
	public void setClm78(String clm78) {
		this.clm78 = clm78;
	}
	public String getClm79() {
		return clm79;
	}
	public void setClm79(String clm79) {
		this.clm79 = clm79;
	}
	public String getClm80() {
		return clm80;
	}
	public void setClm80(String clm80) {
		this.clm80 = clm80;
	}
	public String getClm81() {
		return clm81;
	}
	public void setClm81(String clm81) {
		this.clm81 = clm81;
	}
	public String getClm82() {
		return clm82;
	}
	public void setClm82(String clm82) {
		this.clm82 = clm82;
	}
	public String getClm83() {
		return clm83;
	}
	public void setClm83(String clm83) {
		this.clm83 = clm83;
	}
	public String getClm84() {
		return clm84;
	}
	public void setClm84(String clm84) {
		this.clm84 = clm84;
	}
	public String getClm85() {
		return clm85;
	}
	public void setClm85(String clm85) {
		this.clm85 = clm85;
	}
	public String getClm86() {
		return clm86;
	}
	public void setClm86(String clm86) {
		this.clm86 = clm86;
	}
	public String getClm87() {
		return clm87;
	}
	public void setClm87(String clm87) {
		this.clm87 = clm87;
	}
	public String getClm88() {
		return clm88;
	}
	public void setClm88(String clm88) {
		this.clm88 = clm88;
	}
	public String getClm89() {
		return clm89;
	}
	public void setClm89(String clm89) {
		this.clm89 = clm89;
	}
	public String getClm90() {
		return clm90;
	}
	public void setClm90(String clm90) {
		this.clm90 = clm90;
	}
	public String getClm91() {
		return clm91;
	}
	public void setClm91(String clm91) {
		this.clm91 = clm91;
	}
	public String getClm92() {
		return clm92;
	}
	public void setClm92(String clm92) {
		this.clm92 = clm92;
	}
	public String getClm93() {
		return clm93;
	}
	public void setClm93(String clm93) {
		this.clm93 = clm93;
	}
	public String getClm94() {
		return clm94;
	}
	public void setClm94(String clm94) {
		this.clm94 = clm94;
	}
	public String getClm95() {
		return clm95;
	}
	public void setClm95(String clm95) {
		this.clm95 = clm95;
	}
	public String getClm96() {
		return clm96;
	}
	public void setClm96(String clm96) {
		this.clm96 = clm96;
	}
	public String getClm97() {
		return clm97;
	}
	public void setClm97(String clm97) {
		this.clm97 = clm97;
	}
	public String getClm98() {
		return clm98;
	}
	public void setClm98(String clm98) {
		this.clm98 = clm98;
	}
	public String getClm99() {
		return clm99;
	}
	public void setClm99(String clm99) {
		this.clm99 = clm99;
	}
	public String getClm100() {
		return clm100;
	}
	public void setClm100(String clm100) {
		this.clm100 = clm100;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
} 