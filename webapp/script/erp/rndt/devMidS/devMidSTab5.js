function fn_setTab5(){
	tab5 = new dxGrid(subTabbar.tabs("a5"), false);
	tab5.addHeader({name:"개발일정",colId:"",width:"100",align:"center",type:"combo"});
	tab5.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"dhxCalendarA"});
	tab5.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"ed"});
	tab5.addHeader({name:"주관부서",colId:"",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"변경일정",colId:"",width:"100",align:"center",type:"dhxCalendarA"});
	tab5.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"ed"});
	tab5.addHeader({name:"주관부서",colId:"",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"관련부서선행Role(제조/생산/마케팅)",colId:"role",width:"300",align:"center",type:"ed"});
	tab5.addHeader({name:"OutSourcing 계획",colId:"outSourcing",width:"300",align:"center",type:"ed"});
	
	tab5.atchHeader();
	tab5.addAtchHeader({atchHeaderName:"구분"});
	tab5.addAtchHeader({atchHeaderName:"일자"});
	tab5.addAtchHeader({atchHeaderName:"일수"});
	tab5.addAtchHeader({atchHeaderName:"주"});
	tab5.addAtchHeader({atchHeaderName:"부"});
	tab5.addAtchHeader({atchHeaderName:"일자"});
	tab5.addAtchHeader({atchHeaderName:"일수"});
	tab5.addAtchHeader({atchHeaderName:"주"});
	tab5.addAtchHeader({atchHeaderName:"부"});
	tab5.addAtchHeader({atchHeaderName:"#rspan"});
	tab5.addAtchHeader({atchHeaderName:"#rspan"});
	tab5.atchHeaderInit();
	tab5.dxObj.setUserData("","@planDate","format_date");
	tab5.setColSort("str");	
	tab5.setUserData("","pk","planKind");
	tab5.init();
	tab5.cs_setColumnHidden(["setDate","setSeq","juDept","booDept"]);
    //tab5.attachEvent("onRowDblClicked",fn_getJooBoo);
	tab5Toolbar = subToolbar(tab5Toolbar,subTabbar.tabs("a5"),[3,4]);
	tab5Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab5Save();
    	}
    	if(id=="btn4"){
    		fn_tab5Remove();
    	}
    })
/*	combo01 = tab5.getColumnCombo(0);
	combo01.addOption("1","착수");
	combo01.addOption("2","완료");
	combo01.addOption("5","이관");
	combo01.addOption("4","출시");*/
}
/*function fn_getJooBoo(rId,colIdx){
	 var selRowIdx = tab5.getSelectedRowIndex();
     var juDeptIdx = tab5.getColIndexById('juDept');
     var juPostNameIdx = tab5.getColIndexById('juPostName');
     var booDeptIdx = tab5.getColIndexById('booDept');
     var booPostNameIdx = tab5.getColIndexById('booPostName');
 	 
    if (colIdx == 5) {
    	 popFlag = 5
    	 gfn_load_pop('w1','common/deptCodePOP',true,{"postName":tab5.setCells2(selRowIdx, juPostNameIdx).getValue()});
    }
 	  if (colIdx == 4) {
 		  popFlag = 4
 		 gfn_load_pop('w1','common/deptCodePOP',true,{"postName":tab5.setCells2(selRowIdx, booPostNameIdx).getValue()});
 	  }
}*/
function fn_tab5Remove(){
	var jsonStr = tab5.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
	}else{
		var cudKeyColIdx = tab5.getColIndexById('cudKey');
		tab5.dxObj.forEachRow(function(id) {
		tab5.setCells(id,cudKeyColIdx).setValue('DELETE');
		});
		fn_tab5Save();
		tab5.clearAll();
	}
}
function fn_tab5Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab5.getColIndexById('setDate');
		var setSeqColIdx = tab5.getColIndexById('setSeq');
		tab5.dxObj.forEachRow(function(id) {
			tab5.setCells(id,setDateColIdx).setValue(dateVal);
			tab5.setCells(id,setSeqColIdx).setValue(seqVal);
		});
		
		var jsonStr = tab5.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			g_dxRules = {planKind : [r_notEmpty]}
			if(gfn_validation("planKind", "구분",1||2||5||4)){
				$("#jsonData5").val(jsonStr);
				var params = $("#frmTab5").serialize();
				$.ajax({
			         url : "/erp/rndt/good/devPlanS/gridTab5Save",
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
function fn_selgridTab5CB(data){
	
}