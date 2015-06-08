<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var payAmtSum = 0;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3],"2U");
	//급여기본자료(고정/공제)
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").setWidth(450);
	gridMst = new dxGrid(subLayout.cells("a"),false);
	gridMst.addHeader({name:"NO",           colId:"no", 	    width:"10",  align:"center", type:"cntr"});
	gridMst.addHeader({name:"사번",         colId:"empNo",      width:"15",  align:"left",   type:"ro"});
	gridMst.addHeader({name:"성명",         colId:"korName",    width:"15",  align:"left",   type:"ro"});
    gridMst.addHeader({name:"부서",         colId:"postName",   width:"15",  align:"left",   type:"ro"});
    gridMst.addHeader({name:"직위",         colId:"jikweeName", width:"15",  align:"left",   type:"ro"});
    gridMst.addHeader({name:"주민등록번호", colId:"regiNumb",   width:"29",  align:"left",   type:"ro"});
    gridMst.setColSort("str");
    gridMst.setUserData("","pk","no");
    gridMst.init();	
    gridMst.attachEvent("onRowSelect",doOnMstRowSelect);
    
    gridDtl = new dxGrid(subLayout.cells("b"),false);
    gridDtl.addHeader({name:"NO",        colId:"no", 	      width:"5",  align:"center", type:"cntr"});
	gridDtl.addHeader({name:"지급/공제", colId:"subjectKind", width:"7",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"코드",      colId:"subjectCode", width:"7",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"항목명",    colId:"subjectName", width:"9",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"금액",      colId:"payAmt",      width:"9",  align:"right",  type:"edn"});
	gridDtl.setColSort("str");
	gridDtl.setUserData("","pk","no");
    gridDtlAttachFooter();
    gridDtl.init();	
    gridDtl.cs_setColumnHidden(["empNo"]);
   
    $("#postName,#korName").click(function(e){
		if(e.target.id == "postName"){
		  gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
		}
		if(e.target.id == "korName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		}
	});
	
    fn_search();
	
});
function gridDtlAttachFooter(){
	gridDtl.atchFooter();
	gridDtl.addAtchFooter({atchFooterName:"합 계"});
	gridDtl.addAtchFooter({atchFooterName:""});
	gridDtl.addAtchFooter({atchFooterName:""});
	gridDtl.addAtchFooter({atchFooterName:""});
	gridDtl.addAtchFooter({atchFooterName:payAmtSum});
	gridDtl.atchFooterInit();
	}
function fn_search(){
	fn_loadGridMst();
}
function fn_loadGridMst(){
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
    gfn_callAjaxForGrid(gridMst,obj,"gridMstSearch",subLayout.cells("a"),fn_loadGridMstCB);
}
function doOnMstRowSelect(id,ind){
	payAmtSum = 0;
	var obj={};
	obj.empNo = gridMst.setCells(id,1).getValue();
	obj.compId = '100';
	fn_loadGridDtl(obj);
}

function fn_loadGridDtl(params){
	gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"),fn_loadGridDtlCB);
}
function fn_loadGridMstCB(data){
	var obj={};
	obj.empNo = data[0].empNo;
	obj.compId = '100';
	fn_loadGridDtl(obj); 
	
	byId("frmMain").reset();
	$('#postCode').val('');
	$('#empNo').val('');
};
function fn_loadGridDtlCB(data){
	var rodIdx = gridMst.getSelectedRowIndex();
	var empNo;
	if(rodIdx == -1){
	  empNo = gridMst.setCells2(0,1).getValue();
	}else{
	  empNo = gridMst.setCells2(rodIdx,1).getValue();
	}
	for(var i=0; i<data.length;i++){
		gridDtl.setCells2(i,5).setValue(empNo);
		payAmtSum += data[i].payAmt*1;
	 }
	gridDtl.detachFooter(0);
	gridDtlAttachFooter();
}
function fn_save(){
	var rowIdx = gridMst.getSelectedRowIndex();
	 var jsonStr = gridDtl.getJsonUpdated2();
	  if (jsonStr == null || jsonStr.length <= 0) return;         		
	      $("#jsonData").val(jsonStr);                      
	      $.ajax({
	         url : "/erp/pers/wage/fixBaseWageR/gridDtlSave",
	         type : "POST",
	         data : $("#pform").serialize(),
	         async : true,
	         success : function(data) {
	         MsgManager.alertMsg("INF001");
	         gridMst.selectRow(rowIdx,true,true,true);
	          }
	     });
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