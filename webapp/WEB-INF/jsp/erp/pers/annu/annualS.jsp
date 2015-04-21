<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
var t;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8],"2U");
	//원천징수변황양식
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,부서,직위,사번,성명,입사일",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100");
	gridMst.setColAlign("center,left,left,left,left,center");
	gridMst.setColTypes("ron,ro,ro,ro,ro,ro");
	gridMst.setColSorting("int,str,str,str,str,date");
	gridMst.init();	
	subLayout.cells("a").setWidth(603);
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,변경일자,사용유무,갯수",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100");
	gridDtl.setColAlign("center,center,left,right");
	gridDtl.setColTypes("ron,dhxCalendarA,ed,edn");
	gridDtl.setColSorting("int,date,str,int");
	gridDtl.init();
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y");
	calMain.hideTime();	   
    t = new Date().getFullYear();
	byId("stDate").value = t;
});
function fn_year(flag){
	if(flag==1){
		t = t+1;
		byId("stDate").value = t;
	}
	if(flag==2){
		t = t-1;
		byId("stDate").value = t;
	}
}
function fn_search(){
	
}
function fn_excel(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  기준년도 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-6 col-md-6">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-6 col-md-6">
                      <div class="col-sm-6 col-md-6">
					    <input type="button" name="btnUp" id="btnUp" class="form-control btn btn-default btn-xs"  value="▲" onclick="fn_year(1)">
				      </div>
				      <div class="col-sm-6 col-md-6">
					    <input type="button" name="btnDown" id="btnDown" class="form-control btn btn-default btn-xs" value="▼" onclick="fn_year(2)">
				      </div>
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
			  <select name="jobgubn" id="jobgubn" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="관리직">관리직</option>
			   <option value="생산직">생산직</option>
			   <option value="용역">용역</option>
			   <option value="외국인">외국인</option>
			   <option value="기술직">기술직</option>
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
			    <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			 </div>
			 <div class="col-sm-1 col-md-1">
			    <input name="bals" id="bals" type="button" value="연차발생" class="form-control btn btn-default btn-xs">
			 </div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>