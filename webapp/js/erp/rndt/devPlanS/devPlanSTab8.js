function fn_setTab8(){
	tab8 = subTabbar.tabs("a8").attachLayout("1C");
	tab8.cells("a").hideHeader();
	tab8Grid = new dxGrid(tab8.cells("a"), false);
	tab8Grid.addHeader({name:"구분",colId:"marketKind",width:"100",align:"center",type:"ro"});
	tab8Grid.addHeader({name:"당해년도(천원)",colId:"localAmt",width:"150",align:"right",type:"ed"});
	tab8Grid.addHeader({name:"Total(천원)",colId:"foreAmt",width:"150",align:"right",type:"ed"});
	tab8Grid.addHeader({name:"비고",colId:"remarks",width:"300",align:"left",type:"ed"});
	tab8Grid.setColSort("str");	
	tab8Grid.setUserData("","pk","");
	tab8Grid.dxObj.enableColSpan(true);
	tab8Grid.init();
	tab8Grid.cs_setColumnHidden(["setDate","setSeq"]);
	fn_setRowsTab8()
    
	tab8Toolbar = subToolbar(tab8Toolbar,subTabbar.tabs("a8"),[3,4]);
	tab8Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab8Save();
    	}
    	if(id=="btn4"){
    		fn_tab8GridRemove();
    	}
    })
}
function fn_setRowsTab8(){
	tab8Grid.addRow(["Market Size"]);
    tab8Grid.addRow(["예상매출액"]);
    tab8Grid.addRow(["예상경상익율"]);
    tab8Grid.addRow(["Target Market"]);
    tab8Grid.addRow(["적용제품"]);
    tab8Grid.dxObj.setColspan(tab8Grid.getRowId(4),1,3);
    tab8Grid.dxObj.setRowTextStyle(tab8Grid.getRowId(4),"text-align:left;")
}
function fn_tab8GridRemove(){
	var jsonStr = tab8Grid.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
	}else{
		var cudKeyColIdx = tab8Grid.getColIndexById('cudKey');
		tab8Grid.dxObj.forEachRow(function(id) {
		tab8Grid.setCells(id,cudKeyColIdx).setValue('DELETE');
		});
		fn_tab8Save();
		tab8Grid.clearAll();
		fn_setRowsTab8();
	}
}
function fn_tab8Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab8Grid.getColIndexById('setDate');
		var setSeqColIdx = tab8Grid.getColIndexById('setSeq');
		tab8Grid.dxObj.forEachRow(function(id) {
			tab8Grid.setCells(id,setDateColIdx).setValue(dateVal);
			tab8Grid.setCells(id,setSeqColIdx).setValue(seqVal);
		});
		/*col span 시 당해년도, total에 같은 값이 들어감 --> 아래 2컬럼은 integer타입이어야 하기 때문에 0으로 set
		* var tmp_localAmt_ColIdx = tab8Grid.getColIndexById('localAmt');
		* var tmp_foreAmt_ColIdx = tab8Grid.getColIndexById('foreAmt');
		* tab8Grid.setCells(tab8Grid.getRowId(4),tmp_localAmt_ColIdx).setValue(0);
		* tab8Grid.setCells(tab8Grid.getRowId(4),tmp_foreAmt_ColIdx).setValue(0);
		*/
		var jsonStr = tab8Grid.getJsonUpdated2();
		console.log(jsonStr);
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			
				$("#jsonData8").val(jsonStr);
				var params = $("#frmTab8").serialize();
				$.ajax({
			         url : "/erp/rndt/good/devPlanS/gridTab8Save",
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