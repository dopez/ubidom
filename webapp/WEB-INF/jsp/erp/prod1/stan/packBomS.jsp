<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var treeMain;
var gridMst, gridDtl;
var toolbar01, toolbar02;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2],"4C");
	//포장BOM등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").setWidth(200);
	subLayout.cells("a").setHeight(800);
	treeMain = subLayout.cells("a").attachTree();
	treeMain.setImagePath("/component/dhtmlxSuite/codebase/imgs/dhxtree_skyblue/");
	
	subLayout.cells("b").attachObject("bootContainer2");
	subLayout.cells("b").setHeight(150);
	
	subLayout.cells("c").showHeader();
	subLayout.cells("c").setText("BOM등록");
	
	gridMst = new dxGrid(subLayout.cells("c"), false);
	gridMst.addHeader({name:"NO",       colId:"no",       width:"50", align:"center", type:"cntr"});
	gridMst.addHeader({name:"포장코드", colId:"packCode", width:"70", align:"left",   type:"ro"});
	gridMst.addHeader({name:"포장명",   colId:"packName", width:"90", align:"left",   type:"combo"});
	gridMst.addHeader({name:"규격",     colId:"packSpec", width:"90", align:"left",   type:"ro"});	
	gridMst.addHeader({name:"단위",     colId:"packUnit", width:"90", align:"left",   type:"ro"});	
	gridMst.addHeader({name:"수량",     colId:"ea",      width:"90", align:"right",  type:"edn"});	
	gridMst.addHeader({name:"Loss율",   colId:"loss",     width:"90", align:"right",  type:"edn"});	
	gridMst.addHeader({name:"사용일자", colId:"useDate",  width:"90", align:"center", type:"dhxCalendarA"});	
	gridMst.addHeader({name:"사용유무", colId:"useYn",   width:"90", align:"center", type:"combo"});
	gridMst.addHeader({name:"비고",     colId:"rmk",     width:"90", align:"left",   type:"ed"});
	gridMst.setUserData("","pk","no");
	gridMst.setColSort("str");
	gridMst.init(); 
	gridMst.cs_setColumnHidden(["compId"]);

	var tbrlayout01 = subLayout.cells("c");
	toolbar01 = subToolbar(toolbar01,tbrlayout01,[3,4,5,6]);
	toolbar01.attachEvent("onClick",gridMstOnClick);
	
	subLayout.cells("d").showHeader();
	subLayout.cells("d").setText("공정등록");
	
	gridDtl = new dxGrid(subLayout.cells("d"), false);
	gridDtl.addHeader({name:"NO",       colId:"no",       width:"50", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"공정",     colId:"packCode", width:"70", align:"center", type:"combo"});
	gridDtl.addHeader({name:"구분",     colId:"packName", width:"90", align:"center", type:"combo"});
	gridDtl.addHeader({name:"공정순서", colId:"packSpec", width:"90", align:"center", type:"edn"});	
	gridDtl.setUserData("","pk","no");
	gridDtl.setColSort("str");
	gridDtl.init(); 
	gridDtl.cs_setColumnHidden(["compId"]);

	var tbrlayout02 = subLayout.cells("d");
	toolbar02 = subToolbar(toolbar02,tbrlayout02,[3,4,5,6]);
	toolbar02.attachEvent("onClick",gridDtlOnClick);
	
	$("#packCode").dblclick(function(e){
		if(e.target.id == "packCode"){
			 gfn_load_pop('w1','common/selectMatrCodePOP',true,{"postName":$(this).val()});
		}
	});
});

function gridMstOnClick(id){
   if(id == "btn3"){
		  fn_mst_save(); 
	}
   if(id == "btn4"){
	   fn_mst_remove();
	}
   if(id == "btn5"){
	   fn_mst_add();
	}
   if(id == "btn6"){
	   fn_mst_delete();
	}
};

function gridDtlOnClick(id){
	if(id == "btn3"){
	  fn_dtl_save();
	}
   if(id == "btn4"){
	   fn_dtl_remove();
	}
   if(id == "btn5"){
	   fn_dtl_add();
	}
   if(id == "btn6"){
	   fn_dtl_delete();
	}
};

function disableValue(flag){
	if(flag == 1){
	  $("input[name=packCode]").attr("readonly",false);
	  $("input[name=packName]").attr("readonly",false);
	  combo04.enable();
	  
	}else{
	  $("input[name=equiCode]").attr("readonly",true);
	  $("input[name=equiName]").attr("readonly",true);
	 combo04.disable();
	}
};

