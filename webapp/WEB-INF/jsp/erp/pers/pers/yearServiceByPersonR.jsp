<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var gridTabbar;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8],"1C");
	//근속년수별인원현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridTabbar = subLayout.cells("a").attachTabbar({
	       tabs: [{id: "a1",text: "근속년수별인원현황",active: true}, 
	              {id: "a2",text: "직급근속현황"}]});

	gridMst = new dxGrid(gridTabbar.tabs("a1"), false);
	gridMst.addHeader({name:"NO",       colId:"no",       width:"50", align:"center", type:"cntr"});
	gridMst.addHeader({name:"부서명",   colId:"postName", width:"70", align:"left",   type:"ro"});
	gridMst.addHeader({name:"1년미만",  colId:"one",      width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"1~2",      colId:"two",      width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"2~3",      colId:"three",    width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"3~4",      colId:"four",     width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"4~5",      colId:"five",     width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"5~6",      colId:"six",      width:"70", align:"right",  type:"ro"});	
	gridMst.addHeader({name:"6~7",      colId:"seven",    width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"7~8",      colId:"eight",    width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"8~9",      colId:"nine",     width:"70", align:"right",  type:"ro"});	
	gridMst.addHeader({name:"9~10",     colId:"ten",      width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"10~15",    colId:"eleven",   width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"15~20",    colId:"twelve",   width:"70", align:"right",  type:"ro"});	
	gridMst.addHeader({name:"20~25",    colId:"thirteen", width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"25~30",    colId:"fourteen", width:"70", align:"right",  type:"ro"});
	gridMst.addHeader({name:"30년이상", colId:"fifteen",  width:"70", align:"right",  type:"ro"});	
	gridMst.addHeader({name:"전체 계",  colId:"tot",      width:"70", align:"right",  type:"ro"});
	gridMst.setUserData("","pk","no");
	gridMst.setColSort("str");
	gridMstAttachFooter();
	gridMst.init(); 

	gridDtl = new dxGrid(gridTabbar.tabs("a2"), false);
	gridDtl.addHeader({name:"NO",         colId:"no",         width:"50", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"사원코드",   colId:"empNo",      width:"80", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"사원명",     colId:"korName",    width:"80", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"발령일자",   colId:"balDate",    width:"80", align:"center", type:"ro"});
	gridDtl.addHeader({name:"사업장구분", colId:"compId",     width:"80", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"부서명",     colId:"postName",   width:"80", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"직위",       colId:"jikweeName", width:"80", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"근속년수",   colId:"yymm",       width:"80", align:"right",  type:"ro"});	
	gridDtl.setUserData("","pk","no");
	gridDtl.setColSort("str");
	gridDtl.init(); 
	
	$("#korName").keyup(function(e) {
    	if(e.target.id == "korName"){
    		gridDtl.filterBy(2,byId("korName").value);
		}
	 });
	
	fn_search();
});
function fn_search(){
	fn_loadGridList();
};
function gridMstAttachFooter(){
	gridMst.atchFooter();
	gridMst.addAtchFooter({atchFooterName:""});
	gridMst.addAtchFooter({atchFooterName:"년수별계"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.addAtchFooter({atchFooterName:"#stat_total"});
	gridMst.atchFooterInit();	
}
function fn_excel(){
	 isActTab1 = gridTabbar.tabs("a1").isActive();
	 isActTab2 = gridTabbar.tabs("a2").isActive();
	 if(isActTab1){
		gridMst.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
	 }else if(isActTab2){
		 gridDtl.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate"); 
	 }
 };
 
 function fn_loadGridList() {
	 var params={};
	 params.compId = $("#compId").val();
	 params.empNo = $("#korName").val();
	 params.postCode = $("#postCode").val();
	 params.jikgun = $("#jikgun").val();
	 gfn_callAjaxForGrid(gridMst,params,"gridMstSearch",subLayout.cells("a"));
	 gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("a"));
};

function fn_exit(){
	mainTabbar.tabs(ActTabId).close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 사업장
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="compId" id="compId" class="form-control input-xs">
			   <option value="100">본점</option>
			   <option value="200">지점</option>
			  </select>
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
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="postCode" id="postCode" class="form-control input-xs">
			   <option value="%">전체</option>
			   <option value="11100">임원</option>
			   <option value="11200">총무</option>
			   <option value="11300">회계/경리</option>
			   <option value="11400">테스트</option>
			  </select>
			</div>
			<label class=" col-sm-1 col-md-1 control-label" for="textinput"> 
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