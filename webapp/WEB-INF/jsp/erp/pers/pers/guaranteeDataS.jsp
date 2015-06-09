<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl01, gridDtl02;
var gridTabbar;
var isActTab1, isActTab2;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,4,5,6],"2U");
	//신원보증/보험등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").setWidth(303);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"NO",       colId:"no",       width:"50", align:"center", type:"cntr"});
	gridMst.addHeader({name:"사원번호", colId:"empNo",    width:"70", align:"left",   type:"ro"});
	gridMst.addHeader({name:"성명",     colId:"korName",  width:"90", align:"left",   type:"ro"});
	gridMst.addHeader({name:"부서",     colId:"postName", width:"90", align:"left",   type:"ro"});	
	gridMst.setUserData("","pk","no");
	gridMst.setColSort("str");
	gridMst.init(); 
	gridMst.cs_setColumnHidden(["compId"]);
	gridMst.attachEvent("onRowSelect",doOnMstRowSelect);

	gridTabbar = subLayout.cells("b").attachTabbar({
       tabs: [{id: "a1",text: "신원보증",active: true}, 
              {id: "a2",text: "보증보험"}]});
	
    gridDtl01 = new dxGrid(gridTabbar.tabs("a1"), false);
    gridDtl01.addHeader({name:"NO",           colId:"no",         width:"50",  align:"center", type:"cntr"});
    gridDtl01.addHeader({name:"관계",         colId:"relatKind",  width:"80",  align:"left",   type:"combo"});
    gridDtl01.addHeader({name:"성명",         colId:"relatName",  width:"80",  align:"left",   type:"ed"});
    gridDtl01.addHeader({name:"주민등록번호", colId:"juminNo",    width:"120", align:"left",   type:"ed"});
    gridDtl01.addHeader({name:"직장명",       colId:"compName",   width:"90",  align:"left",   type:"ed"});
    gridDtl01.addHeader({name:"직위",         colId:"jikweeName", width:"90",  align:"left",   type:"ed"});
    gridDtl01.addHeader({name:"학력",         colId:"scholName",  width:"90",  align:"left",   type:"ed"});
    gridDtl01.addHeader({name:"거주지",       colId:"addrs",      width:"120", align:"left",   type:"ed"});	
    gridDtl01.setUserData("","pk","no");
    gridDtl01.setColSort("str");
    gridDtl01.init(); 
    gridDtl01.cs_setColumnHidden(["empNo","compId","seq"]);
    gridDtl01.attachEvent("onRowSelect",doOnDtl01RowSelect);
    
    gridDtl02 = new dxGrid(gridTabbar.tabs("a2"), false);
    gridDtl02.addHeader({name:"NO",       colId:"no",        width:"50", align:"center", type:"cntr"});
    gridDtl02.addHeader({name:"시작일",   colId:"startDate", width:"80", align:"center", type:"dhxCalendarA"});
    gridDtl02.addHeader({name:"종료일",   colId:"endDate",   width:"80", align:"center", type:"dhxCalendarA"});
    gridDtl02.addHeader({name:"계약내용", colId:"insuCont",  width:"120", align:"left",  type:"ed"});
    gridDtl02.addHeader({name:"보험료",   colId:"premium",   width:"80", align:"right",  type:"ed"});
    gridDtl02.addHeader({name:"보험금",   colId:"insuAmt",   width:"80", align:"right",  type:"ed"});
    gridDtl02.addHeader({name:"보험회사", colId:"insuComp",  width:"100", align:"left",   type:"ed"});	
    gridDtl02.setUserData("","pk","no");
    gridDtl02.dxObj.setUserData("","@startDate","format_date");
    gridDtl02.dxObj.setUserData("","@endDate","format_date");
    gridDtl02.setColSort("str");
    gridDtl02.init(); 
    gridDtl02.cs_setColumnHidden(["empNo","compId","seq"]);
    gridDtl02.attachEvent("onRowSelect",doOnDtl02RowSelect);

   fn_search();
	
   $("#postName,#korName").click(function(e){
		if(e.target.id == "postName"){
		  gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
		}
		if(e.target.id == "korName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		}
	});
	
	combo01 =gridDtl01.getColumnCombo(1);
	fn_comboSet(combo01);

});
function fn_comboSet(comboId){
	var params={};
	params.compId = '100';
	params.code = 'P007';
	
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
function doOnMstRowSelect(id,ind){
	var obj={};
	obj.compId = gridMst.setCells(id,4).getValue();
	obj.empNo = gridMst.setCells(id,1).getValue();
	fn_loadGridRightList(obj); 
}
function doOnDtl01RowSelect(id,ind){
	var no = gridDtl01.setCells(id,0).getValue();
	var seqValue = gridDtl01.setCells(id,10).getValue();
	if(seqValue == ""){
		gridDtl01.setCells(id,10).setValue(no);
	} 
}
function doOnDtl02RowSelect(id,ind){
	var no = gridDtl02.setCells(id,0).getValue();
	var seqValue = gridDtl02.setCells(id,9).getValue();
	if(seqValue == ""){
		gridDtl02.setCells(id,9).setValue(no);
	} 
}
function fn_search(){
	gridDtl01.clearAll();
	gridDtl02.clearAll();
	fn_loadGridLeftList(); 
}
function fn_add(){
    var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{ 
		 isActTab1 = gridTabbar.tabs("a1").isActive();
		 isActTab2 = gridTabbar.tabs("a2").isActive();
	if(isActTab1){
		var totalColNum = gridDtl01.getColumnCount();
	    var data = new Array(totalColNum);
		var empNoColIdx =  gridDtl01.getColIndexById('empNo');    
		var compIdColIdx = gridDtl01.getColIndexById('compId');
	        data[empNoColIdx] = gridMst.setCells(rowCheck,1).getValue();
	        data[compIdColIdx] = gridMst.setCells(rowCheck,4).getValue();
		    gridDtl01.addRow(data);
	}else if(isActTab2){
		var totalColNum = gridDtl02.getColumnCount();
	    var data = new Array(totalColNum);
		var empNoColIdx =     gridDtl02.getColIndexById('empNo');    
		var compIdColIdx =    gridDtl02.getColIndexById('compId');
		var startDateColIdx = gridDtl02.getColIndexById('startDate');
		var endDateColIdx =   gridDtl02.getColIndexById('endDate');
		var premiumColIdx = gridDtl02.getColIndexById('premium');
		var insuAmtColIdx =   gridDtl02.getColIndexById('insuAmt');
		    data[startDateColIdx] = dateformat(new Date());
		    data[endDateColIdx] = dateformat(new Date());
		    data[premiumColIdx] = 0;
		    data[insuAmtColIdx] = 0;
 	        data[empNoColIdx] = gridMst.setCells(rowCheck,1).getValue();
	        data[compIdColIdx] = gridMst.setCells(rowCheck,4).getValue(); 
		    gridDtl02.addRow(data);
	 }
   }
}
function fn_nullCheck(id){
	var startValue = gridDtl02.setCells(id,1).getValue();
	var endValue = gridDtl02.setCells(id,1).getValue();
	if(startValue == ""){
		gridDtl02.setCells(id,1).setValue(0);
	}else if(endValue == ""){
		gridDtl02.setCells(id,2).setValue(0);
	}
}
function fn_save(){
	 var rowIdx = gridMst.getSelectedRowIndex();
	 var jsonStr = gridDtl01.getJsonUpdated2();
	 var jsonStr2 = gridDtl02.getJsonUpdated2();
	 if(jsonStr == null || jsonStr.length <= 0 ) return;
	 else if(jsonStr2 == null || jsonStr2.length <= 0) return;
	 $("#jsonData").val(jsonStr);
     $("#jsonData2").val(jsonStr2);
     $.ajax({
        url : "/erp/pers/pers/guaranteeDataS/gridDtlSave",
        type : "POST",
        data : $("#pform").serialize(),
        async : true,
        success : function(data) {
        MsgManager.alertMsg("INF001");
        gridMst.selectRow(rowIdx,true,true,true);
         }
    }); 
}
function fn_remove(){
	isActTab1 = gridTabbar.tabs("a1").isActive();
    isActTab2 = gridTabbar.tabs("a2").isActive();
	 if(isActTab1){
		 for(var i=0; i<gridDtl01.getRowsNum();i++){
			 gridDtl01.cs_deleteRow(gridDtl01.getRowId(i));	 
		 }
	 }else if(isActTab2){
		 for(var i=0; i<gridDtl02.getRowsNum();i++){
			 gridDtl02.cs_deleteRow(gridDtl02.getRowId(i));	 
		 }
	} 
}
function fn_delete(){
	    isActTab1 = gridTabbar.tabs("a1").isActive();
	    isActTab2 = gridTabbar.tabs("a2").isActive();
		var rodid = gridDtl01.getSelectedRowId();
	    var rodid2 = gridDtl02.getSelectedRowId();
		 if(isActTab1){
			 gridDtl01.cs_deleteRow(rodid);
		 }else if(isActTab2){
			 gridDtl02.cs_deleteRow(rodid2);
		}    
}

function fn_loadGridLeftList(){
	var obj={};
	obj.jikgun = $('#jikgun').val();
	obj.serveGbn = $('#serveGbn').val();
	obj.postCode = $('#postCode').val();
	obj.empNo = $('#empNo').val();
    gfn_callAjaxForGrid(gridMst,obj,"/erp/pers/pers/familyDataS/gridMstSearch",subLayout.cells("a"),fn_loadGridLeftListCB);
}
function fn_loadGridLeftListCB(data){
	byId("frmMain").reset();
	$('#postCode').val('');
	$('#empNo').val('');
};
function fn_loadGridRightList(params){
	gfn_callAjaxForGrid(gridDtl01,params,"gridDtl02Search",gridTabbar.tabs("a1"));
	gfn_callAjaxForGrid(gridDtl02,params,"gridDtl01Search",gridTabbar.tabs("a2"));
}

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
	}else if(pName == "empNo"){
		for(i=0;i<data.length;i++){
			obj.korName=data[i].korName;
			obj.empNo=data[i].empNo;
				$('#korName').val(obj.korName);
				$('#empNo').val(obj.empNo);
		}
	}	  
 };
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="jsonData2" name="jsonData2" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <input type="hidden" name="postCode" id="postCode">
      <input type="hidden" name="empNo" id="empNo">
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
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
			<label class="col-sm-1 col-md-1 control-label" for="textinput">
			 근무
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="serveGbn" id="serveGbn" class="form-control input-xs">
			   <option value="%">전체</option>
			   <option value="01">재직</option>
			   <option value="02">휴직</option>
			   <option value="03">퇴직</option>
			  </select>
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
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs" >
			</div>
			<label class="col-sm-1 col-md-1 control-label" for="textinput">
			 성명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>