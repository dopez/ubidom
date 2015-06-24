function fn_setTab1(){
    tab1 = subTabbar.tabs("a1").attachObject("tab1");
    tab1Toolbar = subToolbar(tab1Toolbar,subTabbar.tabs("a1"),[3,4]);
    tab1Toolbar.attachEvent("onClick",function(id){
		if(fn_seqValid()){

    	if(id=="btn3"){
    		fn_tab1Save();
    	}
    	if(id=="btn4"){
    		$('#cudKey1').val('DELETE');
    		fn_tab1Save();
    	}
		}
    })
}
function fn_frm1Chk(){
	if($("#frmTab1").find("[name=contents]").val()==""||$("#frmTab1").find("[name=contents]").val()==null){
		byId("cudKey1").value = 'INSERT';
	}else{
		byId("cudKey1").value = 'UPDATE';
	}
}
function fn_tab1Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.contents = $("#frmTab1").find("[name=contents]").val();
    	param.evaluateKind = $("#frmTab1").find("[name=evaluateKind]").val();
    	param.cudKey1 = $('#cudKey1').val();
    	param.setDate = dateVal;
    	param.setSeq = seqVal;
    	param.tabId = tabId;
    	param.planNumb = planNumVal;
   	
    	console.log("tab1 param = ",param);
    	
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devMidS/frmTabSave",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
            	if($('#cudKey1').val()=='DELETE'){
            		byId("cudKey1").value = 'INSERT';
            	}else{
           			byId("cudKey1").value = 'UPDATE';
             	}
            }
        });
    }
}
function fn_selfrmtab1CB(data){
	console.log("frmTab1 data = ",data);
}