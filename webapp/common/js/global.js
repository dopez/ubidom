
//####################### Javascript global settings #######################//

$(function(){	
	$(document).ajaxComplete(function(event, xhr, settings){
		if(xhr.getResponseHeader("EXCEPTION")=="Y") {
			var exObj = JSON.parse(xhr.responseText);
			alert(MsgManager.getMsg(exObj.EXCEPTION_MSG_CODE, exObj.EXCEPTION_MSG_PARAM));
		}
	});
	
	$(document).ajaxError(function(e, xhr, settings, exception) {			
		if(xhr.status == 0){
			return;
		} else if(xhr.status == 401) {	// 세션이 없을 경우
			ExceptionUtil.errorNoLogin(settings);
		} else if(xhr.status == 403) {	// 권한이 없을 경우
			ExceptionUtil.errorNoAuthorize(settings);
		} else if(xhr.status == 404) {	// 잘못된 URL 요청
			//ExceptionUtil.errorPageNotFound(settings);
		} else { // 서버오류
			//ExceptionUtil.errorInternalError(settings);
		}
	});	
});

var ExceptionUtil = {
	errorNoLogin : function() {
		MsgManager.alertMsg("ERR000");
		top.location.replace = "/login.jsp";
	},
	errorNoAuthorize : function() {
		MsgManager.alertMsg("ERR001");
	},
	errorInternalError : function(settings) {
		MsgManager.alertMsg("ERR002");
	},
	errorPageNotFound : function() {
		MsgManager.alertMsg("ERR006");
	}
};