<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,9],"2U");
	//급/상여명세서
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,사번,성명,선택,상태,E-Mail,직위",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100");
	gridMst.setColAlign("center,left,left,center,left,left,left");
	gridMst.setColTypes("ron,ro,ro,ch,ro,ro,ro");
	gridMst.setColSorting("int,str,str,na,str,str,str");
	gridMst.init();	
	subLayout.cells("a").setWidth(703);
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,사번,성명,선택,상태,E-Mail,직위",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,center,left,left,left");
	gridDtl.setColTypes("ron,ro,ro,ch,ro,ro,ro");
	gridDtl.setColSorting("int,str,str,na,str,str,str");
	gridDtl.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y/%m");
	calMain.hideTime();	   
    var t1 = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t1+"/"+m;
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  급여년월 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
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
			 <div class="col-sm-4 col-md-4 col-sm-offset-1 col-md-offset-1">
			   <div class="col-sm-3 col-md-3">
			      <input type="radio" name="mgubn" id="mgubn" value="급여" checked="checked">급여
			   </div>
			    <div class="col-sm-3 col-md-3">
			      <input type="radio" name="mgubn" id="mgubn" value="상여">상여
			   </div>
			    <div class="col-sm-6 col-md-6">
			      <input type="radio" name="mgubn" id="mgubn" value="성과급">성과급
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
			 <label class="col-sm-1 col-md-1 control-label" for="textinput">
			    성명
			 </label>
			 <div class="col-sm-2 col-md-2">
			    <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
			 </div>
			 <label class="col-sm-2 col-md-2 control-label" for="textinput">
			    미표시자여부
			 </label>
			 <div class="col-sm-1 col-md-1">
			    <input name="mpy" id="mpy" type="checkbox" value="Y" >
			 </div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>