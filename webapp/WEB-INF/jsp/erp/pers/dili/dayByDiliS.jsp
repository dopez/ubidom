<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;  
var calMain;
var combo;
var sum;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,4,8],"1C");
	//일일근태등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"3", align:"center", type:"cntr"});
	gridMain.addHeader({name:"근무일자", colId:"workDate",   width:"5", align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"부서",     colId:"postName",   width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"직위",     colId:"jikweeName", width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"사번",     colId:"empNo",      width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",    width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"근태구분", colId:"workKind",   width:"5", align:"left",   type:"combo"});
	gridMain.addHeader({name:"정상",     colId:"workTime",   width:"4", align:"right",  type:"ro"});
	gridMain.addHeader({name:"연장",     colId:"overTime",   width:"4", align:"right",  type:"edn"});
	gridMain.addHeader({name:"야근",     colId:"nightTime",  width:"4", align:"right",  type:"edn"});
	gridMain.addHeader({name:"특근",     colId:"holiTime",   width:"4", align:"right",  type:"edn"});
	gridMain.addHeader({name:"외출",     colId:"partTime",   width:"4", align:"right",  type:"edn"});
	gridMain.addHeader({name:"조퇴",     colId:"earlyTime",  width:"4", align:"right",  type:"edn"});
	gridMain.addHeader({name:"지각",     colId:"lateTime",   width:"4", align:"right",  type:"edn"});
	gridMain.addHeader({name:"총근무",   colId:"totalTime",  width:"4", align:"right",  type:"ro"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMain.dxObj.setUserData("","@workDate","format_date");
	gridMain.init();
	gridMain.cs_setColumnHidden(["compId"]);
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	gridMain.attachEvent("onCellChanged",doOnCellChanged);
	
	calMain = new dhtmlXCalendarObject([{input:"workDay",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("workDay").value = t;
	
	$("#postName,#diliSBtn").click(function(e){
		if(e.target.id == 'postName'){
			gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()}); 
		}else if(e.target.id == 'diliSBtn'){
			gfn_load_pop('w1','pers/dayByDiliSPOP',true,{});
		} 
	});
	
	combo =gridMain.getColumnCombo(6);
	fn_comboSet(combo);
});
function doOnCellChanged(rId,cInd,nValue){
	if(cInd==8){
		doOnRowSelect(rId,cInd);
	   }
	   if(cInd==9){
		   doOnRowSelect(rId,cInd);
	   }
	   if(cInd==10){
		   doOnRowSelect(rId,cInd);
	   }
	   if(cInd==11){
		   doOnRowSelect(rId,cInd);
	   }
	   if(cInd==12){
		   doOnRowSelect(rId,cInd);
	   }
	   if(cInd==13){
		   doOnRowSelect(rId,cInd);
	   }
}
function doOnRowSelect(id,ind){
	totalTimeCalcul(id);
}
function fn_comboSet(comboId){
	var params={};
	params.compId = '100';
	params.code = 'P008';
	
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
	       {header: "구분", width: 100,  option: "#interName#"}
	    ]
	});
	$.ajax({
		"url":"/erp/cmm/InterCodeR",
		"type":"post",
		"data":params,
		"success" : function(data){
		  var list = data;
		  for(var i=0;i<list.length;i++){
			  comboId.addOption(list[i].interCode,list[i].interName);
		    }
		}
  });
comboId.enableFilteringMode(true);
comboId.enableAutocomplete(true);
comboId.allowFreeText(true);
}


function fn_search(){
	fn_loadGridLeftList();
}
function totalTimeCalcul(id){
	sum = gridMain.setCells(id,14).getValue()*1;
	workValue = gridMain.setCells(id,7).getValue()*1;
	overValue = gridMain.setCells(id,8).getValue()*1;
	nightValue = gridMain.setCells(id,9).getValue()*1;
	holiValue = gridMain.setCells(id,10).getValue()*1;
	partValue = gridMain.setCells(id,11).getValue()*1;
	earlyValue = gridMain.setCells(id,12).getValue()*1;
	lateValue = gridMain.setCells(id,13).getValue()*1;
	sum = (workValue+overValue+nightValue+holiValue)-(partValue+earlyValue+lateValue);
	gridMain.setCells(id,14).setValue(sum);
}
function fn_save(){
	 var jsonStr = gridMain.getJsonUpdated2();
   if (jsonStr == null || jsonStr.length <= 0) return;         		
       $("#jsonData").val(jsonStr);                      
       $.ajax({
          url : "/erp/pers/dili/dayByDiliS/gridMainSave",
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
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
}

function fn_loadGridLeftList(){
	var obj= gfn_getFormElemntsData("frmMain");
    gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridLeftListCB);
}

function fn_loadGridLeftListCB(data){
	$('#workDay').keyup();
	$('#postCode').val('%');
	$('#postName').val('');
};
function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if(pName=="postCode"){
		for(i=0;i<data.length;i++){
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			$('#postName').val(obj.postName);
			$('#postCode').val(obj.postCode);
		}		  
	}else if(pName == 'saveDiliS'){
		MsgManager.alertMsg("INF001");
		fn_search();
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
      <input type="hidden" id="postCode" name="postCode" value="%">
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  근무일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input class="form-control input-xs format_date" name="workDay" id="workDay" type="text">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-2 col-md-2 col-sm-offset-1 col-md-offset-1">
			    <input type="button" name="diliSBtn" id="diliSBtn" value="근태자료생성" class="form-control btn btn-default btn-xs">
			</div>
		 </div>
	    </div>
      </div>      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<label class="col-sm-1 col-md-1 control-label" for="textinput">
			 직군
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jikgun" id="jikgun" class="form-control input-xs">
			   <option value="%">전체</option>
			   <option value="01">관리직</option>
			   <option value="02">생산직</option>
			   <option value="03">용역</option>
			   <option value="04">외국인</option>
			   <option value="05">기술직</option>
			   <option value="06">계약직</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>