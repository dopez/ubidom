function fn_setTab1(){
	tab1 = new dxGrid(subTabbar.tabs("a1"), false);
	tab1.addHeader({name:"No",colId:"rNum",width:"50",align:"center",type:"cntr"});
	tab1.addHeader({name:"주요항목",colId:"entryKind",width:"100",align:"center",type:"combo"});
	tab1.addHeader({name:"내용",colId:"contents",width:"700",align:"left",type:"ed"});
	tab1.setColSort("str");	
	tab1.setUserData("","pk","planNumb");
	tab1.init();
	tab1.cs_setColumnHidden(["setDate","setSeq","planNumb"]);


	tab1Toolbar = subToolbar(tab1Toolbar,subTabbar.tabs("a1"),[3,4,5,6]);
	tab1Toolbar.attachEvent("onClick",function(id){
		if(fn_seqValid()){
		
    	if(id=="btn3"){
    		fn_tab1Save();
    	}
    	if(id=="btn4"){
    		
    	}
    	if(id=="btn5"){
    		fn_addTab1();
    	}
    	if(id=="btn6"){
    		
    	}
		}
    })
	combo01 = tab1.getColumnCombo(1);
	combo01.addOption("1","고객/시장");
	combo01.addOption("2","경쟁력");
	combo01.addOption("3","기술환경");
	combo01.addOption("4","사업환경");
}
function fn_selgridTab1CB(data){
	console.log("gridTab1 data = ", data); 
}
function fn_tab1Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab1.getColIndexById('setDate');
		var setSeqColIdx = tab1.getColIndexById('setSeq');
	    var planNumbColIdx = tab1.getColIndexById('planNumb');
		tab1.dxObj.forEachRow(function(id) {
			tab1.setCells(id,setDateColIdx).setValue(dateVal);
			tab1.setCells(id,setSeqColIdx).setValue(seqVal);
			tab1.setCells(id,planNumbColIdx).setValue(planNumVal);
		});
		var jsonStr = tab1.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			g_dxRules = {planKind : [r_notEmpty]}
			if(gfn_validation("entryKind", "구분",1||2||3||4)){
				$("#jsonData1").val(jsonStr);
				$("input[name='tabId']").val(tabId);
				var params = $("#frmTab1").serialize();
				console.log(params)
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
function fn_addTab1(){
  	var totalRowNum = tab1.getRowsNum();
    var totalColNum = tab1.getColumnCount();
    var data = new Array(totalColNum);
    tab1.addRow(data);
    tab1.selectRow(totalRowNum);
}