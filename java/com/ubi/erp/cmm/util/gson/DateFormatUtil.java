package com.ubi.erp.cmm.util.gson;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat stringFormat = new SimpleDateFormat("yyyyMMdd");

	public String dateToString(String stDate) throws ParseException {
		String orinDate;
		if(stDate ==null || stDate.equals("")){
			orinDate = stDate;
		}else{
		Date date = dateFormat.parse(stDate);
		orinDate = stringFormat.format(date);
		}
		return orinDate;
	}

	public String dateToString2(String stDate) throws ParseException {
		String orinDate;
		if(stDate ==null || stDate.equals("")){
			orinDate = stDate;
		}else{
		Date date = stringFormat.parse(stDate);
		orinDate = dateFormat.format(date);
		}
		return orinDate;
	}

}
