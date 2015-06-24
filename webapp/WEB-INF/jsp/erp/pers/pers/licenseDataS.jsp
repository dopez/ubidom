<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var rowSelVal;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,5,6,11],"2U");
	//자격면허등록
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
	gridDtl.addHeader({name:"NO",       colId:"no",       width:"50",  align:"center", type:"cntr"});
	gridDtl.addHeader({name:"자격구분", colId:"qualKind", width:"90",  align:"left",   type:"ed"});
	gridDtl.addHeader({name:"자격증명", colId:"qualName", width:"120", align:"left",   type:"ed"});
	gridDtl.addHeader({name:"자격등급", colId:"qualGd",   width:"90",  align:"left",   type:"ed"});
	gridDtl.addHeader({name:"수당",     colId:"qualPay",  width:"90",  align:"right",  type:"ed"});
	gridDtl.addHeader({name:"취득일자", colId:"achiDate", width:"90",  align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"시행처",   colId:"apprCust", width:"180", align:"left",   type:"ed"});	
	gridDtl.setUserData("","pk","no");
	gridDtl.dxObj.setUserData("","@achiDate","format_date");
	gridDtl.setColSort("str");
	gridDtl.init(); 
	gridDtl.cs_setColumnHidden(["empNo","compId","seq"]);
	gridDtl.attachEvent("onRowSelect",doOnDtlRowSelect);
	
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
	
});
function doOnMstRowSelect(id,ind){
	var compIdx = gridMst.getColIndexById('compId');
	var empIdx = gridMst.getColIndexById('empNo');
	var obj={};
	obj.compId = gridMst.setCells(id,compIdx).getValue();
	obj.empNo = gridMst.setCells(id,empIdx).getValue();
	fn_loadGridDtl(obj);
}
function doOnDtlRowSelect(id,ind){
	var seqIdx = gridDtl.getColIndexById('seq');
	var no = gridDtl.setCells(id,0).getValue();
	var seqValue = gridDtl.setCells(id,seqIdx).getValue();
	if(seqValue == ""){
		gridDtl.setCells(id,seqIdx).setValue(no);
	}
}
function fn_search(){
	gridDtl.clearAll();
	gridDtl.parse("","js");
	fn_loadGridMst();
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
	    var achiDateColIdx = gridDtl.getColIndexById('achiDate');
		var empNoColIdx = gridDtl.getColIndexById('empNo');    
		var compIdColIdx = gridDtl.getColIndexById('compId');
		    data[achiDateColIdx] = dateformat(new Date());
	        data[empNoColIdx] = gridMst.setCells(rowCheck,empNoIdx).getValue();
	        data[compIdColIdx] = gridMst.setCells(rowCheck,compIdIdx).getValue();
		    gridDtl.addRow(data);
	}
}
function fn_save(){
	var rowIdx = gridDtl.getSelectedRowIndex();
	var colIdx = gridDtl.getColIndexById('empNo');
	rowSelVal=gridDtl.setCells2(rowIdx, colIdx).getValue();
	
	 var rowIdx = gridMst.getSelectedRowIndex();
	 var jsonStr = gridDtl.getJsonUpdated2();
   if (jsonStr == null || jsonStr.length <= 0) return;         		
       $("#jsonData").val(jsonStr);                      
       $.ajax({
          url : "/erp/pers/pers/licenseDataS/gridDtlSave",
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

function fn_delete(){
    var rodid = gridDtl.getSelectedRowId();
    gridDtl.cs_deleteRow(rodid);
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
};
function fn_loadGridDtl(params){
	gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"));
}

function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		$('#postName').val(data[0].postName);	  
	}else if(pName == "empNo"){
	     $('#korName').val(data[0].korName);
	}	  
 };
 
 function fn_exit(){
	 var mainTabbar = parent.mainTabbar;
	 var exitVal = true;
	 var cudKeyIdx = gridDtl.getColIndexById('cudKey');
	 for(var i=0;i<gridDtl.getRowsNum();i++){
		 var cudVal = gridDtl.setCells2(i,cudKeyIdx).getValue();
		 if(cudVal != ''){
			 exitVal = false;
			 break;
		 }
	 }
	 if(exitVal){
		 var menuId = mainTabbar.getActiveTab();
		mainTabbar.tabs(menuId).close();	 
	 }		
}
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