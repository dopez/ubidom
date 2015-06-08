<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
var PscrnParm = parent.scrnParm;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,5,6],"1C");
	//발주등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
    gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"No",       colId:"no",        width:"3",align:"center", type:"cntr"});
    gridMain.addHeader({name:"부품코드", colId:"partCode",  width:"5",align:"center", type:"ro"});
    gridMain.addHeader({name:"부품명",   colId:"partName",  width:"5",align:"center", type:"ro"});
    gridMain.addHeader({name:"규격",     colId:"partSpec",  width:"5",align:"center", type:"ro"});
    gridMain.addHeader({name:"단위",     colId:"partUnit",  width:"5",align:"center", type:"ro"});
    gridMain.addHeader({name:"수량",     colId:"amount",    width:"5",align:"center", type:"ed"});
    gridMain.addHeader({name:"단가",     colId:"unitPrice", width:"5",align:"center", type:"ed"});
    gridMain.addHeader({name:"금액",     colId:"money",     width:"5",align:"center", type:"ed"});
    gridMain.addHeader({name:"납기일자", colId:"nabgiDate", width:"5",align:"center", type:"dhxCalendarA"});
    gridMain.addHeader({name:"납품장소", colId:"nabgiAddr", width:"5",align:"center", type:"ed"});
    gridMain.setUserData("","pk","no");
    gridMain.setColSort("str");
    gridMain.dxObj.setUserData("","@nabgiDate","format_date");
    gridMain.init();	
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
    
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
	
	//seq
    fn_getSeqReturn();
	
    $("#korName,#orderPrint,#supplyComp").click(function(e){
		if(e.target.id == "korName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		  }
		if(e.target.id == "orderPrint"){
			
		  }
		if(e.target.id == "supplyComp"){
			cFlag = true;
			gfn_load_pop('w1','common/supplyCompCodePOP',true,{"supplyComp":$(this).val()});
		}
    })
	fn_search();

});
function doOnRowSelect(id,ind){
	if(ind==1){
		gfn_load_pop('w1','prod1/compHistoryPOP',true,{});
	}
};

function fn_getSeqReturn(){
	/*  var obj = {};
	    obj.tableName = '테이블명';
	    obj.seqColumn = 'LOG_SEQ';
	    obj.dateColumn1 = 'LOG_DATE';
	    obj.columnData1 = $("#stDate").val();
	    obj.dateColumn2 = 'LOG_KIND';
	    obj.columnData2 = PscrnParm;
	    obj.returnLen = 3;
	    gfn_callAjaxComm(obj, "/erp/sale/wlog/workLogS/seqReturn", fn_SetSeq); */
};

/* function fn_SetSeq(data) {
    $("#seqNo").val(data[0].seq);
}; */

function fn_search(){
	fn_loadGridMain();
};

function fn_loadGridMain(){
	var obj={};
	obj.empNo = $('#empNo').val();
	obj.supplyComp = $('#supplyComp').val();
	if(obj.supplyComp==''){
		obj.supplyComp ='%';
	}
	if(obj.empNo==''){
		obj.empNo ='%';
	}
	gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
};

function fn_loadGridMainCB(data){
	$('#empNo').val('');
	$('#korName').val('');
	$('#supplyComp').val('');
}

function fn_new(){
	gridMain.clearAll();
};

function fn_save(){
	 var jsonStr = gridMain.getJsonUpdated2();
  if (jsonStr == null || jsonStr.length <= 0) return;         		
      $("#jsonData").val(jsonStr);  
       $.ajax({
         url : "/erp/prod1/equi/orderS/gridMainSave",
         type : "POST",
         data : $("#pform").serialize(),
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
    gridMain.addHeader({name:"No",       colId:"no",        width:"3",align:"center", type:"cntr"});
    gridMain.addHeader({name:"부품코드", colId:"partCode",  width:"5",align:"left", type:"ro"});
    gridMain.addHeader({name:"부품명",   colId:"partName",  width:"5",align:"left", type:"ro"});
    gridMain.addHeader({name:"규격",     colId:"partSpec",  width:"5",align:"left", type:"ro"});
    gridMain.addHeader({name:"단위",     colId:"partUnit",  width:"5",align:"left", type:"ro"});
    gridMain.addHeader({name:"수량",     colId:"amount",    width:"5",align:"right", type:"ed"});
    gridMain.addHeader({name:"단가",     colId:"unitPrice", width:"5",align:"right", type:"ed"});
    gridMain.addHeader({name:"금액",     colId:"money",     width:"5",align:"right", type:"ed"});
    gridMain.addHeader({name:"납기일자", colId:"nabgiDate", width:"5",align:"center", type:"dhxCalendarA"});
    gridMain.addHeader({name:"납품장소", colId:"nabgiAddr", width:"5",align:"left", type:"ed"});
	
	var totalColNum = gridMain.getColumnCount();
	 var data = new Array(totalColNum);
		var amountColIdx = gridMain.getColIndexById('amount');
		var unitPriceColIdx = gridMain.getColIndexById('unitPrice');
		var moneyColIdx = gridMain.getColIndexById('money');
		var nabgiDateColIdx = gridMain.getColIndexById('nabgiDate');
	        data[amountColIdx] = 0;
	        data[unitPriceColIdx] = 0;
	        data[moneyColIdx] = 0;
	        data[nabgiDateColIdx] = dateformat(new Date());
	        gridMain.addRow(data);
};

function fn_delete(){
	var rodid = gridMain.getSelectedRowId();
	  gridMain.cs_deleteRow(rodid); 
};

function fn_onClosePop(pName,data){
	var i;
	var obj={};
	 if(pName == "empNo"){
		for(i=0;i<data.length;i++){
			obj.korName=data[i].korName;
			obj.empNo=data[i].empNo;
				$('#korName').val(obj.korName);
				$('#empNo').val(obj.empNo);
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
	  } 
 };
 
 function fn_closeCustCodePop(data){
		 $('#supplyComp').val(data); 
 };
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
         <input type="hidden" name="empNo" id="empNo"> 
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
                      <input name="seqNo" id="seqNo" type="text" value="" class="form-control input-xs" disabled="disabled">
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
			        <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
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