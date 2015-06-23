<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"1C");
	//월간생산계획등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"40", align:"center", type:"cntr"});
	gridMain.addHeader({name:"품목코드", colId:"itemCode",   width:"120", align:"left",  type:"ro"});
	gridMain.addHeader({name:"품목명",   colId:"itemName",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"포장",     colId:"packUnit",   width:"80", align:"left",   type:"ron"});
	gridMain.addHeader({name:"단위",     colId:"itemUnit",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"1일",      colId:"planDay1",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"2일",      colId:"planDay2",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"3일",      colId:"planDay3",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"4일",      colId:"planDay4",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"5일",      colId:"planDay5",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"6일",      colId:"planDay6",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"7일",      colId:"planDay7",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"8일",      colId:"planDay8",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"9일",      colId:"planDay9",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"10일",     colId:"planDay10",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"11일",     colId:"planDay11",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"12일",     colId:"planDay12",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"13일",     colId:"planDay13",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"14일",     colId:"planDay14",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"15일",     colId:"planDay15",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"16일",     colId:"planDay16",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"17일",     colId:"planDay17",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"18일",     colId:"planDay18",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"19일",     colId:"planDay19",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"20일",     colId:"planDay20",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"21일",     colId:"planDay21",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"22일",     colId:"planDay22",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"23일",     colId:"planDay23",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"24일",     colId:"planDay24",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"25일",     colId:"planDay25",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"26일",     colId:"planDay26",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"27일",     colId:"planDay27",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"28일",     colId:"planDay28",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"29일",     colId:"planDay29",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"30일",     colId:"planDay30",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"31일",     colId:"planDay31",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"합계",     colId:"planDaySum", width:"60", align:"right",  type:"ron"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMain.init(); 
	gridMain.cs_setColumnHidden(["setNumb","prodKind","equiCode","planMm"]);
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	gridMain.attachEvent("onCellChanged",doOnCellChanged);
	
	calMain = new dhtmlXCalendarObject([{input:"planMm",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y/%m");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
    if($('#planMm').val() == ''){
    	  byId("planMm").value = t+"/"+m;
    }
    
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
	if(cInd==17){totalTimeCalcul(rId);}
	if(cInd==18){totalTimeCalcul(rId);}
	if(cInd==19){totalTimeCalcul(rId);}
	if(cInd==20){totalTimeCalcul(rId);}
	if(cInd==21){totalTimeCalcul(rId);}
	if(cInd==22){totalTimeCalcul(rId);}
	if(cInd==23){totalTimeCalcul(rId);}
	if(cInd==24){totalTimeCalcul(rId);}
	if(cInd==25){totalTimeCalcul(rId);}
	if(cInd==26){totalTimeCalcul(rId);}
	if(cInd==27){totalTimeCalcul(rId);}
	if(cInd==28){totalTimeCalcul(rId);}
	if(cInd==29){totalTimeCalcul(rId);}
	if(cInd==30){totalTimeCalcul(rId);}
};
function doOnRowSelect(id,ind){
	totalTimeCalcul(id);
}
function totalTimeCalcul(id){
	var planDaySumColIdx = gridMain.getColIndexById('planDaySum');
	sum = 0;
	for(var i=5;i<36;i++){
		sum = sum + gridMain.setCells(id,i).getValue()*1;
	}
	gridMain.setCells(id,planDaySumColIdx).setValue(sum);
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
	obj.planMm = searchDate($('#planMm').val());
	obj.setNumb = $('#setNumb').val();
	 gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"));
}

function fn_new(){
	gridMain.clearAll();
	gridMain.parse("","js");
	$('#setNumb').val('');
}

function fn_getSeqReturn(){
	 var obj = {};
	    obj.tableName = 'TBL_PROD_PLAN_MONTH';
	    obj.seqColumn = 'SET_NUMB';
	    obj.dateColumn1 = 'PLAN_MM';
	    obj.columnData1 = searchDate($("#planMm").val());
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
	for(var j=0;j<gridMain.getRowsNum();j++){
		var rowId = gridMain.getRowId(j);
		totalTimeCalcul(rowId);
	}
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
	          url : "/erp/prod1/prod/monthlyPlanS/gridMainSave",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	          MsgManager.alertMsg("INF001");
	          fn_search();
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
		var planMmIdx = gridMain.getColIndexById('planMm');    
		    data[equiCodeColIdx] = "0";
	        data[prodKindColIdx] = '1';
	        data[planMmIdx] = searchDate($('#planMm').val());
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
			  연월
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="planMm" id="planMm" type="text" value="${planMm}" placeholder="" class="form-control input-xs">
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