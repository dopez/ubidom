function gfn_1col_comboLoad(comboId, params) {
    comboId.setTemplate({
        input: "#interName#",
        columns: [{
            header: "종 류",
            width: 100,
            option: "#interName#"
        }]
    });
    comboId.enableFilteringMode(true);
    comboId.enableAutocomplete(true);
    comboId.allowFreeText(true);
    var obj = {};
    obj.compId = '100';
    obj.code = params;
    $.ajax({
        "url": "/erp/cmm/InterCodeR",
        "type": "post",
        "data": obj,
        "success": function(data) {
            var list = data;
            for (var i = 0; i < list.length; i++) {
                comboId.addOption(list[i].interCode, list[i].interName);
            }
        }
    });
    comboId.attachEvent("onBlur", function(){
        var getValue = comboId.getComboText();
        var getIdx =  comboId.getIndexByValue(getValue);
        if(getIdx == -1){
        	MsgManager.alertMsg("WRN013");
        	comboId.setComboText("");
        }
    });
};

function gfn_single_comboLoad(comboId,value,key,cLength){
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
	       {header: "구분", width: 100,  option: "#interName#"}
	    ]
	});
	for(var i=0;i<cLength;i++){
		comboId.addOption(value[i],key[i]);
	}

comboId.enableFilteringMode(true);
comboId.enableAutocomplete(true);
comboId.allowFreeText(true);

comboId.attachEvent("onBlur", function(){
    var getValue = comboId.getComboText();
    var getIdx =  comboId.getIndexByValue(getValue);
    if(getIdx == -1){
    	MsgManager.alertMsg("WRN013");
    	comboId.setComboText("");
    }
});
}

function gfn_codeLen2_comboLoad(comboId,params){
	comboId.setTemplate({
        input: "#innerName#",
        columns: [
                {header: "코드",width: 100,option: "#innerCode#"},
                {header: "코드명",width: 100,option: "#innerName#"},
                  ]
    });
    comboId.enableFilteringMode(true);
    comboId.enableAutocomplete(true);
    comboId.allowFreeText(true);
    var obj = {};
    obj.innerName='';
    obj.kind = params;
    $.ajax({
        "url": "/erp/pop/len2",
        "type": "post",
        "data": obj,
        "success": function(data) {
            var list = data;
            for (var i = 0; i < list.length; i++) {
                comboId.addOption(list[i].innerCode,
                		{"innerCode":list[i].innerCode,"innerName":list[i].innerName});
            }
        }
    });
    comboId.attachEvent("onBlur", function(){
        var getValue = comboId.getComboText();
        var getIdx =  comboId.getIndexByValue(getValue);
        if(getIdx == -1){
        	MsgManager.alertMsg("WRN013");
        	comboId.setComboText("");
        }
    });
}

function gfn_codeLen4_comboLoad(comboId,params){
	comboId.setTemplate({
        input: "#innerName#",
        columns: [
                {header: "코드",width: 100,option: "#innerCode#"},
                {header: "코드명",width: 100,option: "#innerName#"},
                {header: "규격",width: 100,option: "#spec#"},
                  ]
    });
    comboId.enableFilteringMode(true);
    comboId.enableAutocomplete(true);
    comboId.allowFreeText(true);
    var obj = {};
    obj.innerName='';
    obj.kind = params;
    $.ajax({
        "url": "/erp/pop/len4",
        "type": "post",
        "data": obj,
        "success": function(data) {
            var list = data;
            for (var i = 0; i < list.length; i++) {
                comboId.addOption(list[i].innerCode,
                		{"innerCode":list[i].innerCode,"innerName":list[i].innerName,"spec":list[i].spec});
            }
        }
    });
    comboId.attachEvent("onBlur", function(){
        var getValue = comboId.getComboText();
        var getIdx =  comboId.getIndexByValue(getValue);
        if(getIdx == -1){
        	MsgManager.alertMsg("WRN013");
        	comboId.setComboText("");
        }
    });
}
