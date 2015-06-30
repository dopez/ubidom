<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
var popCheck = 0;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,5,6],"1C");
	//발주등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
    gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"No",       colId:"no",          width:"50",  align:"center", type:"cntr"});
    gridMain.addHeader({name:"부품코드", colId:"partCode",    width:"80",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"부품명",   colId:"partName",    width:"80",  align:"left",   type:"ed"});
    gridMain.addHeader({name:"규격",     colId:"partSpec",    width:"80",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"단위",     colId:"partUnit",    width:"80",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"수량",     colId:"qty",         width:"60",  align:"right",  type:"edn"});
    gridMain.addHeader({name:"단가",     colId:"cost",        width:"60",  align:"right",  type:"edn"});
    gridMain.addHeader({name:"금액",     colId:"amt",         width:"60",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"납기일자", colId:"deliReqDate", width:"80",  align:"center", type:"dhxCalendarA"});
    gridMain.addHeader({name:"납품장소", colId:"deliReqArea", width:"180", align:"left",   type:"ed"});
    gridMain.addHeader({name:"비고",     colId:"rmk",         width:"180", align:"left",   type:"ed"});
    gridMain.setUserData("","pk","no");
    gridMain.setColSort("str");
    gridMain.dxObj.setUserData("","@deliReqDate","format_date");
    gridMain.init();	
    gridMain.cs_setColumnHidden(["orderEmp","custCode","setSeq","setNo","custKorName"]);
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	gridMain.attachEvent("onCellChanged",doOnCellChanged);
	gridMain.attachEvent("onEnter",doOnEnter);
	
    $("#korName,#orderPrint,#supplyComp").click(function(e){
		if(e.target.id == "korName"){
			popCheck = 1;
			gfn_load_pop('w1','common/codeLen2POP',true,{});
		  }
		if(e.target.id == "orderPrint"){
			//발주서 인쇄
		  }
		if(e.target.id == "supplyComp"){
			popCheck = 2;
			gfn_load_pop('w1','common/codeLen2POP',true,{});
		}
    })
    
    calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	if($('#stDate').val() == ''){
	  byId("stDate").value = t;
	}
	
	fn_search();
});
function fn_onOpenPop(pName){
	var obj = {};
	if(pName == 'codeLen2'){
		if(popCheck == 1){
			obj.innerName = $('#korName').val();
			obj.kind = '사원';
		}else{
			obj.innerName = $('#supplyComp').val();
			obj.kind = '고객';
		}
	}else{
		var rowIdx = gridMain.getSelectedRowIndex();
		obj.innerName = gridMain.setCells2(rowIdx,2).getValue();
		obj.kind = '설비부품';
	}
	return obj;
}
function doOnEnter(id,ind){
	if(ind==2){
		gfn_load_pop('w1','common/codeLen4POP',true,{});
	}
}
function doOnCellChanged(rId,cInd,nValue){
	if(cInd==6){
		doOnRowSelect(rId,cInd);
	   }
}
function doOnRowDblClicked(id,ind){
	if(ind==1){
		gfn_load_pop('w1','common/codeLen4POP',true,{});
	}
}
function doOnRowSelect(id,ind){
	totalQtyCalcul(id);
};

function totalQtyCalcul(id){
	var qtyColIdx = gridMain.getColIndexById('qty');
	var costColIdx = gridMain.getColIndexById('cost');
	var amtColIdx = gridMain.getColIndexById('amt');
	
	sum = gridMain.setCells(id,amtColIdx).getValue()*1;
	qtyValue = gridMain.setCells(id,qtyColIdx).getValue()*1;
	costValue = gridMain.setCells(id,costColIdx).getValue()*1;
	sum = (qtyValue*costValue);
	gridMain.setCells(id,amtColIdx).setValue(sum);
};

function fn_getSeqReturn(){
	 var obj = {};
	    obj.tableName = 'TBL_EQUI_PARTCODE_ORDER';
	    obj.seqColumn = 'SET_SEQ';
	    obj.dateColumn1 = 'SET_DATE';
	    obj.columnData1 = searchDate($("#stDate").val());
	    obj.returnLen = 2;
	    gfn_callAjaxComm(obj,"/erp/comm/stan/tableSeq/selTableSeq1",fn_SetSeq); 
};

 function fn_SetSeq(data) {
    $("#setSeq").val(data[0].seq);
    for(var i=0; i<gridMain.getRowsNum();i++){
		  gridMain.setCells2(i,13).setValue(data[0].seq);
		}  
}; 

function fn_search(){
	fn_loadGridMain();
};

function fn_loadGridMain(){
	$("input[name=setSeq]").attr("disabled",false);
	var obj = gfn_getFormElemntsData("frmMain");
	gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
};

function fn_loadGridMainCB(data){
	$("input[name=setSeq]").attr("disabled",true);
	console.log(data);
	if(data == null || data == ''){
		$('#supplyComp').val('');
		$('#custCode').val('');	
	}else{
		$('#supplyComp').val(data[0].custKorName);
		$('#custCode').val(data[0].custCode);	
	}
	
	$('#stDate').keyup();
}

function fn_new(){
	gridMain.clearAll();
	$('#setSeq').val('');
};

