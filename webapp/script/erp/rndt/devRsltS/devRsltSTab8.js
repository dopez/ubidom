function fn_setTab8(){
	tab8 = new dxGrid(subTabbar.tabs("a8"), false);
	tab8.addHeader({name:"구분",colId:"investKind",width:"100",align:"center",type:"combo"});
	tab8.addHeader({name:"계획(천원)",colId:"dhAmt",width:"150",align:"right",type:"ron"});
	tab8.addHeader({name:"변경(천원)",colId:"cDhAmt",width:"150",align:"right",type:"edn"});
	tab8.addHeader({name:"비고",colId:"remarks",width:"300",align:"left",type:"ed"});
	tab8.atchFooter();
	tab8.addAtchFooter({atchFooterName:"합계"});
	tab8.addAtchFooter({atchFooterName:"#stat_total"});
	tab8.addAtchFooter({atchFooterName:"#stat_total"});
	tab8.atchFooterInit();	
	tab8.setColSort("str");	
	tab8.setUserData("","pk","");
	tab8.init();
	tab8.cs_setColumnHidden(["planNumb","setDate","setSeq"]);
	tab8Toolbar = subToolbar(tab8Toolbar,subTabbar.tabs("a8"),[2,3,4]);
	tab8Toolbar.attachEvent("onClick",function(id){
		if(fn_seqValid()){
		if(id=="btn2"){
			
				if($("#evaluateNumb").val()==""){
					/*중간평가번호가 없을 때는 개발계획 테이블에서 셀렉트 해온 후 중간평가테이블에 저장한다.*/
		        	fn_init_searchGridTab(tab8,"a7",subTabbar.tabs("a8"),"/erp/rndt/good/devPlanS/selGridTab")
				}else{
					/*중간평가번호가 있을 때에는 c_컬럼을 계획 컬럼으로 불러온 후 저장한다.*/
					var evaluateNumb = $("#evaluateNumb").val();
					var obj = {};
					obj.setDate = evaluateNumb.substr(0,8);
					obj.setSeq = evaluateNumb.substr(8,2);
					gfn_callAjaxForGrid(tab8,obj,"selChangeCont4",subTabbar.tabs("a8"));
				}
				fn_saveChangeTab8();
		}
    	if(id=="btn3"){
    		fn_tab8Save();
    	}
    	if(id=="btn4"){
    		fn_tab8Remove();
    	}
		}
    })
	combo03 = tab8.getColumnCombo(0);
	combo03.addOption("1","착수");
	combo03.addOption("2","완료");
	combo03.addOption("3","이관");
	combo03.addOption("4","출시");
	combo03.disable();
}
function fn_saveChangeTab8(){
	var cudKeyColIdx = tab8.getColIndexById('cudKey');
	var setDateColIdx = tab8.getColIndexById('setDate');
	var setSeqColIdx = tab8.getColIndexById('setSeq');
	var planNumbIdx = tab8.getColIndexById('planNumb');
	tab8.dxObj.forEachRow(function(id) {
    	tab8.setCells(id,cudKeyColIdx).setValue('INSERT');
        tab8.setCells(id,setDateColIdx).setValue(dateVal);
        tab8.setCells(id,setSeqColIdx).setValue(seqVal);
        tab8.setCells(id,planNumbIdx).setValue(planNumVal);
	});
	var jsonStr = tab8.getJsonUpdated2();
	console.log(jsonStr);
	$("#jsonData8").val(jsonStr);
	console.log(jsonStr);
	$("input[name='tabId']").val(tabId);
	var params = $("#frmTab8").serialize();
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
function fn_tab8Remove(){
	var jsonStr = tab8.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
	}else{
		var cudKeyColIdx = tab8.getColIndexById('cudKey');
		tab8.dxObj.forEachRow(function(id) {
		tab8.setCells(id,cudKeyColIdx).setValue('DELETE');
		});
		fn_tab8Save();
		tab8.clearAll();
	}
}
function fn_tab8Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab8.getColIndexById('setDate');
		var setSeqColIdx = tab8.getColIndexById('setSeq');
		tab8.dxObj.forEachRow(function(id) {
			tab8.setCells(id,setDateColIdx).setValue(dateVal);
			tab8.setCells(id,setSeqColIdx).setValue(seqVal);
		});
		
		var jsonStr = tab8.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			g_dxRules = {planKind : [r_notEmpty]}
			if(gfn_validation("planKind", "구분",1||2||3||4)){
				$("#jsonData8").val(jsonStr);
				$("input[name='tabId']").val(tabId);
				var params = $("#frmTab8").serialize();
				console.log(params);
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
}
function fn_selgridTab8CB(data){
	console.log("tab8",data);
}