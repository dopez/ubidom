function fn_setTab3(){
	tab3 = new dxGrid(subTabbar.tabs("a3"), false);
	tab3.addHeader({name:"개발일정",colId:"planKind",width:"100",align:"center",type:"combo"});
	tab3.addHeader({name:"#cspan",colId:"planDate",width:"100",align:"center",type:"dhxCalendarA"});
	tab3.addHeader({name:"#cspan",colId:"dayQty",width:"100",align:"center",type:"ed"});
	tab3.addHeader({name:"주관부서",colId:"juDept",width:"100",align:"center",type:"ed"});
	tab3.addHeader({name:"#cspan",colId:"booDept",width:"100",align:"center",type:"ed"});
	tab3.addHeader({name:"관련부서선행Role(제조/생산/마케팅)",colId:"role",width:"300",align:"center",type:"ed"});
	tab3.addHeader({name:"OutSourcing 계획",colId:"outSourcing",width:"300",align:"center",type:"ed"});
	/*tab3.addHeader({name:"일자",colId:"setDate",width:"100",align:"center",type:"ro"});
	tab3.addHeader({name:"순번",colId:"setSeq",width:"100",align:"center",type:"ro"});*/
	tab3.dxObj.setUserData("","@planDate","format_date");
	tab3.setColSort("str");	
	tab3.setUserData("","pk","planKind");
	tab3.atchHeader();
	tab3.addAtchHeader({atchHeaderName:"구분"});
	tab3.addAtchHeader({atchHeaderName:"일자"});
	tab3.addAtchHeader({atchHeaderName:"일수"});
	tab3.addAtchHeader({atchHeaderName:"주"});
	tab3.addAtchHeader({atchHeaderName:"부"});
	tab3.addAtchHeader({atchHeaderName:"#rspan"});
	tab3.addAtchHeader({atchHeaderName:"#rspan"});
	tab3.atchHeaderInit();
	tab3.init();
	tab3.cs_setColumnHidden(["setDate","setSeq"]);
	tab3Toolbar = subToolbar(tab3Toolbar,subTabbar.tabs("a3"),[3,4,5,6]);
	tab3Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab3Save();
    	}
    	if(id=="btn4"){
    		fn_tab3Remove();
    	}
    	if(id=="btn5"){
   			fn_addTab3();
    	}
    })
	combo01 = tab3.getColumnCombo(0);
	combo01.addOption("1","착수");
	combo01.addOption("2","완료");
	combo01.addOption("3","이관");
	combo01.addOption("4","출시");
}
function fn_tab3Remove(){
	var jsonStr = tab3.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
	}else{
		var cudKeyColIdx = tab3.getColIndexById('cudKey');
		tab3.dxObj.forEachRow(function(id) {
		tab3.setCells(id,cudKeyColIdx).setValue('DELETE');
		});
		fn_tab3Save();
		tab3.clearAll();
	}
}
function fn_addTab3(){
  	var totalRowNum = tab3.getRowsNum();
    var totalColNum = tab3.getColumnCount();
    var data = new Array(totalColNum);
    tab3.addRow(data);
    tab3.selectRow(totalRowNum);
}
function fn_tab3Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab3.getColIndexById('setDate');
		var setSeqColIdx = tab3.getColIndexById('setSeq');
		tab3.dxObj.forEachRow(function(id) {
			tab3.setCells(id,setDateColIdx).setValue(dateVal);
			tab3.setCells(id,setSeqColIdx).setValue(seqVal);
		});
		
		var jsonStr = tab3.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			g_dxRules = {planKind : [r_notEmpty]}
			if(gfn_validation("planKind", "구분",1||2||3||4)){
				$("#jsonData3").val(jsonStr);
				var params = $("#frmTab3").serialize();
				$.ajax({
			         url : "/erp/rndt/good/devPlanS/gridTab3Save",
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