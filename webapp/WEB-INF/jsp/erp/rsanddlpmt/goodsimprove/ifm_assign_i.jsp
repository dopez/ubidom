<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var o; 
var gridMain;
var calMain;
$( document ).ready(function() {
	
	ubi.init(2,[1,2,3,4,5,6],"2E"); //접수,배정 등록
	
	o = ubi.getDataSet();
	
	//form//
	o.layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	
	
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/");      //10 col
	gridMst.setHeader("No, 관리번호,납기일자,고객,요청자,품목코드,품명,사용설비,상태,선택", null, 
					["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",]);
	gridMst.setInitWidths("50,100,100,200,100,150,150,200,200,50");       
	gridMst.setColAlign("center,left,center,left,center,left,left,left,left,center");     
	gridMst.setColTypes("ro,ed,ed,ed,ed,ed,ed,ed,ed,ch"); 
	gridMst.setColSorting("str,str,str,str,str,str,str,str,str,str");
	gridMst.init();
	/* o.slayout.cells("a").appendObject("thisLabel01").init(); */
//down
	gridDtl = o.slayout.cells("b").attachGrid();
	gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/");      //11col
	gridDtl.setHeader("No, 관리번호,고객,요청자,품목코드,품명,사용설비,상태,담당자,납기일자,완료일자", null,
						["text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;"]);
	gridDtl.setInitWidths("50,100,200,100,150,150,200,200,100,100,100");       
	gridDtl.setColAlign("center,center,left,center,left,left,left,left,center,center,center");     
	gridDtl.setColTypes("ro,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed"); 
	gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
	gridDtl.init();
	
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;
		/* byId("edDate").value = t; */
	

})


function fn_search() {
	
}
function fn_insert() {
	
}
function fn_save() {
	
}
function fn_edit() {
	
}
function fn_delete() {
	
}
function fn_close() {
	
}
function fn_popup_anonymous() {
	
}
function fn_print() {
	
}
function fn_excel() {
	
}


</script>
<style>


</style>
<div id="container"
	style="position: relative; width: 100%; height: 100%;">
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
									<input name="stDate" id="stDate" type="text" value=""
										placeholder="" class="form-control input-xs">
								</div>
								<div class="col-sm-2 col-md-2">
									<span> <img id="calpicker1"
										style="margin-top: 1px; widtd: 27px; height: 27px;"
										class="calicon"
										src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
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
						for="textinput"> 등록자 </label>
					<div class="col-sm-2 col-md-2">
						<input name="regName" id="regName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
	</form>
</div>