function fn_save(){
	var setSeqColIdx   = gridMain.getColIndexById('setSeq');
	var custCodeColIdx = gridMain.getColIndexById('custCode');
	
	if($('#setSeq').val() != ''){
		var seqValue = $('#setSeq').val();
		 for(var i=0; i<gridMain.getRowsNum();i++){
			  gridMain.setCells2(i,setSeqColIdx).setValue(seqValue);
			} 
	}else{
		fn_getSeqReturn();
	}
	  var setDate = $('#stDate').val();
	var custCode = $('#custCode').val();
	$('#setDate').val(setDate);
	for(var i=0; i<gridMain.getRowsNum();i++){
		  gridMain.setCells2(i,custCodeColIdx).setValue(custCode);
		}
	 var jsonStr = gridMain.getJsonUpdated2();
  if (jsonStr == null || jsonStr.length <= 0) return;         		
      $("#jsonData").val(jsonStr);  
      var params = gfn_getFormElemntsData("pform");
       gfn_callAjaxComm(params,"gridMainSave",fn_MainSaveCB);    
};
function fn_MainSaveCB(data){
	fn_search();
}
function fn_remove(){
	for(var i=0; i<gridMain.getRowsNum();i++){
		gridMain.cs_deleteRow(gridMain.getRowId(i));	 
	 }
};

function fn_add(){
	if($('#korName').val() == ''){
		dhtmlx.alert("등록자는 필수 항목입니다.");
		return;
	}else if($('#supplyComp').val() == ''){
		dhtmlx.alert("공급업체는 필수 항목입니다.");
		return;
	}else{
	 var totalColNum = gridMain.getColumnCount();
	 var data = new Array(totalColNum);
		var qtyColIdx = gridMain.getColIndexById('qty');
		var costColIdx = gridMain.getColIndexById('cost');
		var amtColIdx = gridMain.getColIndexById('amt');
		var deliReqDateColIdx = gridMain.getColIndexById('deliReqDate');
		var orderEmpColIdx = gridMain.getColIndexById('orderEmp');
	        data[qtyColIdx] = 0;
	        data[costColIdx] = 0;
	        data[amtColIdx] = 0;
	        data[deliReqDateColIdx] = dateformat(new Date());
	        data[orderEmpColIdx] = $('#empNo').val();
	        gridMain.addRow(data);
	}        
};

function fn_delete(){
	var rodid = gridMain.getSelectedRowId();
	  gridMain.cs_deleteRow(rodid); 
};

 function fn_onClosePop(pName,data){
	    if(pName == "codeLen2"){
			  if(popCheck == 1){
				  $('#korName').val(data[0].innerName);
					$('#empNo').val(data[0].innerCode);
					for(var i=0; i<gridMain.getRowsNum();i++){
						  gridMain.setCells2(i,11).setValue(data[0].innerCode);
						}
			  }else{
				  $('#supplyComp').val(data[0].innerName);
					$('#custCode').val(data[0].innerCode); 
			  }
		  }else{
			  var rowIdx = gridMain.getSelectedRowIndex();
				gridMain.setCells2(rowIdx,1).setValue(data[0].innerCode);
				gridMain.setCells2(rowIdx,2).setValue(data[0].innerName);
				gridMain.setCells2(rowIdx,3).setValue(data[0].spec);
				gridMain.setCells2(rowIdx,4).setValue(data[0].unit); 
		  }
	 };
 function fn_exit(){
		var exitVal = cs_close_event([gridMain]);
		if(exitVal){
			mainTabbar.tabs(ActTabId).close();	
		}else{
			if(MsgManager.confirmMsg("WRN012")){
				mainTabbar.tabs(ActTabId).close();	
			}else{
				return true;
			}
		} 
}
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="setDate" name="setDate" class="format_date">
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
         <input type="hidden" name="empNo" id="empNo" value="${empNo}"> 
         <input type="hidden" name="custCode" id="custCode" value=""> 
          <div class="row">
		     <div class="form-group form-group-sm">
		        <div class="col-sm-8 col-md-8">
			       <label class="col-sm-2 col-md-2 control-label" for="textinput">
			        일자 
			       </label>
			       <div class="col-sm-2 col-md-2">
                      <div class="col-sm-10 col-md-10">
                        <input name="stDate" id="stDate" type="text" value="${setDate}" placeholder="" class="form-control input-xs format_date">
                      </div>
                    <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                    </div>              
                   </div>
                  <div class="col-sm-1 col-md-1">
                     <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="setSeq" id="setSeq" type="text" value="${setSeq}" class="form-control input-xs" disabled="disabled">
                     </div>
                 </div>
		      </div>
	        </div>
          </div>     
          <div class="row">
	        <div class="form-group form-group-sm">
		       <div class="col-sm-8 col-md-8">
			     <label class="col-sm-2 col-md-2 control-label" for="textinput">
			       등록자
			     </label>
			     <div class="col-sm-2 col-md-2">
			        <input name="korName" id="korName" type="text" value="${empName}" placeholder="" class="form-control input-xs">
			     </div>
		       </div>
	        </div>
	      </div>
          <div class="row">
	        <div class="form-group form-group-sm">
		       <div class="col-sm-8 col-md-8">
			     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		 	       공급업체
			     </label>
			     <div class="col-sm-2 col-md-2">
			       <input name="supplyComp" id="supplyComp" type="text" value="" placeholder="" class="form-control input-xs">
			     </div>
			     <div class="col-sm-2 col-md-2" style="margin-left: 5px;">
		           <button type="button"  class="btn btn-default form-control" name="orderPrint" id="orderPrint">발주서인쇄</button>
		        </div>
		       </div>
	       </div>
	     </div>
       </form>
   </div>    
</div>