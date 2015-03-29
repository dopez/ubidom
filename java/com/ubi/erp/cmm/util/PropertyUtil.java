package com.ubi.erp.cmm.util;

import java.util.ResourceBundle;

public class PropertyUtil {
    
    private static ResourceBundle bundle = ResourceBundle.getBundle("context");
    
    private PropertyUtil() {
        
    }
    
    public static String getString(String key) {
        return bundle.getString(key);
    }
}