function fn_search(){
	gfn_callAjaxComm({},"/erp/prod1/prod/packBomS/treeSearch",load_treeCB);
};

function load_treeCB(data){
	var treeArr = treeJsonArr(data,"keyvalue2","keyvalue1","keyvalue1");
	treeMain.loadJSArray(treeArr, function (){});
};
function treeJsonArr(jsonData,nodeNm,parentNodeNm,textNm){

	var rtnArray = new Array();
	var nodeData = {};

	$.each(jsonData, function(i, row){
		var nodeId = row[nodeNm]+"";
		var pNodeId = row[parentNodeNm]+"";
		var text = row[textNm]+"";
		var rowArray = new Array();
		rowArray.push(nodeId);
		rowArray.push(pNodeId);
		rowArray.push(text);
		rtnArray.push(rowArray); 
		nodeData[nodeId] = row;
	});
	this.nodeData = nodeData;
	return rtnArray;	
};

function fn_new(){
	byId("frmMain").reset();
	byId("frmSearch").reset();
	disableValue(1);
	gridMst.clearAll();
	gridDtl.clearAll();
	gridMst.parse("","js");
	gridDtl.parse("","js");
}

function fn_mst_save(){
	var treeCheck = treeMain.getSelectedItemId();
	if(treeCheck == ''){
		return false;
	}else{
	 var jsonStr = gridMst.getJsonUpdated2();
        if (jsonStr == null || jsonStr.length <= 0) return;         		
           $("#jsonData").val(jsonStr);  
           $.ajax({
	          url : "",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	          MsgManager.alertMsg("INF001");
	            fn_Search();
	           }
	      });
	}
}
function fn_mst_remove(){
	for(var i=0; i<gridMst.getRowsNum();i++){
		gridMst.cs_deleteRow(gridMst.getRowId(i));	 
	 }
};

function fn_mst_add(){
	var treeCheck = treeMain.getSelectedItemId();
	if(treeCheck == ''){
		return false;
	}else{
		 var totalColNum = gridMst.getColumnCount();
		 var data = new Array(totalColNum);
		 gridMst.addRow(data);
	}
};

function fn_mst_delete(){
	var rodid = gridMst.getSelectedRowId();
	gridMst.cs_deleteRow(rodid);
};

function fn_dtl_save(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
	 var jsonStr = gridDtl.getJsonUpdated2();
        if (jsonStr == null || jsonStr.length <= 0) return;         		
           $("#jsonData").val(jsonStr);  
           $.ajax({
	          url : "",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	          MsgManager.alertMsg("INF001");
	            fn_Search();
	           }
	      });
	}
};

function fn_dtl_remove(){
	for(var i=0; i<gridDtl.getRowsNum();i++){
		gridDtl.cs_deleteRow(gridDtl.getRowId(i));	 
	 }
};

function fn_dtl_add(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
	 var totalColNum = gridDtl.getColumnCount();
	 var data = new Array(totalColNum);
	    gridDtl.addRow(data);
	}
};

function fn_dtl_delete(){
	var rodid = gridDtl.getSelectedRowId();
	gridDtl.cs_deleteRow(rodid);
};
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				포장코드
		  </label>
			<div class="col-sm-2 col-md-2">
			    <input type="text" name="pCode" id="packCode" value="" placeholder="" class="form-control input-xs">		
			</div>
		  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				포장명
		  </label>
		   <div class="col-sm-2 col-md-2">
			    <input type="text" name="pName" id="packName" value="" placeholder="" class="form-control input-xs">		
		  </div>
		 </div>
	    </div>
      </div>     
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   포장코드
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="packCode" id="packCode" value="" placeholder="" class="form-control input-xs">		
			 </div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   포장명
			  </label>
			  <div class="col-sm-2 col-md-2">
			    <input type="text" name="packName" id="packName" value="" placeholder="" class="form-control input-xs">		
			 </div>
	    </div>
      </div>  
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   규격
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="unit" id="unit" value="" placeholder="" class="form-control input-xs">		
		      </div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
			 <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   단위
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="unit" id="unit" value="" placeholder="" class="form-control input-xs">		
		      </div>
	    </div>
      </div> 
  </form>
 </div> 
</div>