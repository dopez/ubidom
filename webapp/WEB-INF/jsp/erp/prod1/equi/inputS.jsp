<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,5,6],"2E");
	//입고등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	 subLayout.cells("a").showHeader();
	 subLayout.cells("a").setText("발주내역");
	 gridMst = new dxGrid(subLayout.cells("a"),false);
	 gridMst.addHeader({name:"No",         colId:"no",          width:"50", align:"center", type:"cntr"});
	 gridMst.addHeader({name:"발주일자",   colId:"setDate",     width:"80", align:"center", type:"ro"});
	 gridMst.addHeader({name:"공급업체",   colId:"custKorName", width:"80", align:"left",   type:"ro"});
	 gridMst.addHeader({name:"부품코드",   colId:"partCode",    width:"80", align:"left",   type:"ro"});
	 gridMst.addHeader({name:"부품명",     colId:"partName",    width:"80", align:"left",   type:"ro"});
	 gridMst.addHeader({name:"규격",       colId:"partSpec",    width:"80", align:"left",   type:"ro"});
	 gridMst.addHeader({name:"단위",       colId:"partUnit",    width:"80", align:"left",   type:"ro"});
	 gridMst.addHeader({name:"발주수량",   colId:"qty",         width:"60", align:"right",  type:"ro"});
	 gridMst.addHeader({name:"입고수량",   colId:"inputQty",    width:"60", align:"right",  type:"ro"});
	 gridMst.addHeader({name:"미입고수량", colId:"miQty",       width:"80", align:"right",  type:"ro"});
	 gridMst.setUserData("","pk","no");
	 gridMst.setColSort("str");
	 gridMst.dxObj.setUserData("","@setDate","format_date");
	 gridMst.init();	
	 gridMst.cs_setColumnHidden(["compId","setSeq","setNo","custCode","orderKey","cost"]);
	 gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
    //선택 없애고 더블클릭으로 변경
    
	 subLayout.cells("b").showHeader();
	  subLayout.cells("b").setText('입고내역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
	     '&nbsp;&nbsp;<input type="button" value=" 선택항목 추가" onclick="multiRowSelect()" class="imgTest" style="color: blue; background-color: buttonhighlight;"');
	 gridDtl = new dxGrid(subLayout.cells("b"),false);
	 gridDtl.addHeader({name:"No",         colId:"no",         width:"50",  align:"center", type:"cntr"});
	 gridDtl.addHeader({name:"부품코드",   colId:"partCode",   width:"80",  align:"left",   type:"ro"});
	 gridDtl.addHeader({name:"부품명",     colId:"partName",   width:"80",  align:"left",   type:"ro"});
	 gridDtl.addHeader({name:"규격",       colId:"partSpec",   width:"80",  align:"left",   type:"ro"});
	 gridDtl.addHeader({name:"단위",       colId:"partUnit",   width:"80",  align:"left",   type:"ro"});
	 gridDtl.addHeader({name:"입고수량",   colId:"qty",        width:"70",  align:"right",  type:"ed"});
	 gridDtl.addHeader({name:"입고단가",   colId:"cost",       width:"70",  align:"right",  type:"ro"});
	 gridDtl.addHeader({name:"입고금액",   colId:"amt",        width:"70",  align:"right",  type:"ro"});
	 gridDtl.addHeader({name:"비고",       colId:"rmk",        width:"180", align:"right",  type:"ro"});
	 gridDtl.setUserData("","pk","no");
	 gridDtl.setColSort("str");
	 gridDtl.init();
	 gridDtl.attachEvent("onRowSelect",doOnRowSelect);
	 gridDtl.attachEvent("onCellChanged",doOnCellChanged);
	 gridDtl.cs_setColumnHidden(["custCode","orderKey","setSeq","setNo","compId","inputEmp","oldQty","orderKey"]);
	 $("#korName,#supplyComp").click(function(e){
			if(e.target.id == "korName"){
				gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
			  }
			if(e.target.id == "supplyComp"){
				gfn_load_pop('w1','common/customPOP',true,{"supplyComp":$(this).val()});
			}
	    })
	 
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	if($('#stDate').val() == ''){
		  byId("stDate").value = t;
		}
	
	fn_loadGridMst();
	fn_search();	
});
function doOnRowDblClicked(rId,cInd){
	if($('#korName').val() == ''){
		dhtmlx.alert("등록자는 필수 항목입니다.");
		return;
	}else if($('#supplyComp').val() == ''){
		dhtmlx.alert("공급업체는 필수 항목입니다.");
		return;
	}else{
		var totalColNum = gridDtl.getColumnCount();
	    var data = new Array(totalColNum);
		var partCodeColIdx   = gridDtl.getColIndexById('partCode');    
		var partNameColIdx   = gridDtl.getColIndexById('partName');
		var partSpecColIdx   = gridDtl.getColIndexById('partSpec');    
		var partUnitColIdx   = gridDtl.getColIndexById('partUnit');  
		var qtyColIdx        = gridDtl.getColIndexById('qty');
		var costColIdx       = gridDtl.getColIndexById('cost'); 
		var amtColIdx        = gridDtl.getColIndexById('amt');
		var orderKeyColIdx   = gridDtl.getColIndexById('orderKey');
		var compIdColIdx     = gridDtl.getColIndexById('compId');
		var inputEmpColIdx   = gridDtl.getColIndexById('inputEmp');
		  data[partCodeColIdx]   = gridMst.setCells(rId,3).getValue();
	      data[partNameColIdx]   = gridMst.setCells(rId,4).getValue();
	      data[partSpecColIdx]   = gridMst.setCells(rId,5).getValue();
	      data[partUnitColIdx]   = gridMst.setCells(rId,6).getValue();
	      data[qtyColIdx]        = gridMst.setCells(rId,9).getValue();
	      data[costColIdx]       = gridMst.setCells(rId,15).getValue();
	      data[compIdColIdx]     = gridMst.setCells(rId,10).getValue();
	      data[orderKeyColIdx]   = gridMst.setCells(rId,14).getValue();
	      data[inputEmpColIdx]   = $('#empNo').val();
	      data[amtColIdx]   = (data[qtyColIdx]*1) * (data[costColIdx]*1);
		  gridDtl.addRow(data);
		  var delInx = gridMst.getSelectedRowIndex();
		  gridMst.deleteRow(rId);
	}
};

