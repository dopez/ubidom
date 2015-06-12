function fn_setTab8(){
	tab8 = subTabbar.tabs("a8").attachLayout("2E");
	tab8.cells("a").setHeight(45);
	tab8.cells("a").hideHeader();
	tab8.cells("b").hideHeader();
	
	tab8.cells("a").attachObject("tab8");
	tab8Grid = new dxGrid(tab8.cells("b"), false);
	tab8Grid.addHeader({name:"구분",colId:"marketKind",width:"100",align:"center",type:"ro"});
	tab8Grid.addHeader({name:"당해년도(천원)",colId:"localAmt",width:"150",align:"right",type:"ed"});
	tab8Grid.addHeader({name:"Total(천원)",colId:"foreAmt",width:"150",align:"right",type:"ed"});
	tab8Grid.addHeader({name:"비고",colId:"remarks",width:"300",align:"center",type:"ed"});
	tab8Grid.atchFooter();
	tab8Grid.addAtchFooter({atchFooterName:"합계"});
	tab8Grid.addAtchFooter({atchFooterName:"0"});
	tab8Grid.addAtchFooter({atchFooterName:"0"});
	tab8Grid.atchFooterInit();	
	tab8Grid.setColSort("str");	
	tab8Grid.setUserData("","pk","");
	tab8Grid.init();
	tab8Grid.cs_setColumnHidden(["setDate","setSeq"]);
    
    tab8Grid.addRow(["Market Size"]);
    tab8Grid.addRow(["예상매출액"]);
    tab8Grid.addRow(["예상경상익율"]);
    tab8Grid.addRow(["Target Market"]);

	tab8Toolbar = subToolbar(tab8Toolbar,subTabbar.tabs("a8"),[3,4,5,6]);
	tab8Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		fn_tab8Save();
    	}
    	if(id=="btn4"){
    		
    	}
    	if(id=="btn5"){
   			fn_addtab8();
    	}
    	if(id=="btn6"){
    		
    	}
    })
}
function fn_tab8Save(){
	if(fn_seqValid()){
		var setDateColIdx = tab8Grid.getColIndexById('setDate');
		var setSeqColIdx = tab8Grid.getColIndexById('setSeq');
		tab8Grid.dxObj.forEachRow(function(id) {
			tab8Grid.setCells(id,setDateColIdx).setValue(dateVal);
			tab8Grid.setCells(id,setSeqColIdx).setValue(seqVal);
		});
		var marKindLastVal = $("#frmTab8").find("[name=appItem]").val();
		if(!$("#frmTab8").find("[name=appItem]").val()){
			dhtmlx.alert("적용제품을 입력해주세요");
			return;
		}
	    tab8Grid.addRow(["적용제품","",marKindLastVal]);
		
		var jsonStr = tab8Grid.getJsonUpdated2();
		if (jsonStr == "[]" || jsonStr.length <= 2){
			dhtmlx.alert("입력 된 값이 없습니다.");
		}else{
			
				$("#jsonData8").val(jsonStr);
				var params = $("#frmTab8").serialize();
				$.ajax({
			         url : "/erp/rndt/stan/DevPlanS/gridTab8Save",
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