package com.ubi.erp.cmm.util.gson;

import java.lang.reflect.Type;
import java.math.BigDecimal;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtil {
	private static Gson gson;
	private static Gson parseGson;
	
	private JsonUtil() {
        throw new AssertionError( "Can not create Instance!!" );
    }

	/**
	 * Desc : object를 String으로 반환한다.
	 * @Method Name : parseToString
	 * @param svo
	 * @return
	 */
	public static String parseToString(Object svo) {
		return getParseInstance().toJson(svo);
	}
	
	/**
	 * json string을 object로 반환한다.
	 * @name_ko Object?�서
	 * @param json str
	 */
	@SuppressWarnings("unchecked")
	public static Object parseToObject(String str, Class cls){
		return getInstance().fromJson(str, cls);
	}
	
	public static Object parseToObject(String str, Type tp){
		return getInstance().fromJson(str, tp);
	}
	
	private static Gson getParseInstance(){
		if(parseGson == null){	
			GsonBuilder gb = new GsonBuilder();		
			gb.registerTypeAdapter(BigDecimal.class, new BigDecimalSerializer());
			parseGson = gb.create();
		}
		
		return parseGson;
	}
	
	private static Gson getInstance(){
		if(gson == null){	
			GsonBuilder gb = new GsonBuilder();
			gb.registerTypeAdapter(java.sql.Date.class, new DateDeSerializer());
			gb.registerTypeAdapter(BigDecimal.class, new BigDecimalDeSerializer());
			gb.registerTypeAdapter(BigDecimal.class, new BigDecimalSerializer());
			gb.serializeNulls();
			gson = gb.create();
		}
		
		return gson;
	}
}
