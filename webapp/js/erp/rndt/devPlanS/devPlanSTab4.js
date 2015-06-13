function fn_setTab4(){
	tab4 = new dxGrid(subTabbar.tabs("a4"), false);
	tab4.addHeader({name:"구분",colId:"dataKind",width:"100",align:"center",type:"combo"});
	tab4.addHeader({name:"당해년도",colId:"staff",width:"50",align:"center",type:"ed"});
	tab4.addHeader({name:"#cspan",colId:"mm",width:"50",align:"center",type:"ed"});
	tab4.addHeader({name:"Total(MM)",colId:"totMm",width:"150",align:"center",type:"ed"});
	tab4.addHeader({name:"비고",colId:"remarks",width:"500",align:"center",type:"ed"});
	tab4.setColSort("str");	
	tab4.setUserData("","pk","");
	tab4.atchHeader();
	tab4.addAtchHeader({atchHeaderName:"#rspan"});
	tab4.addAtchHeader({atchHeaderName:"인원"});
	tab4.addAtchHeader({atchHeaderName:"MM"});
	tab4.addAtchHeader({atchHeaderName:"#rspan"});
	tab4.addAtchHeader({atchHeaderName:"#rspan"});
	tab4.atchHeaderInit();
	tab4.atchFooter();
	tab4.addAtchFooter({atchFooterName:"합계"});
	tab4.addAtchFooter({atchFooterName:""});
	tab4.addAtchFooter({atchFooterName:""});
	tab4.addAtchFooter({atchFooterName:""});
	tab4.atchFooterInit();	
	tab4.init();
	tab4.cs_setColumnHidden(["setDate","setSeq"]);
	tab4Toolbar = subToolbar(tab4Toolbar,subTabbar.tabs("a4"),[3,4,5,6]);
	tab4Toolbar.attachEvent("onClick",fn_tab4Btn)
	combo02 = tab4.getColumnCombo(0);
	combo02.addOption("1","착수");
	combo02.addOption("2","완료");
	combo02.addOption("3","이관");
	combo02.addOption("4","출시");
}
function fn_tab4Btn(id){
	if(id=="btn3"){
		fn_tab4Save();
	}
	if(id=="btn4"){
		fn_tab4Remove();
	}
	if(id=="btn5"){
		fn_addTab4();
	}
	if(id=="btn6"){
	    var selectedId = tab4.getSelectedRowId();
	    console.log(selectedId);
		tab4.cs_deleteRow(selectedId);
	}
}
function fn_tab4Remove(){
	var jsonStr = tab4.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
	}else{
		var cudKeyColIdx = tab4.getColIndexById('cudKey');
		tab4.dxObj.forEachRow(function(id) {
		tab4.setCells(id,cudKeyColIdx).setValue('DELETE');
		});
		fn_tab4Save();
		tab4.clearAll();
	}
}
function fn_addTab4(){
  	var totalRowNum = tab4.getRowsNum();
    var totalColNum = tab4.getColumnCount();
    var data = new Array(totalColNum);
    tab4.addRow(data);
    tab4.selectRow(totalRowNum);
}
function fn_tab4Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab4.getColIndexById('setDate');
		var setSeqColIdx = tab4.getColIndexById('setSeq');
		tab4.dxObj.forEachRow(function(id) {
			tab4.setCells(id,setDateColIdx).setValue(dateVal);
			tab4.setCells(id,setSeqColIdx).setValue(seqVal);
		});
		
		var jsonStr = tab4.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			g_dxRules = {dataKind : [r_notEmpty]}
			if(gfn_validation("dataKind", "구분",1||2||3||4)){
				$("#jsonData4").val(jsonStr);
				var params = $("#frmTab4").serialize();
				$.ajax({
			         url : "/erp/rndt/stan/devPlanS/gridTab4Save",
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