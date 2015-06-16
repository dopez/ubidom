var totSum;
var totSum2;
function fn_setTab7(){
	tab7 = new dxGrid(subTabbar.tabs("a7"), false);
	tab7.addHeader({name:"구분",colId:"investKind",width:"100",align:"center",type:"combo"});
	tab7.addHeader({name:"당해년도(천원)",colId:"dhAmt",width:"150",align:"right",type:"edn"});
	tab7.addHeader({name:"Total(천원)",colId:"totAmt",width:"150",align:"right",type:"ron"});
	tab7.addHeader({name:"비고",colId:"remarks",width:"300",align:"center",type:"ed"});
	tab7.atchFooter();
	tab7.addAtchFooter({atchFooterName:"합계"});
	tab7.addAtchFooter({atchFooterName:"#stat_total"});
	tab7.addAtchFooter({atchFooterName:"#stat_total"});
	tab7.atchFooterInit();	
	tab7.setColSort("str");	
	tab7.setUserData("","pk","");
	tab7.init();
	tab7.cs_setColumnHidden(["setDate","setSeq"]);
	tab7.attachEvent("onRowSelect",tab7doOnRowSelect);
	tab7.attachEvent("onCellChanged",tab7doOnCellChanged);
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
var yearval,accVal;
var totalval=0;
var id1;
function tab7doOnCellChanged(rId,cInd,nValue){
	if(cInd==1){
		tab7doOnRowSelect(rId,cInd);
   }
}
function tab7doOnRowSelect(rId,cInd){
	fn_cal(rId,cInd);
}
function fn_cal(rId,cInd){
	var selectedId = tab7.getSelectedRowId();
	var totalRowNum = tab7.getRowsNum();
	if(selectedId==null||typeof selectedId=="undefined"){
		return;
	}
	var dhAmtColIdx = tab7.getColIndexById('dhAmt');
	var totAmtColIdx = tab7.getColIndexById('totAmt');
	if(cInd==1||cInd==2){
		if(0<tab7.getSelectedRowIndex(rId)){
			console.log(tab7.getSelectedRowIndex(rId));
			for(i=tab7.getSelectedRowIndex(rId);i<=totalRowNum-1;i++){
				yearval = tab7.setCells2(i,dhAmtColIdx).getValue()*1;
				totalval = tab7.setCells2(i-1,totAmtColIdx).getValue()*1;
				accVal = yearval+totalval
				tab7.setCells2(i,totAmtColIdx).setValue(accVal);
			}
		}else{
			yearval = tab7.setCells(rId,dhAmtColIdx).getValue()*1;
			var totals = yearval+totalval;
			tab7.setCells(rId,totAmtColIdx).setValue(totals);
			rId = id1
		}
	}
}

/*var id1;
function tab7totalTimeCalcul(id){
	console.log(id);
	console.log(tab7.getSelectedRowIndex(id));
	
	if(typeof id1 == "undefined"||id1==id){
		cal(id);
	}else if(id>id1){
		cal2(id);
	}
}
function cal(id){
	totSum = tab7.setCells(id,2).getValue()*1;
	yearValue = tab7.setCells(id,1).getValue()*1;
	totSum = yearValue+totSum;
	tab7.setCells(id,2).setValue(totSum);
	id1 = id
}
function cal2(id){
	totSum2 = tab7.setCells(id-1,2).getValue()*1;
	yearValue = tab7.setCells(id,1).getValue()*1;
	totSum2 = yearValue+totSum2;
	tab7.setCells(id,2).setValue(totSum2);
	if(totSum<totSum2){
		id1 = id
	}
}*/
/*
function fn_getTotSum(){
	totSum = 0;
	yearValue1 = tab7.setCells(0,1).getValue()*1;
	yearValue2 = tab7.setCells(1,1).getValue()*1;
	yearValue3 = tab7.setCells(2,1).getValue()*1;
	yearValue4 = tab7.setCells(3,1).getValue()*1;
	var row1totSum = totSum+yearValue1;
	var row2totSum = row1totSum+yearValue2;
	var row3totSum = row2totSum+yearValue3;
	var row4totSum = row3totSum+yearValue4;
	tab7.setCells(0,2).setValue(row1totSum);
	tab7.setCells(1,2).setValue(row2totSum);
	tab7.setCells(2,2).setValue(row3totSum);
	tab7.setCells(3,2).setValue(row4totSum);
}*/
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
			         url : "/erp/rndt/good/devPlanS/gridTab7Save",
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
function fn_selgridTab7CB(data){
	
}