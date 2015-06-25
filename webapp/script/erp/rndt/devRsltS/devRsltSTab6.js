var combo04;
function fn_setTab6(){
	tab6 = new dxGrid(subTabbar.tabs("a6"), false);
	tab6.addHeader({name:"항목",colId:"investKind",width:"100",align:"center",type:"combo"});
	tab6.addHeader({name:"계획",colId:"planAmt",width:"200",align:"right",type:"edn"});
	tab6.addHeader({name:"실적",colId:"cPlanAmt",width:"200",align:"right",type:"edn"});
	tab6.atchFooter();
	tab6.addAtchFooter({atchFooterName:"합계"});
	tab6.addAtchFooter({atchFooterName:"#stat_total"});
	tab6.addAtchFooter({atchFooterName:"#stat_total"});
	tab6.atchFooterInit();
	tab6.dxObj.enableMathEditing(true);
	tab6.setColSort("str");	
	tab6.setUserData("","pk","investKind");
	
	tab6.init();
	tab6.cs_setColumnHidden(["planNumb","setDate","setSeq"]);
	tab6Toolbar = subToolbar(tab6Toolbar,subTabbar.tabs("a6"),[3,4,5,6]);
	tab6Toolbar.attachEvent("onClick",function(id){
		if(fn_seqValid()){
			if(id=="btn3"){
				fn_tab6Save();
			}
			if(id=="btn4"){
				fn_tab6Remove();
			}
			if(id=="btn5"){
				fn_addTab6();
			}
			if(id=="btn6"){
	    	    var rodid = tab6.getSelectedRowId();
	    	    tab6.cs_deleteRow(rodid);
			}
		}
    })
	combo04 = tab6.getColumnCombo(0);
	combo04.addOption("1","개발기간");
	combo04.addOption("2","목표재료비");
	combo04.addOption("3","시설투자비");
	combo04.addOption("4","시험연구비");
	combo04.addOption("5","인건비");
	combo04.addOption("6","경비");
	combo04.addOption("7","투입MM");
	
}
function fn_selGridTab6(){
    var obj={};
    obj.setDate = dateVal;
    obj.setSeq = seqVal;
    gfn_callAjaxForGrid(tab6,obj,"selGridTab6",subTabbar.tabs("a6"));
}
function fn_addTab6(){
  	var totalRowNum = tab6.getRowsNum();
    var totalColNum = tab6.getColumnCount();
    var data = new Array(totalColNum);
    tab6.addRow(data);
    tab6.selectRow(totalRowNum);
}
function fn_tab6Remove(){
	var jsonStr = tab6.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
	}else{
		var cudKeyColIdx = tab6.getColIndexById('cudKey');
		tab6.dxObj.forEachRow(function(id) {
	        tab6.setCells(id,cudKeyColIdx).setValue('DELETE');
		});
		fn_tab6Save();
		tab6.clearAll();
	}
}
var savecnt=0;
function fn_tab6Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab6.getColIndexById('setDate');
		var setSeqColIdx = tab6.getColIndexById('setSeq');
		var planNumbIdx = tab6.getColIndexById('planNumb');
		var cudKeyColIdx = tab6.getColIndexById('cudKey');
		tab6.dxObj.forEachRow(function(id) {
	        tab6.setCells(id,setDateColIdx).setValue(dateVal);
	        tab6.setCells(id,setSeqColIdx).setValue(seqVal);
	        tab6.setCells(id,planNumbIdx).setValue(planNumVal);
		});
    	
		var jsonStr = tab6.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			$("#jsonData6").val(jsonStr);
			console.log(jsonStr);
			$("input[name='tabId']").val(tabId);
			var params = $("#frmTab6").serialize();
			$.ajax({
		         url : "/erp/rndt/good/devRsltS/gridTab6Save",
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
function fn_selgridTab6CB(data){
	console.log("tab6",data);
}