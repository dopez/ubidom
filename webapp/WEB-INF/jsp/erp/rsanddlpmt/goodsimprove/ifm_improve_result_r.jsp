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
var gridMain;
var calMain;
$(document).ready(function(){
	ubi.init(4,[1,8],"1C");
	o = ubi.getDataSet(); 
	//개선결과조회
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("NO,개선결과등록일자,배정일자,관리번호,고객,요청자,품목코드,품명,사용설비,개선전상태,개선후상태,담당자,납기일자,완료일자",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,center,center,right,left,left,left,left,left,left,left,left,center,center");
	gridMain.setColTypes("ron,ro,ro,ron,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
	gridMain.setColSorting("int,date,date,int,str,str,str,str,str,str,str,str,date,date");
	gridMain.init();		

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_popupCustomerCode(){
	
}
function fn_popupCharge(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">  
       <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-12 col-md-7">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				  기간 
				</label>
				<div class="col-sm-5 col-md-5">
					<div class="col-sm-5 col-md-5">
					   <div class="input-group date" id="date1">
						  <div class="col-sm-9 col-md-9">
							 <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="" >
						  </div>
						  <div class="col-sm-3 col-md-3">
							 <span>
						       <img id="calpicker1" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0" onclick="setSens(1,'edDate', 'max')">
						      </span>
						  </div>
					  </div>
					 </div>
				 <label class="col-sm-1 col-md-1 control-label" for="textinput"  style="margin-right: 15px;">~</label>
				 <div class="col-sm-5 col-md-5">
					 <div class="input-group date" id="date2">
						 <div class="col-sm-9 col-md-9">
							<input type="text" class="form-control input-xs" name="edDate" id="edDate" value="" >
						 </div>
						  <div class="col-sm-3 col-md-3">
						    <span>
						       <img id="calpicker2" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0" onclick="setSens(1,'stDate', 'min')">
						     </span>
						   </div>
					   </div>
				  </div>
				</div>
			</div>
		</div>
	  </div>    
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 고객
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="customer" id="customer" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>   
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 요구자
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="demander" id="demander" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 담당자
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>   
  </form>
</div>