function fn_setTab6(){
	tab6 = new dxGrid(subTabbar.tabs("a6"), false);
	tab6.addHeader({name:"구분",colId:"dataKind",width:"100",align:"center",type:"combo"});
	tab6.addHeader({name:"계획",colId:"staff",width:"50",align:"center",type:"ro"});
	tab6.addHeader({name:"#cspan",colId:"mm",width:"50",align:"center",type:"ro"});
	tab6.addHeader({name:"#cspan",colId:"totMm",width:"100",align:"center",type:"ro"});
	tab6.addHeader({name:"변경",colId:"cStaff",width:"50",align:"center",type:"edn"});
	tab6.addHeader({name:"#cspan",colId:"cMm",width:"50",align:"center",type:"edn"});
	tab6.addHeader({name:"#cspan",colId:"cTotMm",width:"100",align:"center",type:"ro[=c4*c5]"});
	tab6.addHeader({name:"비고",colId:"remarks",width:"300",align:"left",type:"ed"});
	tab6.setColSort("str");	
	tab6.setUserData("","pk","dataKind");

	tab6.atchHeader();
	tab6.addAtchHeader({atchHeaderName:"#rspan"});
	tab6.addAtchHeader({atchHeaderName:"당해년도"});
	tab6.addAtchHeader({atchHeaderName:"#cspan"});
	tab6.addAtchHeader({atchHeaderName:"Total(MM)"});
	tab6.addAtchHeader({atchHeaderName:"당해년도"});
	tab6.addAtchHeader({atchHeaderName:"#cspan"});
	tab6.addAtchHeader({atchHeaderName:"Total(MM)"});
	tab6.addAtchHeader({atchHeaderName:"#rspan"});
	tab6.atchHeaderInit();
	
	tab6.atchHeader();
	tab6.addAtchHeader({atchHeaderName:"#rspan"});
	tab6.addAtchHeader({atchHeaderName:"인원"});
	tab6.addAtchHeader({atchHeaderName:"MM"});
	tab6.addAtchHeader({atchHeaderName:"#rspan"});
	tab6.addAtchHeader({atchHeaderName:"인원"});
	tab6.addAtchHeader({atchHeaderName:"MM"});
	tab6.addAtchHeader({atchHeaderName:"#rspan"});
	tab6.addAtchHeader({atchHeaderName:"#rspan"});
	tab6.atchHeaderInit();
	
	tab6.atchFooter();
	tab6.addAtchFooter({atchFooterName:"합계"});
	tab6.addAtchFooter({atchFooterName:"#stat_total"});
	tab6.addAtchFooter({atchFooterName:"#stat_total"});
	tab6.addAtchFooter({atchFooterName:"#stat_total"});
	tab6.addAtchFooter({atchFooterName:"#stat_total"});
	tab6.addAtchFooter({atchFooterName:"#stat_total"});
	tab6.addAtchFooter({atchFooterName:"#stat_total"});
	tab6.atchFooterInit();
	tab6.dxObj.enableMathEditing(true);

	tab6.init();
	tab6.cs_setColumnHidden(["planNumb","setDate","setSeq"]);
	tab6Toolbar = subToolbar(tab6Toolbar,subTabbar.tabs("a6"),[2,3,4]);
	tab6Toolbar.attachEvent("onClick",fn_tab6Btn)
	combo02 = tab6.getColumnCombo(0);
	combo02.addOption("1","착수");
	combo02.addOption("2","완료");
	combo02.addOption("3","이관");
	combo02.addOption("4","출시");
	combo02.disable();
}

function fn_tab6Btn(id){
	if(fn_seqValid()){

	if(id=="btn2"){
			if($("#evaluateNumb").val()==""){
				/*중간평가번호가 없을 때는 개발계획 테이블에서 셀렉트 해온 후 중간평가테이블에 저장한다.*/
	        	fn_init_searchGridTab(tab6,"a4",subTabbar.tabs("a6"),"/erp/rndt/good/devPlanS/selGridTab")
			}else{
				/*중간평가번호가 있을 때에는 c_컬럼을 계획 컬럼으로 불러온 후 저장한다.*/
				var evaluateNumb = $("#evaluateNumb").val();
				var obj = {};
				obj.setDate = evaluateNumb.substr(0,8);
				obj.setSeq = evaluateNumb.substr(8,2);
				gfn_callAjaxForGrid(tab6,obj,"selChangeCont2",subTabbar.tabs("a6"));
			}
			//fn_saveChangeTab6();
	}
	if(id=="btn3"){
		fn_tab6Save();
	}
	if(id=="btn4"){
		fn_tab6Remove();
	}
	}
}
function fn_saveChangeTab6(){
	var cudKeyColIdx = tab6.getColIndexById('cudKey');
	var setDateColIdx = tab6.getColIndexById('setDate');
	var setSeqColIdx = tab6.getColIndexById('setSeq');
	var planNumbIdx = tab6.getColIndexById('planNumb');
	var cTotMmIdx = tab6.getColIndexById('cTotMm');
	tab6.dxObj.forEachRow(function(id) {
    	tab6.setCells(id,cudKeyColIdx).setValue('INSERT');
        tab6.setCells(id,setDateColIdx).setValue(dateVal);
        tab6.setCells(id,setSeqColIdx).setValue(seqVal);
        tab6.setCells(id,planNumbIdx).setValue(planNumVal);
    if(tab6.setCells(id,cTotMmIdx).getValue()=="NaN"||typeof tab6.setCells(id,cTotMmIdx).getValue()=="NaN"||tab6.setCells(id,cTotMmIdx).getValue()==NaN){
        	tab6.setCells(id,cTotMmIdx).setValue("");
        }
	});
	var jsonStr = tab6.getJsonUpdated2();
	console.log(jsonStr);
	$("#jsonData6").val(jsonStr);
	console.log(jsonStr);
	$("input[name='tabId']").val(tabId);
	var params = $("#frmTab6").serialize();
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
function fn_tab6Remove(){
	var jsonStr = tab6.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
	}else{
		savecnt6 = 2;
		fn_tab6Save();
		tab6.clearAll();
	}
}
function fn_tab6Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab6.getColIndexById('setDate');
		var setSeqColIdx = tab6.getColIndexById('setSeq');
		var planNumbIdx = tab6.getColIndexById('planNumb');
		var cudKeyColIdx = tab6.getColIndexById('cudKey');
		
		tab6.dxObj.forEachRow(function(id) {
	        if($("#openParam").val()=="u"||savecnt6==1){
				tab6.setCells(id,cudKeyColIdx).setValue('UPDATE');
	        }else if(savecnt6==2){
	        	tab6.setCells(id,cudKeyColIdx).setValue('DELETE');
	        }else{
	        	tab6.setCells(id,cudKeyColIdx).setValue('INSERT');
	        }
			tab6.setCells(id,setDateColIdx).setValue(dateVal);
			tab6.setCells(id,setSeqColIdx).setValue(seqVal);
	        tab6.setCells(id,planNumbIdx).setValue(planNumVal);

		});
    	savecnt6 = 1;		

		var jsonStr = tab6.getJsonUpdated2();
		console.log(jsonStr)

		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
				$("#jsonData6").val(jsonStr);
				console.log(jsonStr);
				$("input[name='tabId']").val(tabId);

				var params = $("#frmTab6").serialize();
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
function fn_selgridTab6CB(data){
	console.log("tab6",data);
}