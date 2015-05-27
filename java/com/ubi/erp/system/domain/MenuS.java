package com.ubi.erp.system.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("MenuS")
public class MenuS implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String cudKey;
	
	private String compId;
	
	private String menucd;

	private String menugbn;

	private String pmenucd;

	private String menuname;
	
	private String agValue;
	
	private String seq;

	private String exegbn;
	
	private String scrnParm;

	private String uri;
	
	private String logid;
	
	private String personname;
	
	private String multicd;
	
	private String pname;
	
	private String groupgbn;
	
	private String modauthority;
	
	private String prnauthority;
	
	public String getMenucd() {
		return menucd;
	}

	public void setMenucd(String menucd) {
		this.menucd = menucd;
	}

	public String getPmenucd() {
		return pmenucd;
	}

	public void setPmenucd(String pmenucd) {
		this.pmenucd = pmenucd;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public String getExegbn() {
		return exegbn;
	}

	public void setExegbn(String exegbn) {
		this.exegbn = exegbn;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getMenugbn() {
		return menugbn;
	}

	public void setMenugbn(String menugbn) {
		this.menugbn = menugbn;
	}

	public String getAgValue() {
		return agValue;
	}

	public void setAgValue(String agValue) {
		this.agValue = agValue;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
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

	public String getScrnParm() {
		return scrnParm;
	}

	public void setScrnParm(String scrnParm) {
		this.scrnParm = scrnParm;
	}

	public String getLogid() {
		return logid;
	}

	public void setLogid(String logid) {
		this.logid = logid;
	}

	public String getPersonname() {
		return personname;
	}

	public void setPersonname(String personname) {
		this.personname = personname;
	}

	public String getMulticd() {
		return multicd;
	}

	public void setMulticd(String multicd) {
		this.multicd = multicd;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getGroupgbn() {
		return groupgbn;
	}

	public void setGroupgbn(String groupgbn) {
		this.groupgbn = groupgbn;
	}

	public String getModauthority() {
		return modauthority;
	}

	public void setModauthority(String modauthority) {
		this.modauthority = modauthority;
	}

	public String getPrnauthority() {
		return prnauthority;
	}

	public void setPrnauthority(String prnauthority) {
		this.prnauthority = prnauthority;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public MenuS() {
		super();
	}

	public MenuS(String cudKey, String compId, String menucd, String menugbn,
			String pmenucd, String menuname, String agValue, String seq,
			String exegbn, String scrnParm, String uri, String logid,
			String personname, String multicd, String pname, String groupgbn,
			String modauthority, String prnauthority) {
		super();
		this.cudKey = cudKey;
		this.compId = compId;
		this.menucd = menucd;
		this.menugbn = menugbn;
		this.pmenucd = pmenucd;
		this.menuname = menuname;
		this.agValue = agValue;
		this.seq = seq;
		this.exegbn = exegbn;
		this.scrnParm = scrnParm;
		this.uri = uri;
		this.logid = logid;
		this.personname = personname;
		this.multicd = multicd;
		this.pname = pname;
		this.groupgbn = groupgbn;
		this.modauthority = modauthority;
		this.prnauthority = prnauthority;
	}
}
