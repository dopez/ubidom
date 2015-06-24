function fn_setTab4(){
	tab4 = subTabbar.tabs("a4").attachLayout("2E");
	tab4.cells("a").setHeight(190);
    tab4.cells("a").setText("1.수준");
    tab4.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
    tab4.cells("a").attachObject("tab4_1");
    tab4.cells("b").attachObject("tab4_2");
    tab4Toolbar = subToolbar(tab4Toolbar,subTabbar.tabs("a4"),[2,3,4]);
    tab4Toolbar.attachEvent("onClick",function(id){
		if(fn_seqValid()){

    	if(id=="btn2"){
	    		if($(':radio[name="midevalKind"]:checked').val()=="0"){
	    			/*중간평가번호가 없을 때는 개발계획 테이블에서 셀렉트 해온 후 중간평가테이블에 저장한다.*/
		        	fn_init_searchFrmTab4("#planNumb","/erp/rndt/good/devPlanS/selFrmTab");
	    		}else{
	    			/*중간평가번호가 있을 때에는 c_컬럼을 계획 컬럼으로 불러온 후 저장한다.*/
	    			fn_init_searchFrmTab4("#planNumb","/erp/rndt/good/devRsltS/selInitTab4");
	    		}
	    		//fn_saveChangeTab4();

    	}
    	if(id=="btn3"){
    		fn_tab4Save();
			savecnt4 = 1
    	}
    	if(id=="btn4"){
    		savecnt4 = 2;
			fn_tab4Save();
    		byId("frmTab4_1").reset();
    		byId("frmTab4_2").reset();
    		savecnt4 = 0;
    	}
		}
    })
}
var savecnt4;
function fn_saveChangeTab4(){
	var param = {};
	param.tabId = tabId;
	param.itemName = $("#frmTab4_1").find("[name=itemName]").val();
	param.techName = $("#frmTab4_1").find("[name=techName]").val();
	param.targetMatr = $("#frmTab4_1").find("[name=targetMatr]").val();
	param.remarks = $("#frmTab4_2").find("[name=remarks]").val();
	param.cItemName = $("#frmTab4_1").find("[name=cItemName]").val();
	param.cTechName =$("#frmTab4_1").find("[name=cTechName]").val();
	param.cTargetMatr = $("#frmTab4_1").find("[name=cTargetMatr]").val();
    param.cudKey = 'INSERT';
	param.setDate = dateVal
	param.setSeq = seqVal
	param.planNumb = planNumVal
	console.log("tab4 param = ",param);
    $.ajax({
        type: 'POST',
        url: "/erp/rndt/good/devMidS/frmTabSave",
        data: param,
        success: function(data) {
        }
    });
}
function fn_frm4Chk(){
	if($("#frmTab4_1").find("[name=cItemName]").val()==""&&
			$("#frmTab4_1").find("[name=cTechName]").val()==""&&
			$("#frmTab4_1").find("[name=cTargetMatr]").val()==""){
		savecnt4 = 0;
		}else{
			savecnt4 = 1
		}
}
function fn_tab4Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.tabId = tabId;
    	param.itemName = $("#frmTab4_1").find("[name=itemName]").val();
    	param.techName = $("#frmTab4_1").find("[name=techName]").val();
    	param.targetMatr = $("#frmTab4_1").find("[name=targetMatr]").val();
    	param.remarks = $("#frmTab4_2").find("[name=remarks]").val();
    	param.cItemName = $("#frmTab4_1").find("[name=cItemName]").val();
    	param.cTechName =$("#frmTab4_1").find("[name=cTechName]").val();
    	param.cTargetMatr = $("#frmTab4_1").find("[name=cTargetMatr]").val();
        if($("#openParam").val()=="u"||savecnt4==1){
    		byId("cudKey4").value = 'UPDATE';
        }else if(savecnt4==2){
        	byId("cudKey4").value = 'DELETE';
        }else{
    		byId("cudKey4").value = 'INSERT';
        }

        param.cudKey = $('#cudKey4').val();
    	
    	param.setDate = dateVal
    	param.setSeq = seqVal
    	param.planNumb = planNumVal
    	
    	console.log("tab4 param = ",param);
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devRsltS/frmTabSave",
            data: param,
            success: function(data) {
    			fn_searchFrmTab("frmTab4_1","a4");
    			fn_searchFrmTab("frmTab4_2","a4");
            	MsgManager.alertMsg("INF001");
            }
        });
    }
}
function fn_selfrmTab4CB_1(data){
	
}
function fn_selfrmTab4CB_2(data){
	
}
function fn_init_searchFrmTab4(param,url){
	var gData = [];
	var planNumbVal = $(param).val();
	var obj = {};
	obj.tabId = "a5";
	obj.setDate = planNumbVal.substr(0,8);
	obj.setSeq = planNumbVal.substr(8,2);
	$.ajax({
        url: url,
        type: "POST",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', // default content type (mime-type)
        data: obj,
        async: false,
        dataType: "json",
        beforeSend: function() {},
        success: function(data) {
        	gData = data;
           	$("#frmTab4_1,#frmTab4_2").exSetDataInFrom(data[0]);
           	console.log(data[0]);
        }
    });
    return gData;
}