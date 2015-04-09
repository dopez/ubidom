<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.calicon{
width: 27px;
height: 27px;
margin-top : 1px;
}
</style>
<script type="text/javascript">
var o;
var gridMain;   
var calMain;
$(document).ready(function(){
	ubi.init(2,[1,2,3,4,5,6],"1C");
	o = ubi.getDataSet(); 
	//연간생산계획등록(라인코드)
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("품목코드,품명,포장,단위,1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월,합계",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("left,left,left,left,right,right,right,right,right,right,right,right,right,right,right,right,right");
	gridMain.setColTypes("ro,ro,ro,ro,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron");
	gridMain.setColSorting("str,str,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
	byId("stDate").value = t;
});
function fn_new(){
	
}
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
}
function fn_popupDeptCode(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  연도
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                       <span>
						 <img id="calpicker" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
					   </span>
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-10 col-md-10 col-sm-offset-2 col-md-offset-2">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
             </div>
		 </div>
	    </div>
      </div>      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 라인코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="lineCode" id="lineCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>      
  </form>
</div>