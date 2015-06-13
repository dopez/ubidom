function fn_setTab7(){
	tab7 = new dxGrid(subTabbar.tabs("a7"), false);
	tab7.addHeader({name:"구분",colId:"investKind",width:"100",align:"center",type:"combo"});
	tab7.addHeader({name:"당해년도(천원)",colId:"dhAmt",width:"150",align:"right",type:"ed"});
	tab7.addHeader({name:"Total(천원)",colId:"totAmt",width:"150",align:"right",type:"ed"});
	tab7.addHeader({name:"비고",colId:"remarks",width:"300",align:"center",type:"ed"});
	tab7.atchFooter();
	tab7.addAtchFooter({atchFooterName:"합계"});
	tab7.addAtchFooter({atchFooterName:"0"});
	tab7.addAtchFooter({atchFooterName:"0"});
	tab7.atchFooterInit();	
	tab7.setColSort("str");	
	tab7.setUserData("","pk","");
	tab7.init();
	tab7.cs_setColumnHidden(["setDate","setSeq"]);
	tab7Toolbar = subToolbar(tab7Toolbar,subTabbar.tabs("a7"),[3,4,5,6]);
	tab7Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab7Save();
    	}
    	if(id=="btn4"){
    		fn_tab7Remove();
    	}
    	if(id=="btn5"){
   			fn_addTab7();
    	}
    })
	combo03 = tab7.getColumnCombo(0);
	combo03.addOption("1","착수");
	combo03.addOption("2","완료");
	combo03.addOption("3","이관");
	combo03.addOption("4","출시");
}
function fn_tab7Remove(){
	var jsonStr = tab7.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
	}else{
		var cudKeyColIdx = tab7.getColIndexById('cudKey');
		tab7.dxObj.forEachRow(function(id) {
		tab7.setCells(id,cudKeyColIdx).setValue('DELETE');
		});
		fn_tab7Save();
		tab7.clearAll();
	}
}
function fn_addTab7(){
  	var totalRowNum = tab7.getRowsNum();
    var totalColNum = tab7.getColumnCount();
    var data = new Array(totalColNum);
    tab7.addRow(data);
    tab7.selectRow(totalRowNum);
}
function fn_tab7Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab7.getColIndexById('setDate');
		var setSeqColIdx = tab7.getColIndexById('setSeq');
		tab7.dxObj.forEachRow(function(id) {
			tab7.setCells(id,setDateColIdx).setValue(dateVal);
			tab7.setCells(id,setSeqColIdx).setValue(seqVal);
		});
		
		var jsonStr = tab7.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			g_dxRules = {planKind : [r_notEmpty]}
			if(gfn_validation("planKind", "구분",1||2||3||4)){
				$("#jsonData7").val(jsonStr);
				var params = $("#frmTab7").serialize();
				$.ajax({
			         url : "/erp/rndt/stan/devPlanS/gridTab7Save",
			         type : "POST",
			         data : params,
			         async : true,
			         success : function(data) {
			            MsgManager.alertMsg("INF001");
			         }
			     });
			}
		}
	}
}