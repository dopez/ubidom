<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
var payAmtSum = 0;
var rowSelVal;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(3,[1,3],"2U");
	//급여기본자료(유동/공제)
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");

	subLayout.cells("a").setWidth(493);
	gridMst = new dxGrid(subLayout.cells("a"),false);
	gridMst.addHeader({name:"NO",           colId:"no", 	    width:"50",  align:"center", type:"cntr"});
	gridMst.addHeader({name:"사번",         colId:"empNo",      width:"80",  align:"left",   type:"ro"});
	gridMst.addHeader({name:"성명",         colId:"korName",    width:"80",  align:"left",   type:"ro"});
    gridMst.addHeader({name:"부서",         colId:"postName",   width:"80",  align:"left",   type:"ro"});
    gridMst.addHeader({name:"직위",         colId:"jikweeName", width:"80",  align:"left",   type:"ro"});
    gridMst.addHeader({name:"주민등록번호", colId:"regiNumb",   width:"120", align:"left",   type:"ro"});
    gridMst.setColSort("str");
    gridMst.setUserData("","pk","no");
    gridMst.init();	
    gridMst.attachEvent("onRowSelect",doOnMstRowSelect);

    gridDtl = new dxGrid(subLayout.cells("b"),false);
    gridDtl.addHeader({name:"NO",        colId:"no", 	      width:"50",  align:"center", type:"cntr"});
	gridDtl.addHeader({name:"지급/공제", colId:"subjectKind", width:"80",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"코드",      colId:"subjectCode", width:"80",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"항목명",    colId:"subjectName", width:"100", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"금액",      colId:"payAmt",      width:"100", align:"right", type:"edn"});
	gridDtl.setColSort("str");
	gridDtl.setUserData("","pk","no");
    gridDtlAttachFooter();
    gridDtl.init();	
    gridDtl.cs_setColumnHidden(["empNo"]);	
	
	$("#postName,#korName").keyup(function(e) {
    	if(e.target.id == "postName"){
    		gridMst.filterBy(3,byId("postName").value);
		}
    	if(e.target.id == "korName"){
    		gridMst.filterBy(2,byId("korName").value);
		}
	 }); 
    
	calMain = new dhtmlXCalendarObject([{input:"yymm",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y/%m");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("yymm").value = t+"/"+m;
	
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
	var obj=gfn_getFormElemntsData("frmMain");
    gfn_callAjaxForGrid(gridMst,obj,"gridMstSearch",subLayout.cells("a"),fn_loadGridMstCB);
}
function doOnMstRowSelect(id,ind){
	payAmtSum = 0;
	var empIdx = gridMst.getColIndexById('empNo');
	var empNoVal = gridMst.setCells(id,empIdx).getValue();
	$('#empNo').val(empNoVal);
	var obj=gfn_getFormElemntsData("frmMain");
	fn_loadGridDtl(obj);
}

function fn_save(){
	var dateValue = $('#yymm').val();
	$('#monthDate').val(dateValue);
	var rowIdx = gridDtl.getSelectedRowIndex();
	var colIdx = gridDtl.getColIndexById('empNo');
	rowSelVal=gridDtl.setCells2(rowIdx, colIdx).getValue();
	
	 var jsonStr = gridDtl.getJsonUpdated2();
	   if (jsonStr == null || jsonStr.length <= 0) return;         		
	       $("#jsonData").val(jsonStr);  
	      var params = gfn_getFormElemntsData("pform");  
	  	  gfn_callAjaxComm(params,"gridDtlSave",fn_saveDtlCB);  
};

function fn_saveDtlCB(data){
	fn_search();
    rowSelVal = null;
};


function fn_loadGridDtl(params){
	gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"),fn_loadGridDtlCB);
}
function fn_loadGridMstCB(data){
	$('#yymm').keyup();
	var rowIdx = cs_selectRow_check(gridMst,"empNo",rowSelVal)
	gridMst.selectRow(rowIdx,true,true,true);
};
function fn_loadGridDtlCB(data){
	$('#yymm').keyup();
	var MempIdx = gridMst.getColIndexById('empNo');
	var DempIdx = gridDtl.getColIndexById('empNo');
	var rodIdx = gridMst.getSelectedRowIndex();
	var empNo = gridMst.setCells2(rodIdx,MempIdx).getValue();
	
	for(var i=0; i<data.length;i++){
		gridDtl.setCells2(i,DempIdx).setValue(empNo);
		payAmtSum += data[i].payAmt*1;
	 }
	gridDtl.detachFooter(0);
	gridDtlAttachFooter();
};

function fn_exit(){
	var exitVal = cs_close_event([gridDtl]);
	if(exitVal){
		mainTabbar.tabs(ActTabId).close();	
	}else{
		if(MsgManager.confirmMsg("WRN012")){
			mainTabbar.tabs(ActTabId).close();	
		}else{
			return true;
		}
	} 
}
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="monthDate" name="monthDate" class="format_month">
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">  
	  <input type="hidden" id="empNo" name="empNo">
	  <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  년월 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="yymm" id="yymm" type="text" value="" placeholder="" class="form-control input-xs format_month">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
		 </div>
	    </div>
      </div>  
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