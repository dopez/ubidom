function fn_setTab3(){
    tab3 = subTabbar.tabs("a3").attachObject("tab3");
    tab3Toolbar = subToolbar(tab3Toolbar,subTabbar.tabs("a3"),[3,4]);
    tab3Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab3Save();
    	}
    	if(id=="btn4"){
    		$('#cudKey3').val('DELETE');
    		fn_tab3Save();
    	}
    })
}
function fn_frm3Chk(){
	if($("#frmTab3").find("[name=contents]").val()==""||$("#frmTab3").find("[name=contents]").val()==null){
		byId("cudKey3").value = 'INSERT';
	}else{
		byId("cudKey3").value = 'UPDATE';
	}
}
function fn_tab3Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.contents = $("#frmTab3").find("[name=contents]").val();
    	param.evaluateKind = $("#frmTab3").find("[name=evaluateKind]").val();
    	param.cudKey = $('#cudKey3').val();
    	param.setDate = dateVal;
    	param.setSeq = seqVal;
    	param.tabId = tabId;
    	param.planNumb = planNumVal;
   	
    	console.log("tab3 param = ",param);
    	
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devMidS/frmTabSave",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
            	if($('#cudKey3').val()=='DELETE'){
            		byId("cudKey3").value = 'INSERT';
            	}else{
           			byId("cudKey3").value = 'UPDATE';
             	}
            }
        });
    }
}
/*function fn_selfrmTab3CB(data){
	console.log(data);
}*/