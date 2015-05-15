<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain,treeMain;
$(document).ready(function(){
	Ubi.setContainer(0,[1,2,3,5,6],"2U");
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
	gridMain.addHeader({name:"순서", colId:"seq", align:"center",width:"5", type:"cntr"});//화면순서
	gridMain.addHeader({name:"화면구분", colId:"menugbn", align:"center",width:"8", type:"combo"});//화면구분(폴더/윈도우)
	gridMain.addHeader({name:"메뉴코드", colId:"menucd", align:"center",width:"10", type:"ro"});
	gridMain.addHeader({name:"메뉴명", colId:"menuname", width:"15", type:"ed"});
	gridMain.addHeader({name:"URI", colId:"uri", width:"25", type:"ed"});
	gridMain.addHeader({name:"웹매개변수", colId:"agValue", width:"7", type:"ed"});
	gridMain.addHeader({name:"사용구분", colId:"exegbn", width:"5", align:"center",type:"ch"});
	gridMain.setColSort("str");
	gridMain.setUserData("","pk","menucd");
	gridMain.init();
	
	//grid 드래그 앤 드랍
	gridMain.dxObj.enableDragAndDrop(true);
	//grid 멀티셀렉트
	gridMain.dxObj.enableMultiselect(true);
	//콤보박스 (드랍다운 리스트)
	var comboGbn = gridMain.getColumnCombo(1);
	comboGbn.addOption("0","폴더");
	comboGbn.addOption("1","윈도우");
	
	//onselect edit cell
	gridMain.attachEvent("onRowSelect", function(id,ind){
		gridMain.editCell();
 	});
	gridMain.attachEvent("onDrop",fn_onDrop);
});
//doc Ready End
function fn_onDrop(){
  	var selRowId = gridMain.getSelectedRowId();
	var selRowIdx = gridMain.getSelectedRowIndex(selRowId);
	var totalRowNum = gridMain.getRowsNum();
	do{
		gridMain.setCells2(selRowIdx,"0").setValue(selRowIdx-1);
		selRowIdx++;
	}
	while(selRowIdx < totalRowNum);
}
//조회 버튼 동작
function fn_search(){
	fn_treeMainConf();
	gridMain.clearAll();
}
// 신규버튼 테스트
function fn_new(){
  	var selRowId = gridMain.getSelectedRowId();
	var selRowIdx = gridMain.getSelectedRowIndex(selRowId);
	var totalRowNum = gridMain.getRowsNum();
	do{
		gridMain.setCells2(selRowIdx,"0").setValue(selRowIdx+1);
		
		selRowIdx++;
	}
	while(selRowIdx-1==totalRowNum);
}
//저장 버튼 동작
function fn_save(){
/* 저장 될 때 seq 입력	
*
*   var totalRowNum = gridMain.getRowsNum();
*	for (i = 0; i<totalRowNum, ++i;){
*	  	if(i==totalRowNum-1){
*	  		fn_gridMainSave();
*	  	}else{
*			gridMain.setCells2(i,0).setValue(i+1);
*	  	}
*	}
*/
	var jsonStr = gridMain.getJsonUpdated2();
    if (jsonStr == null || jsonStr.length <= 0) return;        		
        $("#jsonData").val(jsonStr);
        $.ajax({
           url : "/erp/system/menuS/crudMenuS",
           type : "POST",
           data : $("#hiddenform").serialize(),
           async : true,
           success : function(data) {
           gridMain.clearAll();
           MsgManager.alertMsg("INF001");
           var menucd = $("#Pmenucd").val()
           fn_loadGridMain(menucd);
           }
       });
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
	      var rodid = gridMain.getSelectedRowId();
	      var rodIdx = gridMain.getSelectedRowIndex();
	      if(gridMain.isDelRows(rodid)) {
	         if(MsgManager.confirmMsg("INF002")) {
	       	  if(gridMain.chkUnsavedRow(rodIdx,rodid)) {
	       		  return
	       	  }else{
	       		 var jsonStr = gridMain.getJsonRowDel(rodid);
	             if (jsonStr == null || jsonStr.length <= 0) return;
	              $("#jsonData").val(jsonStr);
	                  $.ajax({
	                   url : "/erp/system/menuS/crudMenuS",
	                   type : "POST",
	                   data : $("#hiddenform").serialize(),
	                   async : true,
	                   success : function(data) {
	                   MsgManager.alertMsg("INF003");
	                   gridMain.clearAll();
	                   var menucd = $("#Pmenucd").val()
	                   fn_loadGridMain(menucd);
	                  }
	              });
	       	   }   	 
	          } else {
	           	 MsgManager.alertMsg("WRN004");
	            } 
	       }else {
	           MsgManager.alertMsg("WRN002");
	        }
}
/*--------트리 config / load start--------*/
function fn_treeMainConf(flag){
	var req = $.ajax({
		url: "/erp/system/menuS",
		type: "get",
		dataType: "json",
	    beforeSend: function() {
    	   subLayout.cells("a").progressOn();
	    },
	    success:
	    	function(jsonData,flag) {
			if("[]"!=JSON.stringify(jsonData)) {
				var data = {menuTree:jsonData};
				fn_treeMainLoad(data,flag);
			} else {
				MsgManager.alertMsg("WRN040");
			}
		},
	    complete: function() {
    	  subLayout.cells("a").progressOff();
        }
	});
}
var fn_treeMainLoad = function(param,flag) {
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
/* 	if (flag==0){
	var firstMenucd = param.menuTree[0].menucd;
	fn_loadGridMain(firstMenucd);
	}else{
		alert("is it working?");
	} */
}
/*--------트리 config / load end--------*/

/*--------트리 select action--------*/
var fncSelectItem = function(tree, id) {
	var exegbn = "";
	try { //tree open&close
		exegbn = tree.getUserData(id, "exegbn");
		if(exegbn=="0" && tree.getDxObj().getOpenState(id)==1) {
			tree.getDxObj().closeItem(id);
		} else {
			tree.getDxObj().openItem(id);
			tree.getDxObj().selectItem(id, false, false);
		}
	} catch(e){
		alert(e);
	}
	
	if(exegbn=="0") { // 우측 그리드 조회 
		fn_loadGridMain(id);
		$("#Pmenucd").val(id);
	}

}
/*--------트리 select action--------*/
function fn_loadGridMain(menucd){
	var param = "menucd="+menucd;
	gfn_callAjaxForGrid(gridMain,param,"/erp/system/menuS/selMenucd",subLayout.cells("b"),fn_callBack);
}
function fn_callBack(data){
	
}
</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="Pmenucd" name="Pmenucd" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>