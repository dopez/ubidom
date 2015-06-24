function fn_setTab7(){
    tab7 = subTabbar.tabs("a7").attachObject("tab7");
    tab7Toolbar = subToolbar(tab7Toolbar,subTabbar.tabs("a7"),[3,4]);
    tab7Toolbar.attachEvent("onClick",function(id){
		if(fn_seqValid()){

    	if(id=="btn3"){
    		fn_tab7Save();
    	}
    	if(id=="btn4"){
    		$('#cudKey7').val('DELETE');
    		fn_tab7Save();
    		byId("frmTab7").reset();
    	}
		}
    })
}
function fn_frm7Chk(){
	if($("#frmTab7").find("[name=contents]").val()==""||$("#frmTab7").find("[name=contents]").val()==null){
		byId("cudKey7").value = 'INSERT';
	}else{
		byId("cudKey7").value = 'UPDATE';
	}
}
function fn_tab7Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.contents = $("#frmTab7").find("[name=contents]").val();
    	param.contentsKind = $("#frmTab7").find("[name=contentsKind]").val();
    	param.cudKey = $('#cudKey7').val();
    	param.setDate = dateVal;
    	param.setSeq = seqVal;
    	param.tabId = tabId;
    	param.planNumb = planNumVal;
   	
    	console.log("tab7 param = ",param);
    	
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devRsltS/frmTabSave",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
    			fn_searchFrmTab("frmTab7","a7");
            	if($('#cudKey7').val()=='DELETE'){
            		byId("cudKey7").value = 'INSERT';
            	}else{
           			byId("cudKey7").value = 'UPDATE';
             	}
            }
        });
    }
}
function fn_selfrmtab7CB(data){
	console.log("frmTab7 data = ",data);
}