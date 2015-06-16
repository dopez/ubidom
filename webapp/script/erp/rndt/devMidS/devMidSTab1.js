function fn_setTab1(){
	tab1 = new dxGrid(subTabbar.tabs("a1"), false);
	tab1.addHeader({name:"No",colId:"rNum",width:"50",align:"center",type:"cntr"});
	tab1.addHeader({name:"주요항목",colId:"",width:"100",align:"center",type:"combo"});
	tab1.addHeader({name:"내용",colId:"",width:"700",align:"center",type:"ed"});
	tab1.setColSort("str");	
	tab1.setUserData("","pk","rNum");
	tab1.init();
//	tab3.cs_setColumnHidden(["setDate","setSeq","juDept","booDept"]);


	tab1Toolbar = subToolbar(tab1Toolbar,subTabbar.tabs("a1"),[3,4,5,6]);
	tab1Toolbar.attachEvent("onClick",function(id){
    	if(id=="btn3"){
    		
    	}
    	if(id=="btn4"){
    		
    	}
    	if(id=="btn5"){
    		fn_addTab1();
    	}
    	if(id=="btn6"){
    		
    	}
    })
	combo01 = tab1.getColumnCombo(1);
	combo01.addOption("1","고객/시장");
	combo01.addOption("2","경쟁력");
	combo01.addOption("3","기술환경");
	combo01.addOption("4","사업환경");
}
function fn_addTab1(){
  	var totalRowNum = tab1.getRowsNum();
    var totalColNum = tab1.getColumnCount();
    var data = new Array(totalColNum);
    tab1.addRow(data);
    tab1.selectRow(totalRowNum);
}