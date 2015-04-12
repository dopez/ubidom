<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/common/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/common/js/json.js"></script>
<script language=javascript>
function fn_chk() {
	var uid = $("#uid").val();
	if(uid=="") {
		alert("아이디를 입력하세요");
		return;
	}
	
	var passwd = $("#passwd").val();
	if(passwd=="") {
		alert("패스워드를 입력하세요");
		return;
	}
	
	var req = $.ajax({
		url: "/login",
		data: $("#frm").serialize(),
		type: "post",
		dataType: "json"
	});
	req.done(function(data) {
		if(data.rtnCode == "1") {
			location.replace("/erp/main.do");
		} else {
			alert("계정정보를 확인해주세요")
		}
	});
}
</script>
</head>
<body topmargin="300" leftmargin="20" onload="frm.uid.focus();">
<form id="frm" name="frm" method="post">
<table align="center">
<tr><td style="font-size:13px">##아이디</td><td><input type="text" id="uid" name="uid" value="B0102" autocomplete="off" style="width:200px"></td></tr>
<tr><td style="font-size:13px">패스워드</td><td><input type="password" id="passwd" name="passwd" value="B0102" autocomplete="off" style="width:200px" onKeyPress="if(event.keyCode==13) { fn_chk(); }"></td></tr>
<tr><td>&nbsp;</td><td><input type="button" value="로그인" style="width:200px" onClick="javascript:fn_chk();" /></td></tr>
</table>
</form>
</body>
</html>