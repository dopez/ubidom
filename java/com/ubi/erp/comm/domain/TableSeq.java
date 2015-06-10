package com.ubi.erp.comm.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("TableSeq")
public class TableSeq implements Serializable {
	private static final long serialVersionUID = 1L;
	private String compId;
	private String tableName;
	private String seqColumn;
	private String dateColumn1;
	private String columnData1;
	private String dateColumn2;
	private String columnData2;
	private String dateColumn3;
	private String columnData3;
	private int returnLen;
	private String seq;

	public TableSeq() {
		super();

	}

	public String getCompId() {
		return compId;
	}

	public void setCompId(String compId) {
		this.compId = compId;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getSeqColumn() {
		return seqColumn;
	}

	public void setSeqColumn(String seqColumn) {
		this.seqColumn = seqColumn;
	}

	public String getDateColumn1() {
		return dateColumn1;
	}

	public void setDateColumn1(String dateColumn1) {
		this.dateColumn1 = dateColumn1;
	}

	public String getColumnData1() {
		return columnData1;
	}

	public void setColumnData1(String columnData1) {
		this.columnData1 = columnData1;
	}

	public String getDateColumn2() {
		return dateColumn2;
	}

	public void setDateColumn2(String dateColumn2) {
		this.dateColumn2 = dateColumn2;
	}

	public String getColumnData2() {
		return columnData2;
	}

	public void setColumnData2(String columnData2) {
		this.columnData2 = columnData2;
	}

	public String getDateColumn3() {
		return dateColumn3;
	}

	public void setDateColumn3(String dateColumn3) {
		this.dateColumn3 = dateColumn3;
	}

	public String getColumnData3() {
		return columnData3;
	}

	public void setColumnData3(String columnData3) {
		this.columnData3 = columnData3;
	}

	public int getReturnLen() {
		return returnLen;
	}

	public void setReturnLen(int returnLen) {
		this.returnLen = returnLen;
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

}
