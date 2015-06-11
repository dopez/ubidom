function fn_setTab8(){
	tab8 = subTabbar.tabs("a8").attachLayout("2E");
	tab8.cells("a").setHeight(45);
	tab8.cells("a").hideHeader();
	tab8.cells("b").hideHeader();
	
	tab8.cells("a").attachObject("tab8");
	tab8Grid = new dxGrid(tab8.cells("b"), false);
	tab8Grid.addHeader({name:"구분",colId:"a8Gubn",width:"100",align:"center",type:"ro"});
	tab8Grid.addHeader({name:"당해년도(천원)",colId:"",width:"150",align:"right",type:"ed"});
	tab8Grid.addHeader({name:"Total(천원)",colId:"",width:"150",align:"right",type:"ed"});
	tab8Grid.addHeader({name:"비고",colId:"",width:"300",align:"center",type:"ed"});
	tab8Grid.atchFooter();
	tab8Grid.addAtchFooter({atchFooterName:"합계"});
	tab8Grid.addAtchFooter({atchFooterName:"0"});
	tab8Grid.addAtchFooter({atchFooterName:"0"});
	tab8Grid.atchFooterInit();	
	tab8Grid.setColSort("str");	
	tab8Grid.setUserData("","pk","");
	tab8Grid.init();
    
    tab8Grid.addRow(["Market Size"]);
    tab8Grid.addRow(["예상매출액"]);
    tab8Grid.addRow(["예상경상익율"]);
    tab8Grid.addRow(["Target Market"]);
}
