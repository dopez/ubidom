<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var o; 
var gridMst;
var calMain;
$( document ).ready(function() {
	
	ubi.init(2,[2,3,4,5,6],"2E"); //품의서결재
	
	o = ubi.getDataSet();
	
	//form//
	o.layout.cells("b").attachObject("bootContainer2");
	

	
	//up
		
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/");     
	gridMst.setHeader("종류,일자,품의자,제목,금액,기간");
	gridMst.setInitWidths("100,100,100,100,100,100");       
	gridMst.setColAlign("center,center,center,left,right,center");     
	gridMst.setColTypes("ro,ro,ro,ro,ron,ron"); 
	gridMst.setColSorting("str,date,str,str,int,int");
	gridMst.init();
	
	o.slayout.cells("b").showHeader();
	o.slayout.cells("b").setText("내용");
	gridDtl = o.slayout.cells("b").attachGrid();
	gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/");     
	gridDtl.setHeader("No,내용", null, 
				[]);
	gridDtl.setInitWidths("100,880");       
	gridDtl.setColAlign("center,left");     
	gridDtl.setColTypes("ro,ro"); 
	gridDtl.setColSorting("str,str");
	gridDtl.init();

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
.calicon{
width: 27px;
height: 27px;

}
</style>
<div id="container"
	style="position: relative; widtd: 100%; height: 100%; overflow: auto;">
	</div>
<div id="bootContainer2">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;"
		id="frmMain">
		<div class="row">
			<div class="col-sm-6 col-md-6">
				<div class="row">
			<div class="form-group form-group-sm">
				
					<label class=" col-sm-4 col-md-2 control-label" for="textinput">
						기간 </label>

					<div class="col-sm-8 col-md-6">
						<div class="col-sm-4 col-md-4">
							<div class="input-group date" id="date1">
								<div class="col-sm-10 col-md-10">
									<input type="text" class="form-control input-xs" name="stDate"
										id="stDate" value="">
								</div>
								<div class="col-sm-2 col-md-2">
									<span> <img id="calpicker1" class="calicon"
										src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
										onclick="setSens(1,'edDate', 'max')">
									</span>
								</div>
							</div>
						</div>
						<label class="col-sm-1 col-md-1 control-label" for="textinput"
							style="margin-right: 15px;">~</label>
						<div class="col-sm-4 col-md-4">
							<div class="input-group date" id="date2">
								<div class="col-sm-10 col-md-10">
									<input type="text" class="form-control input-xs" name="edDate"
										id="edDate" value="">
								</div>
								<div class="col-sm-2 col-md-2">
									<span> <img id="calpicker2" class="calicon"
										src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
										onclick="setSens(1,'stDate', 'min')">
									</span>
								</div>
							</div>
						</div>
					</div>

				
			</div>
		</div>
				<div class="row">
					<div class="form-group form-group-sm">
						<label class=" col-sm-4 col-md-2 control-label" for="textinput">
							작성자 </label>
						<div class="col-sm-4 col-md-2">
							<input name="regEmpName" id="regEmpName" type="text" value=""
								placeholder="" class="form-control input-xs">
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-6">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<table class="table-bordered">
							<tr>
								<td rowspan="2" class="col-md-1">결<br>재</td>
								<td class="col-md-1">작성</td>
								<td class="col-md-1">검토</td>
								<td class="col-md-1">검토</td>
								<td class="col-md-1">승인</td>
							</tr>
							<tr>
								<td class="col-md-1">&nbsp;<br>&nbsp;
								</td>
								<td class="col-md-1">&nbsp;<br>&nbsp;
								</td>
								<td class="col-md-1">&nbsp;<br>&nbsp;
								</td>
								<td class="col-md-1">&nbsp;<br>&nbsp;
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
