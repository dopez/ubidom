<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var o; 
var gridMain;
var calMain;
$( document ).ready(function() {
	
	ubi.init(2,[1,2,3,4,5,6],"1C"); //시험검사의뢰등록
	
	o = ubi.getDataSet();
	
	//form//
	o.layout.cells("b").attachObject("bootContainer2");

	//grid	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");      //11
	gridMain.setHeader("No,공급업체,품목코드,품명,규격,단위,수량,단가,금액,납기일자,납품장소", null, 
					[]);
	gridMain.attachFooter("소계,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,&nbsp;,&nbsp;",[]);
	gridMain.attachFooter("합계,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,&nbsp;,&nbsp;",[]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100");       
	gridMain.setColAlign("center,left,left,left,left,center,right,right,right,center,center");     
	gridMain.setColTypes("ron,ed,ed,ed,ed,ed,edn,edn,edn,dhxCalendar,ed"); 
	gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
	gridMain.init();
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;
})
</script>
<style>


</style>
<div id="container"
	style="position: relative; width: 100%; height: 100%; overflow: auto;">
	</div>
<div id="bootContainer2">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;"
		id="frmSearch">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 일자 </label>
					<div class="col-sm-2 col-md-2">
						
							<div class="col-sm-10 col-md-10">
								<input name="stDate" id="stDate" type="text"
									value="" placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-2 col-md-2">
								<span>
						       <img id="calpicker1" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
							</div>
						
					</div>
					<div class="col-sm-1 col-md-1">
						<div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
						<input name="seqNo" id="seqNo" type="text"
									value="" placeholder="" class="form-control input-xs" disabled="disabled"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 품의자 </label>
					<div class="col-sm-2 col-md-2">
						<input name="reqName" id="reqName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
		
	</form>
</div>
