package com.ubi.erp.cmm.util.gson;

import java.lang.reflect.Type;
import java.math.BigDecimal;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

/**
 * 
 * @stereotype 
 * @name_ko 
 */

public class BigDecimalDeSerializer implements JsonDeserializer<BigDecimal> {

	/**
	 * Desc :
	 * @Method Name : deserialize
	 * @param arg0
	 * @param arg1
	 * @param arg2
	 * @return
	 * @throws JsonParseException
	 */
	@Override
	public BigDecimal deserialize(JsonElement arg0, Type arg1, JsonDeserializationContext arg2) throws JsonParseException {

		BigDecimal bd=null;

		if (!"".equals(arg0.getAsString().trim())) {
			bd = arg0.getAsBigDecimal();
		}
		return bd;
	}

}
