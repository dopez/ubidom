<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(2,[2,3,4,5,6],"2E"); //출장품의등록
	
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	
	subLayout.cells("a").attachObject("tableAppv");
	subLayout.cells("a").setHeight(132);
	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("출장내용");
	gridMain = subLayout.cells("b").attachGrid();
	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");      //10 col
	gridMain.setHeader("No,내용", null, 
				[]);
	gridMain.setInitWidths("100,880");       
	gridMain.setColAlign("center,left");     
	gridMain.setColTypes("ro,txt"); 
	gridMain.setColSorting("str,str");
	gridMain.init();

	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;

})

</script>
<style>


table{
	text-align: center;
}

</style>
<div id="container"
	style="position: relative; widtd: 100%; height: 100%;">
	</div>
<div id="bootContainer2">
<div class="container">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;"
		id="frmMain">
		<div class="row">
			<div class="col-sm-7 col-md-7">
				<div class="row">
					<div class="form-group form-group-sm">
						<label class=" col-sm-2 col-md-2 control-label" for="textinput">
							일자 </label>
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
								<input name="seqNo" id="seqNo" type="text" value=""
									placeholder="" class="form-control input-xs"
									disabled="disabled">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group form-group-sm">
						<label class=" col-sm-2 col-md-2 control-label" for="textinput">
							작성자 </label>
						<div class="col-sm-2 col-md-2">
							<input name="regEmpName" id="regEmpName" type="text" value=""
								placeholder="" class="form-control input-xs">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>
<div id="tableAppv">
<div class="container">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;"
		id="frmMain02">
		<div class="row">
		<div class="col-md-9 col-sm-9">
			<table class="col-md-offset-1 table table-bordered">
				<tr>
					<td class="col-md-1">출장지</td>
					<td class="col-md-6"></td>
					<td class="col-md-1" rowspan="3"><br>결<br>
					<br>재</td>
					<td class="col-md-1" >작성</td>
					<td class="col-md-1">검토</td>
					<td class="col-md-1">검토</td>
					<td class="col-md-1">승인</td>
				</tr>
				<tr>
					<td>경비</td>
					<td></td>
					<td rowspan="2"></td>
					<td rowspan="2"></td>
					<td rowspan="2"></td>
					<td rowspan="2"></td>
				</tr>
				<tr>
					<td>출장기간</td>
				<td></td>
				</tr>
			</table>
		</div></div>
	</form></div>
</div>
