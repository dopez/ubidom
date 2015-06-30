package com.ubi.erp.cmm.util;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

public class MakeResponseUtil {

	public static void makeResponse(HttpServletResponse response, String resType, String str) throws IOException {
		response.setContentType("application/" + resType + ";");
		ServletOutputStream sos = response.getOutputStream();
		sos.print(new String(str.getBytes("UTF-8"), "8859_1"));
	}
}
