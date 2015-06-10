function fn_setTab3(){
	tab3 = new dxGrid(subTabbar.tabs("a3"), false);
	tab3.addHeader({name:"개발일정",colId:"",width:"100",align:"center",type:"combo"});
	tab3.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"dhxCalendarA"});
	tab3.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"ed"});
	tab3.addHeader({name:"주관부서",colId:"",width:"100",align:"center",type:"ed"});
	tab3.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"ed"});
	tab3.addHeader({name:"관련부서선행Role(제조/생산/마케팅)",colId:"",width:"300",align:"center",type:"ed"});
	tab3.addHeader({name:"OutSourcing 계획",colId:"",width:"300",align:"center",type:"ed"});
	tab3.setColSort("str");	
	tab3.setUserData("","pk","No");
	tab3.atchHeader();
	tab3.addAtchHeader({atchHeaderName:"구분"});
	tab3.addAtchHeader({atchHeaderName:"일자"});
	tab3.addAtchHeader({atchHeaderName:"일수"});
	tab3.addAtchHeader({atchHeaderName:"주"});
	tab3.addAtchHeader({atchHeaderName:"부"});
	tab3.addAtchHeader({atchHeaderName:"#rspan"});
	tab3.addAtchHeader({atchHeaderName:"#rspan"});
	tab3.atchHeaderInit();
	tab3.init();
	
	combo01 = tab3.getColumnCombo(0);
	combo01.addOption("착수","착수");
	combo01.addOption("완료","완료");
	combo01.addOption("이관","이관");
	combo01.addOption("출시","출시");
}
function fn_addTab3(){
  	var totalRowNum = tab3.getRowsNum();
    var totalColNum = tab3.getColumnCount();
    var data = new Array(totalColNum);
    tab3.addRow(data);
    tab3.selectRow(totalRowNum);
}