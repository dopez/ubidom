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
	gridMst.setColTypes("coro,dhxCalendar,ed,ed,edn,edn"); 
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
	gridDtl.setColTypes("ro,txt"); 
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
							일자 </label>
						<div class="col-sm-4 col-md-2">
							
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
						<div class="col-sm-2 col-md-1">
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

