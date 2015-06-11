function fn_setTab5(){
	tab5 = subTabbar.tabs("a5").attachLayout("2E");
	tab5.cells("a").setHeight(65);
    tab5.cells("a").setText("1.수준");
    tab5.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
    tab5.cells("a").attachObject("tab5_1");
    tab5.cells("b").attachObject("tab5_2");
    tab5Toolbar = subToolbar(tab5Toolbar,subTabbar.tabs("a5"),[3,4]);
    tab5Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab5Save();
    	}
    })
}
function fn_tab5Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.itemName = $("#frmTab5_1").find("[name=itemName]").val();
    	param.techName = $("#frmTab5_1").find("[name=techName]").val();
    	param.targetMatr = $("#frmTab5_1").find("[name=targetMatr]").val();
    	param.remarks = $("#frmTab5_2").find("[name=remarks]").val();
    	param.cudKey5 = $('#cudKey5').val();
    	param.setDate = dateVal
    	param.setSeq = seqVal
    	
    	console.log("tab5 param = ",param);
    	
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/stan/DevPlanS/frmTab5Save",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
            	byId("cudKey5").value = 'UPDATE';
                }
        });
    }
}
