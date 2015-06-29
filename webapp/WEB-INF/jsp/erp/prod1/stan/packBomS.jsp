<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var treeMain;
var gridMst, gridDtl;
var toolbar01, toolbar02;
var combo01, combo02, combo03;
var popFlag = true;
var rowSelVal = '';
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

	subLayout.cells("b").attachObject("bootContainer2");
	subLayout.cells("b").setHeight(150);
	
	subLayout.cells("c").showHeader();
	subLayout.cells("c").setText("BOM등록");
	
	gridMst = new dxGrid(subLayout.cells("c"), false);
	gridMst.addHeader({name:"NO",       colId:"no",        width:"50",  align:"center", type:"cntr"});
	gridMst.addHeader({name:"품목코드", colId:"keyvalue2", width:"100", align:"left",   type:"ro"});
	gridMst.addHeader({name:"품목명",   colId:"itemName",  width:"100", align:"left",   type:"ed"});
	gridMst.addHeader({name:"규격",     colId:"itemSpec",  width:"100", align:"left",   type:"ro"});	
	gridMst.addHeader({name:"단위",     colId:"itemUnit",  width:"60",  align:"left",   type:"ro"});	
	gridMst.addHeader({name:"수량",     colId:"ea",        width:"60",  align:"right",  type:"edn"});	
	gridMst.addHeader({name:"Loss율",   colId:"loss",      width:"60",  align:"right",  type:"edn"});	
	gridMst.addHeader({name:"사용일자", colId:"useDate",   width:"90",  align:"center", type:"dhxCalendarA"});	
	gridMst.addHeader({name:"사용유무", colId:"useYn",     width:"60",  align:"center", type:"combo"});
	gridMst.addHeader({name:"비고",     colId:"rmk",       width:"150", align:"left",   type:"ed"});
	gridMst.setUserData("","pk","");
	gridMst.setColSort("str");
	gridMst.dxObj.setUserData("","@useDate","format_date");
	gridMst.init(); 
	gridMst.cs_setColumnHidden(["compId","keyvalue1"]);
	gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
	gridMst.attachEvent("onEnter",doOnEnter);
	gridMst.attachEvent("onRowSelect",doOnMstRowSelect);
	
	var tbrlayout01 = subLayout.cells("c");
	toolbar01 = subToolbar(toolbar01,tbrlayout01,[3,4,5,6]);
	toolbar01.attachEvent("onClick",gridMstOnClick);
	
	subLayout.cells("d").showHeader();
	subLayout.cells("d").setText("공정등록");
	
	gridDtl = new dxGrid(subLayout.cells("d"), false);
	gridDtl.addHeader({name:"NO",       colId:"no",       width:"50",  align:"center", type:"cntr"});
	gridDtl.addHeader({name:"공정",     colId:"progCode", width:"70",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"구분",     colId:"prodKind", width:"90",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"공정순서", colId:"progSeq",  width:"70",  align:"center", type:"edn"});	
	gridDtl.addHeader({name:"비고",     colId:"rmk",      width:"180", align:"left",   type:"ed"});	
	gridDtl.setUserData("","pk","");
	gridDtl.setColSort("str");
	gridDtl.init(); 
	gridDtl.cs_setColumnHidden(["compId","keyvalue1","keyvalue2"]);
	
	var tbrlayout02 = subLayout.cells("d");
	toolbar02 = subToolbar(toolbar02,tbrlayout02,[3,4,5,6]);
	toolbar02.attachEvent("onClick",gridDtlOnClick);
	
	combo01 =gridMst.getColumnCombo(8);
	combo02 =gridDtl.getColumnCombo(1);
	combo03 =gridDtl.getColumnCombo(2);
	gfn_single_comboLoad(combo01,["Y","N"],["사용","미사용"],2);
	gfn_1col_comboLoad(combo02,"R04");
	gfn_single_comboLoad(combo03,["1","2","3"],["자체생산","외주","구매"],3);
	
	$("#iName").dblclick(function(e){
		if(e.target.id == "iName"){
			popFlag = false;
			gfn_load_pop('w1','common/selectMatrCodePOP',true,{});	
		}
	});
	
	$("#iName").keyup(function(e){
		if(e.target.id == "iName" && e.keyCode == "13"){
			popFlag = false;
			gfn_load_pop('w1','common/selectMatrCodePOP',true,{});	
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

function doOnEnter(id,ind){
	var keyvalue1ColIdx = gridMst.getColIndexById('keyvalue1');
	var valueCheck = gridMst.setCells(id,keyvalue1ColIdx).getValue();
	if(ind==2){
		if(valueCheck == 0){
			popFlag = true;
			gfn_load_pop('w1','common/selectMatrCodePOP',true,{});	
		}else{
			gfn_load_pop('w1','common/itemAllCodePOP',true,{});	
		}
	}
};

function doOnRowDblClicked(id,ind){
	var keyvalue1ColIdx = gridMst.getColIndexById('keyvalue1');
	var valueCheck = gridMst.setCells(id,keyvalue1ColIdx).getValue();
	if(ind==1){
		if(valueCheck == 0){
			popFlag = true;
			gfn_load_pop('w1','common/selectMatrCodePOP',true,{});	
		}else{
			gfn_load_pop('w1','common/itemAllCodePOP',true,{});	
		}
		 
	}
};

function doOnMstRowSelect(id,ind){
	var keyVal1 = gridMst.getColIndexById('keyvalue1');
	var keyVal2 = gridMst.getColIndexById('keyvalue2');
	var obj={};
	obj.keyvalue1 = gridMst.setCells(id,keyVal1).getValue();
	obj.keyvalue2 = gridMst.setCells(id,keyVal2).getValue();
	fn_loadGridDtl(obj);
}

function fn_onOpenPop(pName){
	var value;
	var getId = gridMst.getSelectedRowIndex();
     if(pName == "selMatrCode"){
    	 var obj={};
    	 	if(getId == -1){
    	 		obj.matrName = $('#iName').val();
    	 	}else{
    	 		obj.matrName= gridMst.setCells2(getId,2).getValue();	
    	 	}
    		 obj.matrGubn=  3; 
    	 value = obj; 
	}
	return value;
};

function treeOnClick(id){
   loadForm(id);
   loadGridMst(id);
};

function disableValue(flag){
	if(flag == 1){
	  $("input[name=keyvalue2]").attr("readonly",false);
	  $("input[name=itemName]").attr("readonly",false);
	  
	}else{
	  $("input[name=keyvalue2]").attr("readonly",true);
	  $("input[name=itemName]").attr("readonly",true);
	}
};

function loadForm(value){
	var obj={};
	obj.keyValue = value;
	gfn_callAjaxForForm("frmMain",obj,"formSearch",fn_loadFormCB);
};

function loadGridMst(value){
	var obj={};
	obj.keyValue = value;
	gfn_callAjaxForGrid(gridMst,obj,"MstSearch",subLayout.cells("c"),fn_loadGridMstCB);
};

function fn_loadGridDtl(obj){
	gfn_callAjaxForGrid(gridDtl,obj,"DtlSearch",subLayout.cells("d"));
};

function fn_loadGridMstCB(data){
	var rowIdx = cs_selectRow_check(gridMst,"keyvalue2",rowSelVal)
	gridMst.selectRow(rowIdx,true,true,true);
}

function fn_loadFormCB(data){
	if(data == ''){
		disableValue(1);
	}else{
		disableValue(2);
	}
	
}

function fn_new(){
	byId("frmMain").reset();
	byId("frmSearch").reset();
	disableValue(1);
	gridMst.clearAll();
	gridDtl.clearAll();
	gridMst.parse("","js");
	gridDtl.parse("","js");
	fn_search();
};

function clearTree(){
	treeMain.destructor();
	treeMain = subLayout.cells("a").attachTree();
	treeMain.setImagePath("/component/dhtmlxSuite/codebase/imgs/dhxtree_skyblue/");
	treeMain.attachEvent("onClick",treeOnClick);
};

function fn_search(){
	clearTree();
	var obj={};
	obj.keyValue = $('#iCode').val();
	gfn_callAjaxComm(obj,"treeSearch",load_treeCB);
};

function load_treeCB(data){
	var treeArr = treeJsonArr(data,"keyvalue2","keyvalue1","itemName");
	treeMain.loadJSArray(treeArr, function (){});
	treeMain.selectItem(data[0].keyvalue2,true,true);
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

function fn_mst_save(){
	 var jsonStr = gridMst.getJsonUpdated2();
     if (jsonStr == null || jsonStr.length <= 0) return;         		
        $("#jsonData").val(jsonStr);  
        $.ajax({
	          url : "/erp/prod1/stan/packBomS/MstSave",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	        	  fn_mst_saveCB(data);
	           }
	      });
};

function fn_mst_saveCB(data){
	MsgManager.alertMsg("INF001");
	var rowIdx = gridMst.getSelectedRowIndex();
	var keyValue1Idx = gridMst.getColIndexById('keyvalue1');
	var keyValue2Idx = gridMst.getColIndexById('keyvalue2');
	var searchVal = null;
	var keyVal1 = gridMst.setCells2(rowIdx,keyValue1Idx).getValue();
	var keyVal2 = gridMst.setCells2(rowIdx,keyValue2Idx).getValue();
	if(keyVal1 == 0){
		searchVal  = keyVal2;
	}else{
		searchVal = keyVal1;
	}
   var keyValue = $('#iCode').val();
	if(keyValue == ''){
		 $('#iCode').val(searchVal);
	}
	fn_search();
};

function fn_mst_remove(){
	var keyvalue = gridMst.getColIndexById('keyvalue2');
	var obj={};
	obj.keyValue = gridMst.setCells2(0,keyvalue).getValue();
	  gfn_callAjaxComm(obj,"treeSearch",mstRemoveCB);
};

function mstRemoveCB(data){
	if(data.length>1){
		if(MsgManager.confirmMsg("INF007")) { 
		   for(var i=0; i<gridMst.getRowsNum();i++){
			gridMst.cs_deleteRow(gridMst.getRowId(i));	 
		   } 
		   fn_mst_save();
		}else{
			return;
		}
	}else{
		for(var i=0; i<gridMst.getRowsNum();i++){
			gridMst.cs_deleteRow(gridMst.getRowId(i));	 
		  } 
		fn_mst_save();
	}	
};

function fn_mst_add(){
	var treeCheck = treeMain.getSelectedItemId();
	if(treeCheck == ''){
		treeCheck = 0;
	}
	 var totalColNum = gridMst.getColumnCount();
	 var data = new Array(totalColNum);
	 var useDateColIdx = gridMst.getColIndexById('useDate');
	 var keyvalue1ColIdx = gridMst.getColIndexById('keyvalue1');
	 data[useDateColIdx] = dateformat(new Date());
	 data[keyvalue1ColIdx] = treeCheck;
	 gridMst.addRow(data);

};

function fn_mst_delete(){
	var rodid = gridMst.getSelectedRowId();
	var keyvalue = gridMst.getColIndexById('keyvalue2');
	var obj={};
	obj.keyValue = gridMst.setCells(rodid,keyvalue).getValue();
	var delCheck = empty_delete(gridMst,rodid);
	if(delCheck){
	  gfn_callAjaxComm(obj,"treeSearch",mstDeleteCB);
	}
};

function mstDeleteCB(data){
	if(data.length>1){
		if(MsgManager.confirmMsg("INF007")) { 
			var rodid = gridMst.getSelectedRowId();
			gridMst.cs_deleteRow(rodid); 
			fn_mst_save();
		}else{
			return;
		}
	}else{
		var rodid = gridMst.getSelectedRowId();
		gridMst.cs_deleteRow(rodid); 
		fn_mst_save();
	}
}
function empty_delete(grid,rowId){
	flag = true;
	var colIndex= grid.getColIndexById("cudKey");
	var cellObj = grid.setCells(rowId,colIndex);
	if(cellObj.getValue() == "INSERT"){
		grid.deleteRow(rowId);
		flag = false;
	}
	return flag;
};

function fn_dtl_save(){
	var rowIdx = gridDtl.getSelectedRowIndex();
	var colIdx = gridDtl.getColIndexById('keyvalue2');
	rowSelVal=gridDtl.setCells2(rowIdx, colIdx).getValue();
	
	 var jsonStr = gridDtl.getJsonUpdated2();
        if (jsonStr == null || jsonStr.length <= 0) return;         		
           $("#jsonData").val(jsonStr);  
           $.ajax({
	          url : "/erp/prod1/stan/packBomS/DtlSave",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	          MsgManager.alertMsg("INF001");
	            fn_search();
	            rowSelVal = null;
	           }
	      });
};

function fn_dtl_remove(){
	for(var i=0; i<gridDtl.getRowsNum();i++){
		gridDtl.cs_deleteRow(gridDtl.getRowId(i));	 
	 }
};

function fn_dtl_add(){
	var rowCheck = gridMst.getSelectedRowId();
	var keyvalue1Mst = gridMst.getColIndexById('keyvalue1');
	var keyvalue2Mst = gridMst.getColIndexById('keyvalue2');
	if(rowCheck == null){
		return false;
	}else{
	 var totalColNum = gridDtl.getColumnCount();
	 var data = new Array(totalColNum);
	 var keyvalue1Dtl = gridDtl.getColIndexById('keyvalue1');
	 var keyvalue2Dtl = gridDtl.getColIndexById('keyvalue2');	
		data[keyvalue1Dtl] = gridMst.setCells(rowCheck,keyvalue1Mst).getValue();
		data[keyvalue2Dtl] = gridMst.setCells(rowCheck,keyvalue2Mst).getValue();
	    gridDtl.addRow(data);
	}
};

function fn_dtl_delete(){
	var rodid = gridDtl.getSelectedRowId();
	gridDtl.cs_deleteRow(rodid);
};

function fn_onClosePop(pName,data){
	var getId = gridMst.getSelectedRowIndex();
	var keyvalue2ColIdx = gridMst.getColIndexById('keyvalue2');
	var itemNameColIdx = gridMst.getColIndexById('itemName');
	var itemSpecColIdx = gridMst.getColIndexById('itemSpec');
	var itemUnitColIdx = gridMst.getColIndexById('itemUnit');
	 if(pName == "selMatrCode"){
		 if(popFlag){
			gridMst.setCells2(getId,keyvalue2ColIdx).setValue(data[0].matrCode);
			gridMst.setCells2(getId,itemNameColIdx).setValue(data[0].matrName);
			gridMst.setCells2(getId,itemSpecColIdx).setValue(data[0].matrSpec);
			gridMst.setCells2(getId,itemUnitColIdx).setValue(data[0].matrUnit); 
		 }else{
			 $('#iCode').val(data[0].matrCode);
			 $('#iName').val(data[0].matrName);
		 }
	  }	
	 if(pName == "itemAllCode"){
		 if(itemCode_Check(data[0].itemCode)){
			 MsgManager.alertMsg("WRN010");
			 return;
		 }else{
			 gridMst.setCells2(getId,keyvalue2ColIdx).setValue(data[0].itemCode);
			 gridMst.setCells2(getId,itemNameColIdx).setValue(data[0].itemName);
			 gridMst.setCells2(getId,itemSpecColIdx).setValue(data[0].itemSpec);
			 gridMst.setCells2(getId,itemUnitColIdx).setValue(data[0].itemUnit);
		 }
	  }	 
};
function itemCode_Check(itemCode){
	flag = false;
	for(var i=0;i<gridMst.getRowsNum();i++){
		 var orinVal = gridMst.setCells2(i,1).getValue();
		 if(orinVal == itemCode){
			 flag = true;
			 break;
		 }else{
			 flag = false;
		 }
	}
	return flag;
}
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				포장명
		  </label>
		    <div class="col-sm-4 col-md-4">
		       <div class="col-sm-5 col-md-5">
			     <input type="text" name="iCode" id="iCode" value="" placeholder="" class="form-control input-xs" readonly="readonly">		
			   </div>
			   <div class="col-sm-6 col-md-6" style="margin-left: 5px;">
				    <input type="text" name="iName" id="iName" value="" placeholder="" class="form-control input-xs">		
			  </div>
		    </div>
		 </div>
	    </div>
      </div>     
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   포장코드
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="keyvalue2" id="keyvalue2" value="" placeholder="" class="form-control input-xs">		
			 </div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   포장명
			  </label>
			  <div class="col-sm-2 col-md-2">
			    <input type="text" name="itemName" id="itemName" value="" placeholder="" class="form-control input-xs">		
			 </div>
	    </div>
      </div>  
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   규격
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="itemSpec" id="itemSpec" value="" placeholder="" class="form-control input-xs">		
		      </div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
			 <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   단위
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="itemUnit" id="itemUnit" value="" placeholder="" class="form-control input-xs">		
		      </div>
	    </div>
      </div> 
  </form>
 </div> 
</div>