<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(4,[1,2,3,4,5,6,7,8,9],"1C"); //재료출고의뢰조회
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");

	//grid	
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");      //12
	gridMain.setHeader("No,의뢰일자,의뢰자,재료코드,재료명,단위,의뢰수량,출고수량,미출고수량,사용일자,용도", null, 
					[]);
	gridMain.setInitWidths("50,100,100,200,200,100,100,100,100,100,100");       
	gridMain.setColAlign("center,center,center,left,left,center,right,right,right,center,center");     
	gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro"); 
	gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
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

<div id="container"
	style="position: relative; width: 100%; height: 100%;">
	</div>
<div id="bootContainer2">
<div class="container">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;"
		id="frmSearch">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-7 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						기간 </label>

					<div class="col-sm-6 col-md-6">
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
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-7 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 의뢰자 </label>
					<div class="col-sm-2 col-md-2">
						<input name="rqstName" id="rqstName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-7 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 공급업체 </label>
					<div class="col-sm-2 col-md-2">
						<input name="suplCompName" id="suplCompName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-7 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 구분 </label>
					<div class="col-sm-4 col-md-4">
						<div class="col-xs-4 col-sm-4 col-md-4">
						  <input type="radio"
							name="searchGbn" value="1" checked="checked">전체
						</div>
						<div class="col-xs-4 col-sm-4 col-md-4">
						  <input type="radio"
							name="searchGbn" value="2">의뢰
						</div>
						<div class="col-xs-4 col-sm-4 col-md-4">
						  <input type="radio"
							name="searchGbn" value="3">미출고
						</div>
					</div>
				</div>
			</div>
			</div>
	</form>
	</div>
</div>