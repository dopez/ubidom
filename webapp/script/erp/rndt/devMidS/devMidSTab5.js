function fn_setTab5(){
	tab5 = new dxGrid(subTabbar.tabs("a5"), false);
	tab5.addHeader({name:"개발일정",colId:"planKind",width:"100",align:"center",type:"combo"});
	tab5.addHeader({name:"#cspan",colId:"planDate",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"#cspan",colId:"dayQty",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"주관부서",colId:"juPostName",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"#cspan",colId:"booPostName",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"변경일정",colId:"cPlanDate",width:"100",align:"center",type:"dhxCalendarA"});
	tab5.addHeader({name:"#cspan",colId:"cDayQty",width:"100",align:"center",type:"ed"});
	tab5.addHeader({name:"주관부서",colId:"cJuPostName",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"#cspan",colId:"cBooPostName",width:"100",align:"center",type:"ro"});
	tab5.addHeader({name:"관련부서선행Role(제조/생산/마케팅)",colId:"role",width:"300",align:"left",type:"ed"});
	tab5.addHeader({name:"OutSourcing 계획",colId:"outSourcing",width:"300",align:"left",type:"ed"});
	
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
	tab5.dxObj.setUserData("","@cPlanDate","format_date");
	tab5.setColSort("str");	
	tab5.setUserData("","pk","planKind");
	tab5.init();
	tab5.cs_setColumnHidden(["planNumb","setDate","setSeq","juDept","booDept","cJuDept","cBooDept"]);
    tab5.attachEvent("onRowDblClicked",fn_getJooBoo);
	tab5Toolbar = subToolbar(tab5Toolbar,subTabbar.tabs("a5"),[2,3,4]);
	tab5Toolbar.attachEvent("onClick",function(id){
		if(fn_seqValid()){
    	if(id=="btn2"){
	    		if($("#evaluateNumb").val()==""){
	    			/*중간평가번호가 없을 때는 개발계획 테이블에서 셀렉트 해온 후 중간평가테이블에 저장한다.*/
		        	fn_init_searchGridTab(tab5,"a3",subTabbar.tabs("a5"),"/erp/rndt/good/devPlanS/selGridTab");
	    		}else{
	    			/*중간평가번호가 있을 때에는 c_컬럼을 계획 컬럼으로 불러온 후 저장한다.*/
	    			var evaluateNumb = $("#evaluateNumb").val();
	    			var obj = {};
	    			obj.setDate = evaluateNumb.substr(0,8);
	    			obj.setSeq = evaluateNumb.substr(8,2);
	    			gfn_callAjaxForGrid(tab5,obj,"selChangeCont",subTabbar.tabs("a5"));
	    		}
	    		//fn_saveChangeTab5();
    		}
    	
    	if(id=="btn3"){
    		fn_tab5Save();
    	}
    	if(id=="btn4"){
    		fn_tab5Remove();
    	}
		}
    })
	combo04 = tab5.getColumnCombo(0);
	combo04.addOption("1","착수");
	combo04.addOption("2","완료");
	combo04.addOption("3","이관");
	combo04.addOption("4","출시");
	combo04.disable();
}
function fn_saveChangeTab5(){
	var cudKeyColIdx = tab5.getColIndexById('cudKey');
	var setDateColIdx = tab5.getColIndexById('setDate');
	var setSeqColIdx = tab5.getColIndexById('setSeq');
	var planNumbIdx = tab5.getColIndexById('planNumb');
	tab5.dxObj.forEachRow(function(id) {
    	tab5.setCells(id,cudKeyColIdx).setValue('INSERT');
        tab5.setCells(id,setDateColIdx).setValue(dateVal);
        tab5.setCells(id,setSeqColIdx).setValue(seqVal);
        tab5.setCells(id,planNumbIdx).setValue(planNumVal);
	});
	var jsonStr = tab5.getJsonUpdated2();
	console.log(jsonStr);
	$("#jsonData5").val(jsonStr);
	console.log(jsonStr);
	$("input[name='tabId']").val(tabId);
	var params = $("#frmTab5").serialize();
	$.ajax({
         url : "/erp/rndt/good/devMidS/gridTabSave",
         type : "POST",
         data : params,
         async : true,
         success : function(data) {
            //MsgManager.alertMsg("INF001");
         }
     });
}
function fn_getJooBoo(rId,colIdx){
	 var selRowIdx = tab5.getSelectedRowIndex();
     var juDeptIdx = tab5.getColIndexById('cJuDept');
     var juPostNameIdx = tab5.getColIndexById('cJuPostName');
     var booDeptIdx = tab5.getColIndexById('cBooDept');
     var booPostNameIdx = tab5.getColIndexById('cBooPostName');
 	 
    if (colIdx == 7) {
    	 popFlag = 7
    	 gfn_load_pop('w1','common/deptCodePOP',true,{"postName":tab5.setCells2(selRowIdx, juPostNameIdx).getValue()});
    }
 	  if (colIdx == 8) {
 		  popFlag = 8
 		 gfn_load_pop('w1','common/deptCodePOP',true,{"postName":tab5.setCells2(selRowIdx, booPostNameIdx).getValue()});
 	  }
}
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
		var planNumbIdx = tab5.getColIndexById('planNumb');
		var cudKeyColIdx = tab5.getColIndexById('cudKey');
		tab5.dxObj.forEachRow(function(id) {
	        if($("#openParam").val()=="u"||savecnt>0){
				tab5.setCells(id,cudKeyColIdx).setValue('UPDATE');
	        }else{
	        	tab5.setCells(id,cudKeyColIdx).setValue('INSERT');
	        }
	        tab5.setCells(id,setDateColIdx).setValue(dateVal);
	        tab5.setCells(id,setSeqColIdx).setValue(seqVal);
	        tab5.setCells(id,planNumbIdx).setValue(planNumVal);
		});
    	savecnt = 1;		
		var jsonStr = tab5.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			$("#jsonData5").val(jsonStr);
			console.log(jsonStr);
			$("input[name='tabId']").val(tabId);
			var params = $("#frmTab5").serialize();
			$.ajax({
		         url : "/erp/rndt/good/devMidS/gridTabSave",
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
function fn_selgridTab5CB(data){
	console.log("tab5",data);
}