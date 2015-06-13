<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl01, gridDtl02;
var gridTabbar;
var isActTab1, isActTab2;
var rowSelVal;
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
    gridDtl01.dxObj.setUserData("","@juminNo","format_jumin");
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
	
   $("#postName,#korName").dblclick(function(e){
		if(e.target.id == "postName"){
		  gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
		}
		if(e.target.id == "korName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		}
	});
	
	$("#postName,#korName").keyup(function(e) {
   	if(e.target.id == "postName"){
   		gridMst.filterBy(3,byId("postName").value);
		}
   	if(e.target.id == "korName"){
   		gridMst.filterBy(2,byId("korName").value);
		}
	 }); 
	
	combo01 =gridDtl01.getColumnCombo(1);
	gfn_1col_comboLoad(combo01,"P007");

});

function doOnMstRowSelect(id,ind){
	var compIdx = gridMst.getColIndexById('compId');
	var empIdx = gridMst.getColIndexById('empNo');
	var obj={};
	obj.compId = gridMst.setCells(id,compIdx).getValue();
	obj.empNo = gridMst.setCells(id,empIdx).getValue();
	fn_loadGridDtls(obj); 
}
function doOnDtl01RowSelect(id,ind){
	var seqIdx = gridDtl01.getColIndexById('seq');
	var no = gridDtl01.setCells(id,0).getValue();
	var seqValue = gridDtl01.setCells(id,seqIdx).getValue();
	if(seqValue == ""){
		gridDtl01.setCells(id,seqIdx).setValue(no);
	} 
}
function doOnDtl02RowSelect(id,ind){
	var seqIdx = gridDtl02.getColIndexById('seq');
	var no = gridDtl02.setCells(id,0).getValue();
	var seqValue = gridDtl02.setCells(id,seqIdx).getValue();
	if(seqValue == ""){
		gridDtl02.setCells(id,seqIdx).setValue(no);
	} 
}
function fn_search(){
	gridDtl01.clearAll();
	gridDtl02.clearAll();
	gridDtl01.parse("","js");
	gridDtl02.parse("","js");
	fn_loadGridMst(); 
}
function fn_add(){
    var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{ 
		 var empNoIdx = gridMst.getColIndexById('empNo');
		 var compIdIdx = gridMst.getColIndexById('compId');
		 isActTab1 = gridTabbar.tabs("a1").isActive();
		 isActTab2 = gridTabbar.tabs("a2").isActive();
	if(isActTab1){
		var totalColNum = gridDtl01.getColumnCount();
	    var data = new Array(totalColNum);
		var empNoColIdx =  gridDtl01.getColIndexById('empNo');    
		var compIdColIdx = gridDtl01.getColIndexById('compId');
	        data[empNoColIdx] = gridMst.setCells(rowCheck,empNoIdx).getValue();
	        data[compIdColIdx] = gridMst.setCells(rowCheck,compIdIdx).getValue();
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
 	        data[empNoColIdx] = gridMst.setCells(rowCheck,empNoIdx).getValue();
	        data[compIdColIdx] = gridMst.setCells(rowCheck,compIdIdx).getValue(); 
		    gridDtl02.addRow(data);
	 }
   }
}

function fn_save(){
	var rowIdx = null;
	var colIdx = null;
	 isActTab1 = gridTabbar.tabs("a1").isActive();
	 isActTab2 = gridTabbar.tabs("a2").isActive();
	if(isActTab1){
		rowIdx = gridDtl01.getSelectedRowIndex();
		colIdx = gridDtl01.getColIndexById('empNo');
		rowSelVal=gridDtl01.setCells2(rowIdx, colIdx).getValue();
		console.log(rowIdx);
	}else{
		rowIdx = gridDtl02.getSelectedRowIndex();
		colIdx = gridDtl02.getColIndexById('empNo');
		rowSelVal=gridDtl02.setCells2(rowIdx, colIdx).getValue();
	 }
	
	 var jFlag = gfn_check_jumin(gridDtl01,"juminNo");
	 if(jFlag){
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
	        fn_search();
	        rowSelVal = null;
	         }
	    }); 
	 }else{
		 MsgManager.alertMsg("WRN008");
		return; 
	 }
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

function fn_loadGridMst(){
	var obj={};
	obj.jikgun = $('#jikgun').val();
	obj.serveGbn = $('#serveGbn').val();
	obj.postCode = $('#postName').val();
	obj.empNo = $('#korName').val();
    gfn_callAjaxForGrid(gridMst,obj,"/erp/pers/pers/familyDataS/gridMstSearch",subLayout.cells("a"),fn_loadGridMstCB);
}
function fn_loadGridMstCB(data){
	var rowIdx = cs_selectRow_check(gridMst,"empNo",rowSelVal)
	gridMst.selectRow(rowIdx,true,true,true);
	if(isActTab1){
		gridTabbar.tabs("a1").isVisible();
	}else{
		gridTabbar.tabs("a2").isVisible();
	}
};
function fn_loadGridDtls(params){
	gfn_callAjaxForGrid(gridDtl01,params,"gridDtl02Search",gridTabbar.tabs("a1"));
	gfn_callAjaxForGrid(gridDtl02,params,"gridDtl01Search",gridTabbar.tabs("a2"));
}

function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		$('#postName').val(data[0].postName);	  
	}else if(pName == "empNo"){
	     $('#korName').val(data[0].korName);
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