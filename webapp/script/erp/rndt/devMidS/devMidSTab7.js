function fn_setTab7(){
	tab7 = subTabbar.tabs("a7").attachLayout("2E");
	tab7.cells("a").setHeight(190);
    tab7.cells("a").setText("1.수준");
    tab7.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
    tab7.cells("a").attachObject("tab7_1");
    tab7.cells("b").attachObject("tab7_2");
    tab7Toolbar = subToolbar(tab7Toolbar,subTabbar.tabs("a7"),[3,4]);
    tab7Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab7Save();
    	}
    	if(id=="btn4"){
			$('#cudKey7').val('DELETE');
			fn_tab7Save();
    	}
    })
}
function fn_frm7Chk(){
	if($("#frmTab7_1").find("[name=itemName]").val()==""&&
			$("#frmTab7_1").find("[name=techName]").val()==""&&
			$("#frmTab7_1").find("[name=targetMatr]").val()==""&&
			$("#frmTab7_2").find("[name=remarks]").val()==""){
		byId("cudKey7").value = 'INSERT';
	}else{
		byId("cudKey7").value = 'UPDATE';
	}
}
function fn_tab7Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.itemName = $("#frmTab7_1").find("[name=itemName]").val();
    	param.techName = $("#frmTab7_1").find("[name=techName]").val();
    	param.targetMatr = $("#frmTab7_1").find("[name=targetMatr]").val();
    	param.remarks = $("#frmTab7_2").find("[name=remarks]").val();
    	param.cudKey7 = $('#cudKey7').val();
    	param.setDate = dateVal
    	param.setSeq = seqVal
    	
    	console.log("tab7 param = ",param);
    	
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devPlanS/frmTab7Save",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
            	if($('#cudKey7').val()=='DELETE'){
            		byId("cudKey7").value = 'INSERT';
            	}else{
            		byId("cudKey7").value = 'UPDATE';
            	}
            }
        });
    }
}
function fn_selfrmTab7CB_1(data){
	
}
function fn_selfrmTab7CB_2(data){
	
}