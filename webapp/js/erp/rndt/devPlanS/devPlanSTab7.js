function fn_setTab7(){
	tab7 = new dxGrid(subTabbar.tabs("a7"), false);
	tab7.addHeader({name:"구분",colId:"",width:"100",align:"center",type:"combo"});
	tab7.addHeader({name:"당해년도(천원)",colId:"",width:"150",align:"right",type:"ed"});
	tab7.addHeader({name:"Total(천원)",colId:"",width:"150",align:"right",type:"ed"});
	tab7.addHeader({name:"비고",colId:"",width:"300",align:"center",type:"ed"});
	tab7.atchFooter();
	tab7.addAtchFooter({atchFooterName:"합계"});
	tab7.addAtchFooter({atchFooterName:"0"});
	tab7.addAtchFooter({atchFooterName:"0"});
	tab7.atchFooterInit();	
	tab7.setColSort("str");	
	tab7.setUserData("","pk","");
	tab7.init();
	
	combo03 = tab7.getColumnCombo(0);
	combo03.addOption("착수","착수");
	combo03.addOption("완료","완료");
	combo03.addOption("이관","이관");
	combo03.addOption("출시","출시");
}
function fn_addTab7(){
  	var totalRowNum = tab7.getRowsNum();
    var totalColNum = tab7.getColumnCount();
    var data = new Array(totalColNum);
    tab7.addRow(data);
    tab7.selectRow(totalRowNum);
}