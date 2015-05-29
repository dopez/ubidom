package com.ubi.erp.cmm.util.gson;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat stringFormat = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat monthDateFormat = new SimpleDateFormat("yyyy/MM");
	SimpleDateFormat monthStringFormat = new SimpleDateFormat("yyyyMM");

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
	
	public String monthToString(String yymm) throws ParseException {
		String orinDate;
		if(yymm ==null || yymm.equals("")){
			orinDate = yymm;
		}else{
		Date date = monthDateFormat.parse(yymm);
		orinDate = monthStringFormat.format(date);
		}
		return orinDate;
	}

}
