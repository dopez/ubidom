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
			savecnt7 = 1
    	}
    	if(id=="btn4"){
    		savecnt7 = 2;
			fn_tab7Save();
    		savecnt7 = 0;
    	}
    })
}
function fn_frm7Chk(){
	if($("#frmTab7_1").find("[name=cItemName]").val()==""&&
			$("#frmTab7_1").find("[name=cTechName]").val()==""&&
			$("#frmTab7_1").find("[name=cTargetMatr]").val()==""){
		savecnt7 = 0;
		}else{
			savecnt7 = 1
		}
}
function fn_tab7Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.itemName = $("#frmTab7_1").find("[name=itemName]").val();
    	param.techName = $("#frmTab7_1").find("[name=techName]").val();
    	param.targetMatr = $("#frmTab7_1").find("[name=targetMatr]").val();
    	param.remarks = $("#frmTab7_2").find("[name=remarks]").val();
    	param.cItemName = $("#frmTab7_1").find("[name=cItemName]").val();
    	param.cTechName =$("#frmTab7_1").find("[name=cTechName]").val();
    	param.cTargetMatr = $("#frmTab7_1").find("[name=cTargetMatr]").val();
        if($("#openParam").val()=="u"||savecnt7==1){
    		byId("cudKey7").value = 'UPDATE';
        }else if(savecnt7==2){
        	byId("cudKey7").value = 'DELETE';
        }else{
    		byId("cudKey7").value = 'INSERT';
        }

        param.cudKey7 = $('#cudKey7').val();
    	
    	param.setDate = dateVal
    	param.setSeq = seqVal
    	param.planNumb = planNumVal
    	
    	console.log("tab7 param = ",param);
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devPlanS/frmTab7Save",
            data: param,
            success: function(data) {
            	MsgManager.alertMsg("INF001");
            }
        });
    }
}
function fn_selfrmTab7CB_1(data){
	
}
function fn_selfrmTab7CB_2(data){
	
}
function fn_init_searchFrmTab7(){
	var gData = [];
	var planNumbVal = $("#planNumb").val();
	var obj = {};
	obj.tabId = "a5";
	obj.setDate = planNumbVal.substr(0,8);
	obj.setSeq = planNumbVal.substr(8,2);
	$.ajax({
        url: "/erp/rndt/good/devPlanS/selFrmTab",
        type: "POST",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
        data: obj,
        async: false,
        dataType: "json",
        beforeSend: function() {},
        success: function(data) {
        	gData = data;
           	$("#frmTab7_1,#frmTab7_2").exSetDataInFrom(data[0]);
           	console.log(data[0]);
        }
    });
    return gData;
}