function multiRowSelect(){
	if($('#korName').val() == ''){
		dhtmlx.alert("등록자는 필수 항목입니다.");
		return;
	}else if($('#supplyComp').val() == ''){
		dhtmlx.alert("공급업체는 필수 항목입니다.");
		return;
	}else{
		var selRowId = {};
	    	selRowId = gridMst.getSelectedRowId();
	   	var selRowIdArr = selRowId.split(",");
	 
		var totalRowNum = gridMst.getRowsNum();
		for(i=0;i<selRowIdArr.length;i++){
			var totalColNum = gridDtl.getColumnCount();
		    var data = new Array(totalColNum);
		    var partCodeColIdx   = gridDtl.getColIndexById('partCode');    
			var partNameColIdx   = gridDtl.getColIndexById('partName');
			var partSpecColIdx   = gridDtl.getColIndexById('partSpec');    
			var partUnitColIdx   = gridDtl.getColIndexById('partUnit');   
			var qtyColIdx        = gridDtl.getColIndexById('qty');
			var costColIdx       = gridDtl.getColIndexById('cost');  
			var amtColIdx        = gridDtl.getColIndexById('amt');
			var orderKeyColIdx   = gridDtl.getColIndexById('orderKey');
			var compIdColIdx     = gridDtl.getColIndexById('compId');
			var inputEmpColIdx   = gridDtl.getColIndexById('inputEmp');
			var oldQtyColIdx     = gridDtl.getColIndexById('oldQty');
			  data[partCodeColIdx]   = gridMst.setCells(selRowIdArr[i],3).getValue();
		      data[partNameColIdx]   = gridMst.setCells(selRowIdArr[i],4).getValue();
		      data[partSpecColIdx]   = gridMst.setCells(selRowIdArr[i],5).getValue();
		      data[partUnitColIdx]   = gridMst.setCells(selRowIdArr[i],6).getValue();
		      data[qtyColIdx]        = gridMst.setCells(selRowIdArr[i],9).getValue();
		      data[costColIdx]       = gridMst.setCells(selRowIdArr[i],15).getValue();
		      data[compIdColIdx]     = gridMst.setCells(selRowIdArr[i],10).getValue();
		      data[orderKeyColIdx]   = gridMst.setCells(selRowIdArr[i],14).getValue();
		      data[inputEmpColIdx]   = $('#empNo').val();
		      data[oldQtyColIdx]     = gridMst.setCells(selRowIdArr[i],9).getValue();
		      data[amtColIdx]   = (data[qtyColIdx]*1) * (data[costColIdx]*1);
		      gridDtl.addRow(data);
			  var delInx = gridMst.getSelectedRowIndex();
			  gridMst.deleteRow(selRowIdArr[i]);
	   	  }
	}
}

