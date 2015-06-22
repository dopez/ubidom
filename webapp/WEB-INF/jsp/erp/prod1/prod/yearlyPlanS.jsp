<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;   
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"1C");
	//연간생산계획등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");

	gridMain = subLayout.cells("a").attachGrid();
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"40", align:"center", type:"cntr"});
	gridMain.addHeader({name:"품목코드", colId:"itemCode",   width:"120", align:"left",   type:"ro"});
	gridMain.addHeader({name:"품목명",   colId:"itemName",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"포장",     colId:"packUnit",   width:"80", align:"left",   type:"ron"});
	gridMain.addHeader({name:"단위",     colId:"itemUnit",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"1월",      colId:"planQty1",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"2월",      colId:"planQty2",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"3월",      colId:"planQty3",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"4월",      colId:"planQty4",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"5월",      colId:"planQty5",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"6월",      colId:"planQty6",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"7월",      colId:"planQty7",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"8월",      colId:"planQty8",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"9월",      colId:"planQty9",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"10월",     colId:"planQty10",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"11월",     colId:"planQty11",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"12월",     colId:"planQty12",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"합계",     colId:"planQtySum", width:"60", align:"right",  type:"ron"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMain.init(); 
	gridMain.cs_setColumnHidden(["setNumb","prodKind","equiCode","planYear"]);
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	
	calMain = new dhtmlXCalendarObject([{input:"planYear",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    if($('#planYear').val() == ''){
  	  byId("planYear").value = t;
  	}
	
	fn_search();
	
});

function doOnRowSelect(id,ind){
	totalTimeCalcul(id);
}
function totalTimeCalcul(id){
	sum = gridMain.setCells(id,17).getValue()*1;
	planQty1  = gridMain.setCells(id,5).getValue()*1;
	planQty2  = gridMain.setCells(id,6).getValue()*1;
	planQty3  = gridMain.setCells(id,7).getValue()*1;
	planQty4  = gridMain.setCells(id,8).getValue()*1;
	planQty5  = gridMain.setCells(id,9).getValue()*1;
	planQty6  = gridMain.setCells(id,10).getValue()*1;
	planQty7  = gridMain.setCells(id,11).getValue()*1;
	planQty8  = gridMain.setCells(id,12).getValue()*1;
	planQty9  = gridMain.setCells(id,13).getValue()*1;
	planQty10 = gridMain.setCells(id,14).getValue()*1;
	planQty11 = gridMain.setCells(id,15).getValue()*1;
	planQty12 = gridMain.setCells(id,16).getValue()*1;
	sum = planQty1+planQty2+planQty3+planQty4+planQty5+planQty6+planQty7+planQty8+planQty9+planQty10+planQty11+planQty12;
	gridMain.setCells(id,17).setValue(sum);
}
function doOnRowDblClicked(rInd,cInd){
	if(cInd==1){
	gfn_load_pop('w1','common/itemCodePOP',true,{"itemName":""});
	}
}
function fn_search(){
	fn_loadGridMain();
}
function fn_loadGridMain(){
	var obj={};
	obj.planYear = $('#planYear').val();
	obj.setNumb = $('#setNumb').val();
	 gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
}

function fn_loadGridMainCB(data){
	if(gridMain.getRowsNum()>0){
		for(var i=0; i<gridMain.getRowsNum();i++){
		sum = gridMain.setCells2(i,17).getValue()*1;
		planQty1  = gridMain.setCells2(i,5).getValue()*1;
		planQty2  = gridMain.setCells2(i,6).getValue()*1;
		planQty3  = gridMain.setCells2(i,7).getValue()*1;
		planQty4  = gridMain.setCells2(i,8).getValue()*1;
		planQty5  = gridMain.setCells2(i,9).getValue()*1;
		planQty6  = gridMain.setCells2(i,10).getValue()*1;
		planQty7  = gridMain.setCells2(i,11).getValue()*1;
		planQty8  = gridMain.setCells2(i,12).getValue()*1;
		planQty9  = gridMain.setCells2(i,13).getValue()*1;
		planQty10 = gridMain.setCells2(i,14).getValue()*1;
		planQty11 = gridMain.setCells2(i,15).getValue()*1;
		planQty12 = gridMain.setCells2(i,16).getValue()*1;
		sum = planQty1+planQty2+planQty3+planQty4+planQty5+planQty6+planQty7+planQty8+planQty9+planQty10+planQty11+planQty12;
		gridMain.setCells2(i,17).setValue(sum);
		}
	}
}
function fn_new(){
	gridMain.clearAll();
	gridMain.parse("","js");
	$('#setNumb').val('');
}

function fn_getSeqReturn(){
	 var obj = {};
	    obj.tableName = 'TBL_PROD_PLAN_YEAR';
	    obj.seqColumn = 'SET_NUMB';
	    obj.dateColumn1 = 'PLAN_YEAR';
	    obj.columnData1 = $("#planYear").val();
	    obj.returnLen = 2;
	    gfn_callAjaxComm(obj,"/erp/comm/stan/tableSeq/selTableSeq1",fn_SetSeq); 
};

function fn_SetSeq(data) {
	var setNumbIdx = gridMain.getColIndexById('setNumb');
   $("#setNumb").val(data[0].seq);
   for(var i=0; i<gridMain.getRowsNum();i++){
		  gridMain.setCells2(i,setNumbIdx).setValue(data[0].seq);
		}  
};

function fn_save(){
	var setNumbIdx = gridMain.getColIndexById('setNumb');
	if($('#setNumb').val() != ''){
		var seqValue = $('#setNumb').val();
		 for(var i=0; i<gridMain.getRowsNum();i++){
			  gridMain.setCells2(i,setNumbIdx).setValue(seqValue);
			} 
	}else{
		fn_getSeqReturn();
	}
	
	 var jsonStr = gridMain.getJsonUpdated2();
	   if (jsonStr == null || jsonStr.length <= 0) return;         		
	       $("#jsonData").val(jsonStr);  
	        $.ajax({
	          url : "/erp/prod1/prod/yearlyPlanS/gridMainSave",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	          MsgManager.alertMsg("INF001");
	          fn_search();
	          rowSelVal = null;
	           }
	      }); 
}

function fn_remove(){
	 for(var i=0; i<gridMain.getRowsNum();i++){
		 gridMain.cs_deleteRow(gridMain.getRowId(i));	 
	 }
}

function fn_add(){
	    var totalColNum = gridMain.getColumnCount();
	    var data = new Array(totalColNum);
	    var equiCodeColIdx = gridMain.getColIndexById('equiCode');
	    var prodKindColIdx = gridMain.getColIndexById('prodKind');
		var planYearIdx = gridMain.getColIndexById('planYear');    
		    data[equiCodeColIdx] = "0";
	        data[prodKindColIdx] = '1';
	        data[planYearIdx] = $('#planYear').val();
	        gridMain.addRow(data);
}

function fn_delete(){
	 var rodid = gridMain.getSelectedRowId();
	 gridMain.cs_deleteRow(rodid);
}

function fn_onClosePop(pName,data){
	if(pName=="itemCode"){
	 var selRowIdx = gridMain.getSelectedRowIndex();
	 gridMain.setCells2(selRowIdx,1).setValue(data[0].itemCode);
	 gridMain.setCells2(selRowIdx,2).setValue(data[0].itemName);
	 gridMain.setCells2(selRowIdx,3).setValue(data[0].packUnit);
	 gridMain.setCells2(selRowIdx,4).setValue(data[0].itemUnit);
	}
	  
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
			  연도 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="planYear" id="planYear" type="text" value="${planYear}" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="setNumb" id="setNumb" type="text" value="${setNumb}" placeholder="" class="form-control input-xs" readonly="readonly">
                  </div>
             </div>
		 </div>
	    </div>
      </div>          
  </form>
 </div> 
</div>