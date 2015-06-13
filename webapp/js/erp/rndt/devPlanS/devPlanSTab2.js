function fn_setTab2(){
    tab2 = subTabbar.tabs("a2").attachObject("tab2");
    tab2Toolbar = subToolbar(tab2Toolbar,subTabbar.tabs("a2"),[3,4]);
    tab2Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab2Save();
    	}
    	if(id=="btn4"){
    		$('#cudKey2').val('DELETE');
    		fn_tab2Save();
    	}
    })
}
function fn_tab2Save(){
    if (fn_seqValid()) {
    	
    	var param = {};
    	param.contents = $("#frmTab2").find("[name=contents]").val();
    	param.contentsKind = $("#frmTab2").find("[name=contentsKind]").val();
    	param.cudKey2 = $('#cudKey2').val();
    	param.setDate = dateVal;
    	param.setSeq = seqVal;
    	param.gubn = "gubn";
    	
    	console.log("tab2 param = ",param);
    	
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devPlanS/frmTab1Save",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
            	if($('#cudKey2').val()=='DELETE'){
            		byId("cudKey2").value = 'INSERT';
            	}else{
            		byId("cudKey2").value = 'UPDATE';
            	}
               }
        });
    }
}