function doOnCellChanged(rId,cInd,nValue){
	if(cInd==5){
		doOnRowSelect(rId,cInd);
	  }
}
function doOnRowSelect(id,ind){
	totalQtyCalcul(id);
};

function totalQtyCalcul(id){
	sum = gridDtl.setCells(id,7).getValue()*1;
	qtyValue = gridDtl.setCells(id,5).getValue()*1;
	costValue = gridDtl.setCells(id,6).getValue()*1;
	sum = (qtyValue*costValue);
	gridDtl.setCells(id,7).setValue(sum);
};

function fn_search(){
	fn_loadGridDtl();
};

function fn_loadGridMst(){
	gfn_callAjaxForGrid(gridMst,{},"gridMstSearch",subLayout.cells("a"));
};

function fn_loadGridDtl(){
	$("input[name=setSeq]").attr("disabled",false);
	if($('#custCode').val() == ''){
		$('#custCode').val('%');
	}
	var obj = gfn_getFormElemntsData("frmMain");
	gfn_callAjaxForGrid(gridDtl,obj,"gridDtlSearch",subLayout.cells("b"),fn_loadGridDtlCB);
};

function fn_loadGridDtlCB(data){
	$("input[name=setSeq]").attr("disabled",true);
	if(data == null || data == ''){
		$('#supplyComp').val('');
		$('#custCode').val('');
	}else{
		$('#supplyComp').val(data[0].custKorName);
		$('#custCode').val(data[0].custCode);
	}
	
	$('#stDate').keyup();
};

function fn_new(){
	gridDtl.clearAll();
	girdDtl.parse("","js");
	fn_loadGridMst();
	$('#setSeq').val('');	
};

function fn_getSeqReturn(){
	 var obj = {};
	    obj.tableName = 'TBL_EQUI_PARTCODE_INPUT';
	    obj.seqColumn = 'SET_SEQ';
	    obj.dateColumn1 = 'SET_DATE';
	    obj.columnData1 = searchDate($("#stDate").val());
	    obj.returnLen = 2;
	    gfn_callAjaxComm(obj,"/erp/comm/stan/tableSeq/selTableSeq1",fn_SetSeq); 
};

function fn_SetSeq(data) {
   $("#setSeq").val(data[0].seq);
   for(var i=0; i<gridDtl.getRowsNum();i++){
	   gridDtl.setCells2(i,11).setValue(data[0].seq);
		}  
}; 

