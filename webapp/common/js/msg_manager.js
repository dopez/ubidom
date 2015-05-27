__msgLib = {};

$.getJSON("/common/js/msg.json", function(json) {
	__msgLib = json;
	MsgManager = new MsgManager();
});

MsgManager = function(){
	this.init();
};
MsgManager.prototype = {
	init : function(){		
	},
	getReplaceParam : function(msgCd, repList){
		// 메시지 내의 변수를 Param으로 치환
		var msg = eval("__msgLib." + msgCd);
		
		if(msg != null){
			if(repList != undefined && repList != null){
				if(repList.indexOf(";")==-1){
					msg = msg.split('{0}').join(repList);
				} else {
					$.each(repList, function(i, v){
						msg = msg.split('{' + i + '}').join(v);
					});
				}
			}
		}
		return msg;
	},		
	getMsg : function(msgCd, repList){
		//메시지를 반환
		return this.getReplaceParam(msgCd, repList);		
	},
	alertMsg : function(msgCd, repList){
		//메시지를 alert로 표시
		dhtmlx.alert(this.getMsg(msgCd, repList));
	},
	confirmMsg : function(msgCd, repList){
		//메시지를 confirm으로 표시
		return confirm(this.getMsg(msgCd, repList));
		/*
		return dhtmlx.confirm({
			title:"알 림",
			ok:"네", cancel:"아니오",
			text:this.getMsg(msgCd, repList)
		});
		*/
	},
	isMsgExists : function(msgCd){
		//메시지 존재여부를 반환
		return gfn_nvl2(eval("__msgLib." + msgCd), false, true);
	},
	formAlertMsg : function(message,frmName,inputName){
		dhtmlx.alert(message, function(result){
			document.forms[frmName].elements[inputName].focus();
		});
	}
};

