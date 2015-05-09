package com.ubi.erp.user.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("Menu")
public class Menu implements Serializable {

	private static final long serialVersionUID = 1L;

	private String menucd;

	private String pmenucd;

	private String menuname;

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
}
