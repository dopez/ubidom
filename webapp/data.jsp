<%
StringBuffer sb = new StringBuffer("[");

sb.append(" { \"id\": \"1\", \"country\": \"USA\", \"state\": \"Texas\",      \"city\": \"Houston\",       \"attraction\": \"NASA\",               \"zip\": \"77058\"},");
sb.append("	{ \"id\": \"2\", \"country\": \"USA\", \"state\": \"Texas\",      \"city\": \"Houston\",       \"attraction\": \"6th street\",         \"zip\": \"78704\"},");
sb.append("	{ \"id\": \"3\", \"country\": \"USA\", \"state\": \"Texas\",      \"city\": \"Arlinton\",      \"attraction\": \"Cowboys Stadium\",    \"zip\": \"76011\"},");
sb.append("	{ \"id\": \"4\", \"country\": \"USA\", \"state\": \"Texas\",      \"city\": \"Plano\",         \"attraction\": \"XYZ place\",          \"zip\": \"54643\"},");
sb.append("	{ \"id\": \"5\", \"country\": \"USA\", \"state\": \"Texas\",      \"city\": \"Dallas\",        \"attraction\": \"Reunion tower\",      \"zip\": \"12323\"},");
sb.append("	{ \"id\": \"6\", \"country\": \"USA\", \"state\": \"California\", \"city\": \"Los Angeles\",   \"attraction\": \"Hollywood\",          \"zip\": \"65456\"},");
sb.append("	{ \"id\": \"7\", \"country\": \"USA\", \"state\": \"California\", \"city\": \"San Diego\", 	   \"attraction\": \"Golden Gate\", 	   \"zip\": \"94129\"},");
sb.append("	{ \"id\": \"8\", \"country\": \"USA\", \"state\": \"California\", \"city\": \"San Diego\",     \"attraction\": \"See world\",          \"zip\": \"56653\"},");
sb.append("	{ \"id\": \"9\", \"country\": \"USA\", \"state\": \"California\", \"city\": \"Anaheim\",       \"attraction\": \"Disneyworld\",        \"zip\": \"92802\"}]");

response.setContentType("application/json;");
ServletOutputStream sos = response.getOutputStream();
sos.print(new String(sb.toString().getBytes("UTF-8"), "8859_1"));
%>