function fn_save(){
	if($('#setSeq').val() != ''){
		var seqValue = $('#setSeq').val();
		 for(var i=0; i<gridDtl.getRowsNum();i++){
			 gridDtl.setCells2(i,11).setValue(seqValue);
			} 
	}else{
		fn_getSeqReturn();
	}
	  var setDate = $('#stDate').val();
	var custCode = $('#custCode').val();
	$('#setDate').val(setDate);
	for(var i=0; i<gridDtl.getRowsNum();i++){
		 gridDtl.setCells2(i,9).setValue(custCode);
		}
	 var jsonStr = gridDtl.getJsonUpdated2();
  if (jsonStr == null || jsonStr.length <= 0) return;         		
      $("#jsonData").val(jsonStr);  
      var params = gfn_getFormElemntsData("pform");
       $.ajax({
         url : "/erp/prod1/equi/inputS/gridDtlSave",
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
	for(var i=0; i<gridDtl.getRowsNum();i++){
		gridDtl.cs_deleteRow(gridDtl.getRowId(i));	 
	 }
};

function fn_add(){
	var rowCheck = gridDtl.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
		var totalColNum = gridDtl.getColumnCount();
	    var data = new Array(totalColNum);
	    var partCodeColIdx   = gridDtl.getColIndexById('partCode');    
		var partNameColIdx   = gridDtl.getColIndexById('partName');
		var partSpecColIdx   = gridDtl.getColIndexById('partSpec');    
		var partUnitColIdx   = gridDtl.getColIndexById('partUnit');
		var qtyColIdx        = gridDtl.getColIndexById('qty');
		var costColIdx       = gridDtl.getColIndexById('cost'); 
		var amtColIdx        = gridDtl.getColIndexById('amt');
		var orderKeyColIdx   = gridDtl.getColIndexById('orderKey');
		var compIdColIdx     = gridDtl.getColIndexById('compId');
		var inputEmpColIdx   = gridDtl.getColIndexById('inputEmp');
		var oldQtyColIdx     = gridDtl.getColIndexById('oldQty');
		  data[partCodeColIdx]   = gridDtl.setCells(rowCheck,1).getValue();
	      data[partNameColIdx]   = gridDtl.setCells(rowCheck,2).getValue();
	      data[partSpecColIdx]   = gridDtl.setCells(rowCheck,3).getValue();
	      data[partUnitColIdx]   = gridDtl.setCells(rowCheck,4).getValue();
	      data[qtyColIdx]        = gridDtl.setCells(rowCheck,5).getValue();
	      data[costColIdx]       = gridDtl.setCells(rowCheck,6).getValue();
	      data[compIdColIdx]     = gridDtl.setCells(rowCheck,13).getValue();
	      data[orderKeyColIdx]   = gridDtl.setCells(rowCheck,16).getValue();
	      data[inputEmpColIdx]   = $('#empNo').val();
	      data[oldQtyColIdx]     = gridDtl.setCells(rowCheck,5).getValue();
	      data[amtColIdx]        = gridDtl.setCells(rowCheck,7).getValue();
		  gridDtl.addRow(data);
	}
};

function fn_delete(){
	var rodid = gridDtl.getSelectedRowId();
	gridDtl.cs_deleteRow(rodid); 
};

function fn_onClosePop(pName,data){
	var i;
	var obj={};
	 if(pName == "empNo"){ 
		$('#korName').val(data[0].korName);
		$('#empNo').val(data[0].empNo);
		for(var i=0; i<gridDtl.getRowsNum();i++){
		gridDtl.setCells2(i,14).setValue(data[0].empNo);
		}
	}
	if(pName == "custCode"){
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
                      <input name="stDate" id="stDate" type="text" value="${setDate}" placeholder="" class="form-control input-xs format_date">
                  </div>
                  <div class="col-sm-2 col-md-2">
                        <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
              </div>
              <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="setSeq" id="setSeq" type="text" value="${setSeq}" placeholder="" class="form-control input-xs" disabled="disabled">
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
			     <input name="supplyComp" id="supplyComp" type="text" value=""  class="form-control input-xs">
			   </div>
		     </div>
	      </div>
	   </div>
     </form>
   </div>    
</div>