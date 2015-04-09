<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var o; 
var gridMain;
var calMain;
$( document ).ready(function() {
	
	ubi.init(1,[1,8,9],"2E"); //시험장비검교정결과등록
	
	o = ubi.getDataSet();
	
	//form//
	o.layout.cells("b").attachObject("bootContainer2");

	//grid	
	
	gridMain = o.slayout.cells("a").showHeader();
	gridMain = o.slayout.cells("a").setText("검교정대상 시험장비");
	gridMain = o.slayout.cells("a").attachGrid();
    gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //10
    gridMain.setHeader("No,장비코드,장비명,규격,용도,교정항목,교정주기,교정기간,최종교정일자,교정예정일자,선택");
    gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
    gridMain.setColAlign("center,left,left,left,left,center,center,center,center,center,center");
    gridMain.setColTypes("edn,ed,ed,ed,ed,ed,ed,ed,ed,ed,ra");
    gridMain.setColSorting("int,str,str,str,str,str,str,str,str,str,str");
    gridMain.init();
    
    gridMain = o.slayout.cells("b").showHeader();
	gridMain = o.slayout.cells("b").setText("검교정결과");
	gridDtl = o.slayout.cells("b").attachGrid();
    gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //10
    gridDtl.setHeader("No,장비코드,장비명,규격,용도,교정항목,교정주기,교정기간,검교정기간,교정비용,검교정결과");
    gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
    gridDtl.setColAlign("center,left,left,left,left,center,center,center,center,center,center");
    gridDtl.setColTypes("edn,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed");
    gridDtl.setColSorting("int,str,str,str,str,str,str,str,str,str,str");
    gridDtl.init();
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;

})

</script>
<style>
.calicon{
	width: 32px; 
	height: 28px;
}

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
						<div class="input-group date" id="date">
							<div class="col-sm-9 col-md-9">
								<input name="stDate" id="stDate" type="text"
									value="" placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-3 col-md-3">
								<span>
						       <img id="calpicker1" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
							</div>
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
	</form>
</div>