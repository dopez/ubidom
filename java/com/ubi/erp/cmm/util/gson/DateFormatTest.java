package com.ubi.erp.cmm.util.gson;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatTest {
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat stringFormat = new SimpleDateFormat("yyyyMMdd");

	public Date dateFormat(String stDate) throws ParseException {
		Date date = dateFormat.parse(stDate);
		return date;
	}

	public String dateToString(Date date) {
		String stDate = stringFormat.format(date);
		return stDate;
	}

	public String dateToString2(Date date) {
		String stDate = dateFormat.format(date);
		return stDate;
	}

}
