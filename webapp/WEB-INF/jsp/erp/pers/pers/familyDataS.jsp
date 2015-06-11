<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var combo01, combo02;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,5,6],"2U");
	//가족사항등록
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
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"NO",       colId:"no",          width:"50",  align:"center", type:"cntr"});
	gridDtl.addHeader({name:"관계",     colId:"famRel",      width:"80",  align:"left",   type:"ed"});
	gridDtl.addHeader({name:"성명",     colId:"famName",     width:"80",  align:"left",   type:"ed"});
	gridDtl.addHeader({name:"부양",     colId:"depend",      width:"60",  align:"center", type:"ch"});
	gridDtl.addHeader({name:"주민번호", colId:"juminNo",     width:"120", align:"left",   type:"ed"});
	gridDtl.addHeader({name:"동거",     colId:"liveWith",    width:"80",  align:"left",   type:"combo"});
	gridDtl.addHeader({name:"장애",     colId:"disaYn",      width:"80",  align:"left",   type:"combo"});
	gridDtl.addHeader({name:"직업",     colId:"job",         width:"80",  align:"left",   type:"ed"});
	gridDtl.addHeader({name:"최종학력", colId:"scholarship", width:"80",  align:"left",   type:"ed"});
	gridDtl.setUserData("","pk","no");
	gridDtl.setColSort("str");
	gridDtl.dxObj.setUserData("","@juminNo","format_jumin");
	gridDtl.init(); 
	gridDtl.cs_setColumnHidden(["empNo","compId","seq"]);
	gridDtl.attachEvent("onRowSelect",doOnDtlRowSelect);
	fn_search();
	
	$("#postName,#korName").click(function(e){
		if(e.target.id == "postName"){
		  gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
		}
		if(e.target.id == "korName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		}
	});
	
	combo01 =gridDtl.getColumnCombo(5);
	combo02 =gridDtl.getColumnCombo(6);
	gfn_single_comboLoad(combo01,["1","2"],["동거","비동거"],2);
	gfn_single_comboLoad(combo02,["0","1"],["비장애","장애"],2);
	
});
function doOnMstRowSelect(id,ind){
	var obj={};
	obj.compId = gridMst.setCells(id,4).getValue();
	obj.empNo = gridMst.setCells(id,1).getValue();
	fn_loadGridRightList(obj);
}
function doOnDtlRowSelect(id,ind){
	var no = gridDtl.setCells(id,0).getValue();
	var seqValue = gridDtl.setCells(id,11).getValue();
	if(seqValue == ""){
		gridDtl.setCells(id,11).setValue(no);
	}
}
function fn_search(){
	gridDtl.clearAll();
	fn_loadGridLeftList();
}
function fn_add(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
	 var empNoIdx = gridMst.getColIndexById('empNo');
	 var compIdIdx = gridMst.getColIndexById('compId');
	 var totalColNum = gridDtl.getColumnCount();
	    var data = new Array(totalColNum);
		var empNoColIdx = gridDtl.getColIndexById('empNo');    
		var compIdColIdx = gridDtl.getColIndexById('compId');  
	        data[empNoColIdx] = gridMst.setCells(rowCheck,empNoIdx).getValue();
	        data[compIdColIdx] = gridMst.setCells(rowCheck,compIdIdx).getValue();
		    gridDtl.addRow(data);
	}
}
function fn_save(){
	var dtlIdx = gridDtl.getSelectedRowIndex();
	var juminIdx = gridDtl.getColIndexById('juminNo');  
	var juminValue = gridDtl.setCells(dtlIdx,juminIdx).getValue();
	var jFlag = gfn_check_jumin(juminValue);
	if(jFlag){
		var rowIdx = gridMst.getSelectedRowIndex();
		var jsonStr = gridDtl.getJsonUpdated2();
	   if (jsonStr == null || jsonStr.length <= 0) return;         		
	       $("#jsonData").val(jsonStr);                      
	       $.ajax({
	          url : "/erp/pers/pers/familyDataS/gridDtlSave",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	          MsgManager.alertMsg("INF001");
	          gridMst.selectRow(rowIdx,true,true,true);
	           }
	      });
	}else{
		MsgManager.alertMsg("WRN004");
		return;
	}
}
function fn_delete(){
    var rodid = gridDtl.getSelectedRowId();
     gridDtl.cs_deleteRow(rodid);
}

function fn_loadGridLeftList(){
	var obj={};
	obj.jikgun = $('#jikgun').val();
	obj.serveGbn = $('#serveGbn').val();
	obj.postCode = $('#postCode').val();
	obj.empNo = $('#empNo').val();
	if(obj.postCode == ''){
		obj.postCode = '%';
	}
	if(obj.empNo == ''){
		obj.empNo = '%';
	}
    gfn_callAjaxForGrid(gridMst,obj,"gridMstSearch",subLayout.cells("a"),fn_loadGridLeftListCB);
}
function fn_loadGridLeftListCB(data){
	byId("frmMain").reset();
	$('#postCode').val('');
	$('#empNo').val('');
};
function fn_loadGridRightList(params){
	gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"));
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
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
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