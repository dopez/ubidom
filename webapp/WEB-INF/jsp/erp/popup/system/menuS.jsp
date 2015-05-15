<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout,divAddDel;
var gridMain;
var config={
		title:"권한등록",
		width:"800",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(0,[1,2,3,5,6],"3W");
	//부서코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    subLayout.cells("a").setHeight(300);
    gridMst = new dxGrid(subLayout.cells("a"), false);
    gridMst.addHeader({name:"No", colId:"rowNo", 	width:"10", align:"center", type:"cntr"});
    gridMst.addHeader({name:"사용자ID", colId:"userId", 	width:"10", align:"center", type:"ro"});
	gridMst.addHeader({name:"사용자명", 	 colId:"userName", 	width:"10", align:"center", type:"ro"});
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","userId");
	gridMst.init();
	
	subLayout.cells("b").setHeight(100);
	divAddDel = subLayout.cells("b").attachObject("divAddDel");
	
	subLayout.cells("c").setHeight(300);
	gridDtl = new dxGrid(subLayout.cells("c"), false);
	gridDtl.addHeader({name:"No", colId:"rowNo", 	width:"10", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"사용자ID", colId:"userId", 	width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"사용자명", 	 colId:"userName", 	width:"10", align:"center", type:"ro"});
	gridDtl.setColSort("str");	
	gridDtl.setUserData("","pk","userId");
	gridDtl.init();
	
});
//doc Ready End
//row dbl click
function fn_load_pop(){
	var selRowId = gridMain.getSelectedRowId();
	var selRowIdx = gridMain.getSelectedRowIndex(selRowId);
	var menuNameParam=gridMain.setCells2(selRowIdx,"3").getValue(selRowIdx-1);
	gfn_load_pop('w1','system/authPOP',true,menuNameParam);
}
//row drag n drop
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