<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;   
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"1C"); 
	//연간생산계획등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	

	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"40", align:"center", type:"cntr"});
	gridMain.addHeader({name:"모재코드", colId:"itemCode",   width:"120", align:"left",   type:"ro"});
	gridMain.addHeader({name:"모재명",   colId:"itemName",   width:"80", align:"left",   type:"ro"});
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
	gridMain.attachEvent("onCellChanged",doOnCellChanged);
	
	calMain = new dhtmlXCalendarObject([{input:"planYear",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    if($('#planYear').val() == ''){
  	  byId("planYear").value = t;
  	}
    
    $("#equiCode").dblclick(function(e){
		if(e.target.id == "equiCode"){
			gfn_load_pop('w1','common/equiCodePOP',true,{});
		}
    });
	
	fn_search();

});
function doOnCellChanged(rId,cInd,nValue){
	if(cInd==5){totalTimeCalcul(rId);}
	if(cInd==6){totalTimeCalcul(rId);}
	if(cInd==7){totalTimeCalcul(rId);}
	if(cInd==8){totalTimeCalcul(rId);}
	if(cInd==9){totalTimeCalcul(rId);}
	if(cInd==10){totalTimeCalcul(rId);}
	if(cInd==11){totalTimeCalcul(rId);}
	if(cInd==12){totalTimeCalcul(rId);}
	if(cInd==13){totalTimeCalcul(rId);}
	if(cInd==14){totalTimeCalcul(rId);}
	if(cInd==15){totalTimeCalcul(rId);}
	if(cInd==16){totalTimeCalcul(rId);}
};

function doOnRowSelect(id,ind){
	totalTimeCalcul(id);
}
function totalTimeCalcul(id){
	var sum = cell_calculator(gridMain,id,5,16);
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
	obj.equiCode = $('#equiCode').val();
	 gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"));
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
	    obj.dateColumn2 = 'PROD_KIND';
	    obj.columnData2 = '2';
	    obj.returnLen = 2;
	    gfn_callAjaxComm(obj,"/erp/comm/stan/tableSeq/selTableSeq2",fn_SetSeq); 
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
	          url : "/erp/prod2/prod/yearlyPlanS/gridMainSave",
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
	var equiCodeVal = $('#equiCode').val();
	if(equiCodeVal == ''){
		dhtmlx.alert("설비코드는 필수 항목입니다.");
		return;
	}else{
	    var totalColNum = gridMain.getColumnCount();
	    var data = new Array(totalColNum);
	    var equiCodeColIdx = gridMain.getColIndexById('equiCode');
	    var prodKindColIdx = gridMain.getColIndexById('prodKind');
		var planYearIdx = gridMain.getColIndexById('planYear');    
		    data[equiCodeColIdx] = $('#equiCode').val();
	        data[prodKindColIdx] = '2';
	        data[planYearIdx] = $('#planYear').val();
	        gridMain.addRow(data);
	  }
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
	if(pName=="equiCode"){
		$('#equiCode').val(data[0].equiCode);
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
                      <input name="planYear" id="planYear" type="text" value="${planYear}"  class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="setNumb" id="setNumb" type="text" value="${setNumb}" class="form-control input-xs" readonly="readonly">
                  </div>
             </div>
		 </div>
	    </div>
      </div>
      <div class="row">
		   <div class="form-group form-group-sm">
			  <div class="col-sm-8 col-md-8">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				 설비코드
				 </label>
				<div class="col-sm-2 col-md-2">
				   <input name="equiCode" id="equiCode" type="text" value="${equiCode}"class="form-control input-xs">
				</div>
			  </div>
		  </div>
	  </div>           
  </form>
 </div> 
</div>