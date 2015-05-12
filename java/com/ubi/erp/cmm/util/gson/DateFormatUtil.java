package com.ubi.erp.cmm.util.gson;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat stringFormat = new SimpleDateFormat("yyyyMMdd");

	public String dateToString(String stDate) throws ParseException {
		Date date = dateFormat.parse(stDate);
		String orinDate = stringFormat.format(date);
		return orinDate;
	}

	public String dateToString2(String stDate) throws ParseException {
		Date date = stringFormat.parse(stDate);
		String orinDate = dateFormat.format(date);
		return orinDate;
	}

}
