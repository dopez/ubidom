function fn_setTab4(){
    tab4 = subTabbar.tabs("a4").attachObject("tab4");
    tab4Toolbar = subToolbar(tab4Toolbar,subTabbar.tabs("a4"),[3,4]);
    tab4Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab4Save();
    	}
    	if(id=="btn4"){
    		$('#cudKey4').val('DELETE');
    		fn_tab4Save();
    	}
    })
}
function fn_frm4Chk(){
	if($("#frmTab4").find("[name=contents]").val()==""||$("#frmTab4").find("[name=contents]").val()==null){
		byId("cudKey4").value = 'INSERT';
	}else{
		byId("cudKey4").value = 'UPDATE';
	}
}
function fn_tab4Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.contents = $("#frmTab4").find("[name=contents]").val();
    	param.evaluateKind = $("#frmTab4").find("[name=evaluateKind]").val();
    	param.cudKey = $('#cudKey4').val();
    	param.setDate = dateVal;
    	param.setSeq = seqVal;
    	param.tabId = tabId;
    	param.planNumb = planNumVal;
   	
    	console.log("tab4 param = ",param);
    	
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devMidS/frmTabSave",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
            	if($('#cudKey4').val()=='DELETE'){
            		byId("cudKey4").value = 'INSERT';
            	}else{
           			byId("cudKey4").value = 'UPDATE';
             	}
            }
        });
    }
}
function fn_selfrmTab4CB(data){
	console.log("frmTab4 data = ",data);
}