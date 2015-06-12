function fn_setTab6(){
	tab6 = subTabbar.tabs("a6").attachLayout("3E");
    tab6.cells("a").setText("1. 특허출원");
    tab6.cells("b").setText("2. 논문발표");
    tab6.cells("c").setText("3. 주요개발기술 및 활용계획");
    tab6.cells("a").setHeight(65);
    tab6.cells("b").setHeight(65);
    tab6.cells("a").attachObject("tab6_1");
    tab6.cells("b").attachObject("tab6_2");
    tab6.cells("c").attachObject("tab6_3");
    tab6Toolbar = subToolbar(tab6Toolbar,subTabbar.tabs("a6"),[3,4]);
    tab6Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab6Save();
    	}if(id=="btn4"){
			$('#cudKey6').val('DELETE');
			fn_tab6Save();
    	}
    })
}
function fn_tab6Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.patentLocal = $("#frmTab6_1").find("[name=patentLocal]").val();
    	param.patentFore = $("#frmTab6_1").find("[name=patentFore]").val();
    	param.paperLocal = $("#frmTab6_2").find("[name=paperLocal]").val();
    	param.paperFore = $("#frmTab6_2").find("[name=paperFore]").val();
    	param.remarks = $("#frmTab6_3").find("[name=remarks]").val();
    	param.cudKey6 = $('#cudKey6').val();
    	param.setDate = dateVal
    	param.setSeq = seqVal
    	
    	console.log("tab6 param = ",param);
    	
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/stan/DevPlanS/frmTab6Save",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
            	if($('#cudKey6').val()=='DELETE'){
            		byId("cudKey6").value = 'INSERT';
            	}else{
            		byId("cudKey6").value = 'UPDATE';
            	}
              }
        });
    }
}
