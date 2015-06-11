function fn_setTab2(){
	tab2 = new dxGrid(subTabbar.tabs("a2"), false);
	tab2.addHeader({name:"No",colId:"",width:"50",align:"center",type:"ro"});
	tab2.addHeader({name:"내용",colId:"",width:"756",align:"center",type:"ed"});
	tab2.setColSort("str");	
	tab2.setUserData("","pk","No");
	tab2.init();
}
