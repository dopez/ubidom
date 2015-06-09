<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,5,6],"1C");
	//발주등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
    gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"No",       colId:"no",          width:"3",  align:"center", type:"cntr"});
    gridMain.addHeader({name:"부품코드", colId:"partCode",    width:"5",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"부품명",   colId:"partName",    width:"5",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"규격",     colId:"partSpec",    width:"5",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"단위",     colId:"partUnit",    width:"5",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"수량",     colId:"qty",         width:"5",  align:"right",  type:"edn"});
    gridMain.addHeader({name:"단가",     colId:"cost",        width:"5",  align:"right",  type:"edn"});
    gridMain.addHeader({name:"금액",     colId:"amt",         width:"5",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"납기일자", colId:"deliReqDate", width:"5",  align:"center", type:"dhxCalendarA"});
    gridMain.addHeader({name:"납품장소", colId:"deliReqArea", width:"12", align:"left",   type:"ed"});
    gridMain.addHeader({name:"비고",     colId:"rmk",         width:"12", align:"left",   type:"ed"});
    gridMain.setUserData("","pk","no");
    gridMain.setColSort("str");
    gridMain.dxObj.setUserData("","@deliReqDate","format_date");
    gridMain.init();	
    gridMain.cs_setColumnHidden(["orderEmp","custCode","setSeq","setNo"]);
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	gridMain.attachEvent("onCellChanged",doOnCellChanged);
	
    $("#korName,#orderPrint,#supplyComp").click(function(e){
		if(e.target.id == "korName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		  }
		if(e.target.id == "orderPrint"){
			
		  }
		if(e.target.id == "supplyComp"){
			gfn_load_pop('w1','common/customPOP',true,{"supplyComp":$(this).val()});
		}
    })

    calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
	
});
function doOnCellChanged(rId,cInd,nValue){
	if(cInd==6){
		doOnRowSelect(rId,cInd);
	   }
}
function doOnRowSelect(id,ind){
	if(ind==1){
		gfn_load_pop('w1','prod1/compHistoryPOP',true,{});
	}
	totalTimeCalcul(id);
};

function totalTimeCalcul(id){
	sum = gridMain.setCells(id,7).getValue()*1;
	qtyValue = gridMain.setCells(id,5).getValue()*1;
	costValue = gridMain.setCells(id,6).getValue()*1;
	sum = (qtyValue*costValue);
	gridMain.setCells(id,7).setValue(sum);
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
	$('#supplyComp').val('');
	$('#custCode').val('');
	$('#stDate').keyup();
}

function fn_new(){
	gridMain.clearAll();
	$('#setSeq').val('');
};

function fn_save(){
	if($('#setSeq').val() != ''){
		var seqValue = $('#setSeq').val();
		 for(var i=0; i<gridMain.getRowsNum();i++){
			  gridMain.setCells2(i,13).setValue(seqValue);
			} 
	}else{
		fn_getSeqReturn();
	}
	  var setDate = $('#stDate').val();
	var custCode = $('#custCode').val();
	$('#setDate').val(setDate);
	for(var i=0; i<gridMain.getRowsNum();i++){
		  gridMain.setCells2(i,12).setValue(custCode);
		}
	 var jsonStr = gridMain.getJsonUpdated2();
  if (jsonStr == null || jsonStr.length <= 0) return;         		
      $("#jsonData").val(jsonStr);  
      var params = gfn_getFormElemntsData("pform");
       $.ajax({
         url : "/erp/prod1/equi/orderS/gridMainSave",
         type : "POST",
         data : params,
         async : true,
         success : function(data) {
         MsgManager.alertMsg("INF001");
          fn_search();
          }
     });   
};

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
	var i;
	var obj={};
	 if(pName == "empNo"){
		$('#korName').val(data[0].korName);
		$('#empNo').val(data[0].empNo);
		for(var i=0; i<gridMain.getRowsNum();i++){
			  gridMain.setCells2(i,11).setValue(data[0].empNo);
			}
	}
	 if(pName == "partCode"){
			for(i=0;i<data.length;i++){
				var rowIdx = gridMain.getSelectedRowIndex();
				gridMain.setCells2(rowIdx,1).setValue(data[i].partCode);
				gridMain.setCells2(rowIdx,2).setValue(data[i].partName);
				gridMain.setCells2(rowIdx,3).setValue(data[i].partSpec);
				gridMain.setCells2(rowIdx,4).setValue(data[i].partUnit);
			}
	  }if(pName == "custCode"){
		$('#supplyComp').val(data[0].custKorName);
		$('#custCode').val(data[0].custCode);
	  } 
 };
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
                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                      </div>
                    <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                    </div>              
                   </div>
                  <div class="col-sm-1 col-md-1">
                     <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="setSeq" id="setSeq" type="text" value="" class="form-control input-xs" disabled="disabled">
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