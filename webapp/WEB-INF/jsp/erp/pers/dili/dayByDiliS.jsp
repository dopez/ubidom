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
	gridMain.addHeader({name:"NO",       colId:"no",         width:"5", align:"center", type:"cntr"});
	gridMain.addHeader({name:"근무일자", colId:"workDate",   width:"6", align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"부서",     colId:"postName",   width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"직위",     colId:"jikweeName", width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"사번",     colId:"empNo",      width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",    width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"근태구분", colId:"workKind",   width:"6", align:"center", type:"combo"});
	gridMain.addHeader({name:"정상",     colId:"workTime",   width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"연장",     colId:"overTime",   width:"5", align:"center", type:"edn"});
	gridMain.addHeader({name:"야근",     colId:"nightTime",  width:"5", align:"center", type:"edn"});
	gridMain.addHeader({name:"외출",     colId:"partTime",   width:"5", align:"center", type:"edn"});
	gridMain.addHeader({name:"조퇴",     colId:"earlyTime",  width:"5", align:"center", type:"edn"});
	gridMain.addHeader({name:"지각",     colId:"lateTime",   width:"5", align:"center", type:"edn"});
	gridMain.addHeader({name:"총근무",   colId:"totalTime",  width:"5", align:"center", type:"ro"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMain.init();
	gridMain.cs_setColumnHidden(["compId"]);

	 gridMain.attachEvent("onCellChanged", function(rId,cInd,nValue){
		var selId = gridMain.getSelectedRowId();
		if(selId != null){
			sum = gridMain.setCells(selId,13).getValue()*1;
		}
	if(gridMain.getSelectedRowId() == rId){
		if(cInd==8){
			sum = sum+nValue*1;
			gridMain.setCells(rId,13).setValue(sum);
		}
		else if(cInd==9){
			sum = sum+nValue*1;
			gridMain.setCells(rId,13).setValue(sum);
		}
		else if(cInd==10){
			sum = sum-nValue*1;
			gridMain.setCells(rId,13).setValue(sum);
		}
		else if(cInd==11){
			sum = sum-nValue*1;
			gridMain.setCells(rId,13).setValue(sum);
		}
		else if(cInd==12){
			sum = sum-nValue*1;
			gridMain.setCells(rId,13).setValue(sum);
		}
	}	
  }); 
	
	calMain = new dhtmlXCalendarObject([{input:"workDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("workDate").value = t;
	
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
	var obj={};
	obj.workDate = $('#workDate').val();
	obj.postCode = $('#postCode').val();
	obj.jikgun = $('#jikgun').val();
	if(obj.postCode == ''){
		obj.postCode = '%';
	}
    gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridLeftListCB);
}

function fn_loadGridLeftListCB(data){
	//sum = data[0].workTime;
	$('#postCode').val('');
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
      <input type="hidden" id="postCode" name="postCode">
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  근무일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="workDate" id="workDate" type="text" value="" placeholder="" class="form-control input-xs">
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