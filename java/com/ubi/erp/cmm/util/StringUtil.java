package com.ubi.erp.cmm.util;

public class StringUtil {
	
	public static boolean isNull(String str) {

		if (str == null) {
			return true;
		}
		
		String strRet = str.replaceAll(" ", "");
		if (strRet.length() <= 0) {
			return true;
		}
		
		return false;
	}
	
	public static String nullCheck(String stOrigin) {
		
        String stReturn = "";
        
        if (stOrigin == null){
            stReturn = "";
        } else {
            stReturn = stOrigin;
        }

        return stReturn;
    }
	
	public static String initStr(String stOrigin, String initData) {
		
        String stReturn = "";
        
        if (stOrigin == null || stOrigin.length() <= 0 || "".equals(stOrigin)){
            if (initData == null || initData.length() <= 0 ) {
                stReturn = "";
            } else {
                stReturn = initData;
            }
        } else {
            stReturn = stOrigin;
        }

        return stReturn;
    }
	
	public static String nullCheckAndReplaceChar(String stOrigin) {
		
        String stReturn = "";
        
        if (stOrigin == null){
            return "";
        } else {
            stReturn = stOrigin;
        }


        stReturn = stReturn.replaceAll("&", "&amp");
        stReturn = stReturn.replaceAll("<", "&lt");
        stReturn = stReturn.replaceAll(">", "&gt");
        stReturn = stReturn.replaceAll("\"", "&quot");
        
        return stReturn;
    }
	
	public static String nullCheckAndReplaceChar(String stOrigin, String initData) {
		
        String stReturn = "";
        
        if (stOrigin == null){
            if (initData == null || initData.length() <= 0 ) {
                stReturn = "";
            } else {
                stReturn = initData;
            }
        } else {
            stReturn = stOrigin;
        }

        stReturn = stReturn.replaceAll("&", "&amp");
        stReturn = stReturn.replaceAll("<", "&lt");
        stReturn = stReturn.replaceAll(">", "&gt");
        stReturn = stReturn.replaceAll("\"", "&quot");
        
        return stReturn;
    }
	
	
	public static String replaceQuote(String str) {
		
	    String strRet = "";
		if((str.startsWith("\"") && str.endsWith("\"")) || (str.startsWith("\'") && str.endsWith("\'"))) {
		    strRet = str.substring(1, str.length()-1);
		}
		return strRet;
	}
	
	public static String replaceJsLen(String str){

		String retStr = str;

		//retStr = retStr.replaceAll("\\\\", "/");	
		retStr = retStr.replaceAll("\n", "\\n");	//줄바꿈기호
		retStr = retStr.replaceAll("\"", "\\\\\"");	//더블쿼테이션
		
		
	  /*  String[] filter_word = {"","\\.","\\?","\\/","\\~","\\!","\\@","\\#","\\$","\\%","\\^","\\&","\\*","\\(","\\)","\\_","\\+","\\=","\\|","\\\\","\\}","\\]","\\{","\\[","\\\"","\\'","\\:","\\;","\\<","\\,","\\>","\\.","\\?","\\/"};
	    
	    for(int i=0;i<filter_word.length;i++){
	    	
	    	if (filter_word.equals("\n")) {	//줄바꿈기호
	    		str = str.replaceAll(filter_word[i],"\\n");
	    	} else if (filter_word.equals("\"")) {	//더블쿼테이션
	    		str = str.replaceAll(filter_word[i],"\\\\\"");
	    	} else {
	    		//str = str.replaceAll(filter_word[i],"");
	    	}
	    }*/
	    return retStr;
	}
	
	public static String cleanXSS(String value) {
	    value = value.replaceAll("<", "").replaceAll(">", "");
	    value = value.replaceAll("\\(", "").replaceAll("\\)", "");
	    value = value.replaceAll("'", "");
	    value = value.replaceAll("eval\\((.*)\\)", "");
	    value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "");
	    value = value.replaceAll("script", "");
	    
	    return value;
	}
	
}
