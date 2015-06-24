function fn_setTab5(){
	tab5 = subTabbar.tabs("a5").attachLayout("3E");
	tab5.cells("a").setText("1. 적용제품 및 개발선행도");
    tab5.cells("b").setText("2. 특허출원");
    tab5.cells("c").setText("3. 논문발표");
    tab5.cells("a").setHeight(110);
    tab5.cells("b").setHeight(110);
    tab5.cells("a").attachObject("tab5_1");
    tab5.cells("b").attachObject("tab5_2");
    tab5.cells("c").attachObject("tab5_3");
    tab5Toolbar = subToolbar(tab5Toolbar,subTabbar.tabs("a5"),[2,3,4]);
    tab5Toolbar.attachEvent("onClick",function(id){
		if(fn_seqValid()){

    	if(id=="btn2"){
        	fn_init_searchFrmTab5("#planNumb","/erp/rndt/good/devPlanS/selFrmTab");
    	}
    	if(id=="btn3"){
    		fn_tab5Save();
			savecnt5 = 1
    	}
    	if(id=="btn4"){
    		savecnt5 = 2;
			fn_tab5Save();
    		byId("frmTab5_1").reset();
    		byId("frmTab5_2").reset();
    		byId("frmTab5_3").reset();

    		savecnt5 = 0;
    	}
		}
    })
}
var savecnt5;

function fn_frm5Chk(){
	var chkVal = $("#frmTab5_1").find("[name=targetItem]").val();
	var radioVal = $("#frmTab5_1").find("[name=devKind]").val();
	chkVal = chkVal+$("#frmTab5_2").find("[name=cPatentLocal]").val();
	chkVal = chkVal+$("#frmTab5_2").find("[name=cPatentFore]").val();
	chkVal = chkVal+$("#frmTab5_3").find("[name=cPaperLocal]").val();
	chkVal = chkVal+$("#frmTab5_3").find("[name=cPaperFore]").val();
	if(chkVal==""&&radioVal==1){
		savecnt5 = 0;
	}else{
		savecnt5 = 1
	}
}
function fn_tab5Save(){
    if (fn_seqValid()) {
    	var param = {};
    	param.tabId = tabId;
    	param.targetItem = $("#frmTab5_1").find("[name=targetItem]").val();
    	param.devKind = $("#frmTab5_1").find("[name=devKind]").val();
    	param.cPatentLocal = $("#frmTab5_2").find("[name=cPatentLocal]").val();
    	param.cPatentFore = $("#frmTab5_2").find("[name=cPatentFore]").val();
    	param.patentLocal = $("#frmTab5_2").find("[name=patentLocal]").val();
    	param.patentFore = $("#frmTab5_2").find("[name=patentFore]").val();
    	param.cPaperLocal = $("#frmTab5_3").find("[name=cPaperLocal]").val();
    	param.cPaperFore = $("#frmTab5_3").find("[name=cPaperFore]").val();
    	param.paperLocal = $("#frmTab5_3").find("[name=paperLocal]").val();
    	param.paperFore = $("#frmTab5_3").find("[name=paperFore]").val();
    	
    	
    	
        if($("#openParam").val()=="u"||savecnt5==1){
    		byId("cudKey5").value = 'UPDATE';
        }else if(savecnt5==2){
        	byId("cudKey5").value = 'DELETE';
        }else{
    		byId("cudKey5").value = 'INSERT';
        }

        param.cudKey = $('#cudKey5').val();
    	
    	param.setDate = dateVal
    	param.setSeq = seqVal
    	param.planNumb = planNumVal
    	
    	console.log("tab5 param = ",param);
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/good/devRsltS/frmTabSave",
            data: param,
            success: function(data) {
    			fn_searchFrmTab("frmTab5_1","a5");
    			fn_searchFrmTab("frmTab5_2","a5");
    			fn_searchFrmTab("frmTab5_3","a5");
            	MsgManager.alertMsg("INF001");
            }
        });
    }
}
function fn_selfrmTab5CB_1(data){
	
}
function fn_selfrmTab5CB_2(data){
	
}
function fn_init_searchFrmTab5(param,url){
	var gData = [];
	var planNumbVal = $(param).val();
	var obj = {};
	obj.tabId = "a6";
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
           	$("#frmTab5_2,#frmTab5_3").exSetDataInFrom(data[0]);
           	console.log(data[0]);
        }
    });
    return gData;
}