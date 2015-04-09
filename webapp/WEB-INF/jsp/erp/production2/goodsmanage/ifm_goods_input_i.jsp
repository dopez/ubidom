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
var gridMst;
var gridDtl;     
var calMain;
$(document).ready(function(){
	ubi.init(3,[1,2,3,4,5,6],"2E");
	o = ubi.getDataSet(); 
	//제품입고등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,요청일자,요청부서,담당,품목코드,품명,단위,요청수량,선택",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridMst.setColAlign("center,center,left,left,left,left,left,right,center");
	gridMst.setColTypes("ron,ro,ro,ro,ro,ro,ro,ron,ra");
	gridMst.setColSorting("int,date,str,str,str,str,str,int,na");
	gridMst.init();	
	o.slayout.cells("a").showHeader();
	o.slayout.cells("a").setText("입고요청내역");
	
	gridDtl = o.slayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,품목코드,품명,단위,요청수량,입고수량",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,left,right,right");
	gridDtl.setColTypes("ron,ro,ro,ro,ron,edn");
	gridDtl.setColSorting("int,str,str,str,int,int");
	gridDtl.init();	
	o.slayout.cells("b").showHeader();
	o.slayout.cells("b").setText("입고내역");

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
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
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
       <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  일자 
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
                  <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
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
			 담당
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 구분
			 </label>
			 <div class="col-sm-2 col-md-2">
				<div class="col-sm-4 col-md-4">
					<input type="radio" name="gubn" id="gubn" value="반품" checked="checked">반품
				</div>
				<div class="col-sm-4 col-md-4">
					<input type="radio" name="gubn" id="gubn" value="기타">기타
				</div>
			</div>
		  </div>
	  </div>
	</div>           
  </form>
</div>