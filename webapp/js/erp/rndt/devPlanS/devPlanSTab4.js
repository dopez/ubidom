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
	
	combo02 = tab4.getColumnCombo(0);
	combo02.addOption("착수","착수");
	combo02.addOption("완료","완료");
	combo02.addOption("이관","이관");
	combo02.addOption("출시","출시");
}
function fn_addTab4(){
  	var totalRowNum = tab4.getRowsNum();
    var totalColNum = tab4.getColumnCount();
    var data = new Array(totalColNum);
    tab4.addRow(data);
    tab4.selectRow(totalRowNum);
}