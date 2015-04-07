<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.calicon{
width: 32px;
height: 28px;
}
</style>
<script type="text/javascript">
var o;
var gridMst;
var gridDtl;     
var calMain;
$(document).ready(function(){
	ubi.init(1,[1,2,3,4,5,6],"2E");
	o = ubi.getDataSet(); 
	//담세척등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,입고일자,품목코드,품명,포장,단위,세척전재고,선택",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100");
	gridMst.setColAlign("center,center,left,left,left,left,right,center");
	gridMst.setColTypes("ron,ro,ro,ro,ro,ro,ron,ra");
	gridMst.setColSorting("int,date,str,str,str,str,int,na");
	gridMst.init();	
	o.slayout.cells("a").showHeader();
	o.slayout.cells("a").setText("세척전재고내역");
	
	gridDtl = o.slayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,품목코드,품명,포장,단위,세척전재고,세척,건조,선별,#cspan,#cspan,세척후재고",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,양품,불량,계,#rspan",
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,50,50,50,100");
	gridDtl.setColAlign("center,left,left,left,left,right,right,right,right,right,right,right");
	gridDtl.setColTypes("ron,ro,ro,ro,ro,ron,ch,ch,edn,edn,ron,ron");
	gridDtl.setColSorting("int,str,str,str,str,int,int,int,int,int,int,int");
	gridDtl.init();	
	o.slayout.cells("b").showHeader();
	o.slayout.cells("b").setText("세척내역");

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
			  <div class="col-sm-5 col-md-5">
				 <div class="col-sm-5 col-md-5">
				  <div class="input-group date" id="date">
						<div class="col-sm-9 col-md-9">
						<input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
						</div>
						<div class="col-sm-3 col-md-3">
						  <span>
						    <img id="calpicker" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						  </span>
						</div>
					</div>
				 </div>
				 <div class="col-sm-2 col-md-2" style="margin-left: 10px;">
                <input  name="snum" id="snum" type="text" value="0001" readonly="readonly" class="form-control input-xs">
                </div>
			 </div> 
		 </div>
	    </div>
      </div>          
  </form>
</div>