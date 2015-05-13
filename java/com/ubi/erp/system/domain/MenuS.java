package com.ubi.erp.system.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("MenuS")
public class MenuS implements Serializable {

	private static final long serialVersionUID = 1L;

	private String menucd;

	private String menugbn;

	private String pmenucd;

	private String menuname;
	
	private String agValue;
	
	private String seq;

	private String exegbn;

	private String uri;
	

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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public MenuS() {
		super();
	}

	public MenuS(String menucd, String menugbn, String pmenucd,
			String menuname, String agValue, String seq, String exegbn,
			String uri) {
		super();
		this.menucd = menucd;
		this.menugbn = menugbn;
		this.pmenucd = pmenucd;
		this.menuname = menuname;
		this.agValue = agValue;
		this.seq = seq;
		this.exegbn = exegbn;
		this.uri = uri;
	}
}
