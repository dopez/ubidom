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
$(document).ready(function(){
	ubi.init(2,[1,2,3,4,5,6],"2E");
	o = ubi.getDataSet(); 
	//수입검사등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("입고요청일자,공급업체,품목코드,품명,규격,단위,입고요청수량,최종판정,처리결과",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridMst.setColAlign("center,left,left,left,left,left,right,right,right");
	gridMst.setColTypes("ro,ro,ro,ro,ro,ro,ron,ron,ron");
	gridMst.setColSorting("date,str,str,str,str,str,int,int,int");
	gridMst.init();	
	o.slayout.cells("a").showHeader();
	o.slayout.cells("a").setText("검사대기");	
	
	gridDtl = o.slayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("검사항목코드,검사항목명,규격,허용오차,#cspan,검사값,#cspan,#cspan,#cspan,#cspan,판정",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.attachHeader("#rspan,#rspan,#rspan,하한,상한,X1,X2,X3,X4,X5,#rspan",
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,50,50,50,50,50,100");
	gridDtl.setColAlign("left,left,left,right,right,right,right,right,right,right,center");
	gridDtl.setColTypes("ro,ro,ro,ron,ron,edn,edn,edn,edn,edn,coro");
	gridDtl.setColSorting("str,str,str,int,int,int,int,int,int,int,na");
	gridDtl.init();	
	o.slayout.cells("b").showHeader();
	o.slayout.cells("b").setText("검사항목별 기준 및 검사값");	
	
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
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 등록자
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="register" id="register" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>      
  </form>
</div>