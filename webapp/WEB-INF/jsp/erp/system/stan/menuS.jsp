<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain,treeMain;
$(document).ready(function(){
	Ubi.setContainer(0,[1,3,5,6],"2U");
	//시스템 메뉴 등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

	
	//좌측 트리 그리드
	subLayout.cells("a").setWidth(300);
	treeMain = subLayout.cells("a").attachTree();
	treeMain.enableSmartCheckboxes(true);
	fn_treeMainConf();
	treeMain.enableThreeStateCheckboxes(true);
	treeMain.enableCheckBoxes(true, true);
	
	//우측 그리드 config
	gridMain = new dxGrid(subLayout.cells("b"), false);
	gridMain.addHeader({name:"순서", colId:"seq", align:"center",width:"5", type:"ed"});//화면순서
	gridMain.addHeader({name:"화면구분", colId:"menugbn", align:"center",width:"10", type:"combo"});//화면구분(폴더/윈도우)
	gridMain.addHeader({name:"메뉴코드", colId:"menucd", width:"10", type:"ed"});
	gridMain.addHeader({name:"메뉴명", colId:"menuename", width:"15", type:"ed"});
	gridMain.addHeader({name:"URI", colId:"uri", width:"25", type:"ed"});
	gridMain.addHeader({name:"웹매개변수", colId:"agValue", width:"7", type:"ed"});
	gridMain.addHeader({name:"사용구분", colId:"exegbn", width:"5", align:"center",type:"ch"});
	gridMain.setColSort("str");
	gridMain.setUserData("","pk","menucd");
	gridMain.init();
	gridMain.attachEvent("onRowSelect", function(id,ind){
		gridMain.editCell();
 	});
	//콤보박스 (드랍다운 리스트)
	var comboGbn = gridMain.getColumnCombo(1);
	comboGbn.load({
		template: {
		    input: "#menugbn#",
		    columns: [
		        {header: "화면구분", width: 110,  option: "#menugbn#"}
		    ]
		},
		options: [
		    {value:"0", text:{menugbn:"폴더"}},
		    {value:"1", text:{menugbn:"윈도우"}},
		]
	})
	
});
//doc Ready End

//조회 버튼 동작
function fn_search(){
	fn_treeMainConf();
}

//저장 버튼 동작
function fn_save(){
	//var isCK = gridMain.setCells2(gridMain.getSelectedRowIndex(gridMain.getSelectedRowId()),6).isChecked();
	var isC = gridMain.dxObj.cells(getRowId(1),6).isChecked();
	console.log(isC);
	alert("왜 안되!!!");
	alert(isC);
}
//한줄삽입
function fn_add(){
	var totalColNum = gridMain.getColumnCount();
  	var data = new Array(totalColNum);
  	gridMain.addRow(data);
  	var totalRowNum = gridMain.getRowsNum()-1;
  	gridMain.selectRow(totalRowNum);
}
//한줄삭제
function fn_delete(){
	
}
/*--------트리 config / load start--------*/
function fn_treeMainConf(){

	var req = $.ajax({
		url: "/erp/system/menuS",
		type: "get",
		dataType: "json",
	    beforeSend: function() {
    	   subLayout.cells("a").progressOn();
	    },
	    success:
	    	function(jsonData) {
			if("[]"!=JSON.stringify(jsonData)) {
				var data = {menuTree:jsonData};
				fn_treeMainLoad(data);
			} else {
				MsgManager.alertMsg("WRN040");
			}
		},
	    complete: function() {
    	  subLayout.cells("a").progressOff();
        }
	});
}
var fn_treeMainLoad = function(param) {
	if(treeMain!=null) {
		treeMain.destructor();
	}
	treeMain = subLayout.cells("a").attachTree();
	treeMain = new dxTree(treeMain);
	treeMain.setData(param.menuTree);
	treeMain.click(function(id){
		fncSelectItem(treeMain, id);
	});
	
	treeMain.load("menucd", "pmenucd", "menuname", treeMain);
}
/*--------트리 config / load start--------*/

/*--------트리 select action--------*/
var fncSelectItem = function(tree, id) {
	var exegbn = "";
	var menucd = id;
	try { // folder
		exegbn = tree.getUserData(id, "exegbn");
		if(exegbn=="0" && tree.getDxObj().getOpenState(id)==1) {
			tree.getDxObj().closeItem(id);
		} else {
			tree.getDxObj().openItem(id);
			tree.getDxObj().selectItem(id, false, false);
		}
		console.log(menucd);
		fn_loadGridMain(id);
	} catch(e){
		alert(e);
	}
	
	if(exegbn=="1") { // item 
		
		var flag = true;
		var uri = tree.getUserData(id, "uri");
	
		var menuItemText = tree.getDxObj().getItemText(id);
		alert("uri = "+uri+"menuName = "+menuItemText);
		
	}
}
/*--------트리 select action--------*/
function fn_loadGridMain(menucd){
	var param = "menucd="+menucd;
	gfn_callAjaxForGrid(gridMain,param,"/erp/system/menuS/selMenucd",subLayout.cells("a"),fn_callBack);
}
function fn_callBack(){
	console.log("good");
}
</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>