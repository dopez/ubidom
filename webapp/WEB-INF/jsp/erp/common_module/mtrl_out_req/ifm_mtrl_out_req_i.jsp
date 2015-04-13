<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(3,[1,2,3,4,5,6],"1C"); //재료출고의뢰등록
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");     
	gridMain.setHeader("No,재료코드,재료명,규격,단위,수량,사용일자,용도", null, 
				[]);
	gridMain.setInitWidths("50,150,200,150,100,100,100,200");       
	gridMain.setColAlign("center,left,left,left,center,right,center,center");     
	gridMain.setColTypes("ro,ed,ed,ed,ed,edn,edn,ed,ed"); 
	gridMain.setColSorting("str,str,str,str,str,int,int,date,str");
	gridMain.init();
	

	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;
		/* byId("edDate").value = t; */
	

})

</script>
<style>
table{
	text-align: center;
}

#forSpace02{
	height: 60px;
}
#appv{
	width: 20px;
}
</style>
<div id="container"
	style="position: relative; widtd: 100%; height: 100%;">
	</div>
<div id="bootContainer2">
<div class="container">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;"
		id="frmSearch">
		<div class="row">
			<div class="col-sm-7 col-md-7">
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
							의뢰자 </label>
						<div class="col-sm-4 col-md-2">
							<input name="rqstName" id="rqstName" type="text" value=""
								placeholder="" class="form-control input-xs">
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3">
				<div class="row">
					<table class="table table-bordered">
						<tr>
							<td id="appv"rowspan="2"><br>결<br><br>재
							</td>
							<td id="forSpace01">작성</td>
							<td>검토</td>
							<td>승인</td>
						</tr>
						<tr>
							<td id="forSpace02"></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>