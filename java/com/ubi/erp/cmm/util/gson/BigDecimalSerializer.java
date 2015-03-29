package com.ubi.erp.cmm.util.gson;

import java.lang.reflect.Type;
import java.math.BigDecimal;

import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

/**
 * 
 * @stereotype 
 * @name_ko 
 */

public class BigDecimalSerializer implements JsonSerializer<BigDecimal> {
	/**
	 * Desc : 
	 * @Method Name : serialize
	 * @param arg0
	 * @param arg1
	 * @param arg2
	 * @return
	 */
	@Override
	public JsonElement serialize(BigDecimal arg0, Type arg1,
			JsonSerializationContext arg2) {
		
		if(arg0 == null){
			return new JsonPrimitive("");
		}		
		
		return new JsonPrimitive(arg0.toString());
	}
}
