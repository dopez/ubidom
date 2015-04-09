<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.calicon{
width: 27px;
height: 27px;
margin-top: 1px;
}
</style>
<script type="text/javascript">
var o;
var gridMain;   
$(document).ready(function(){
	ubi.init(1,[1,8,9],"1C");
	o = ubi.getDataSet(); 
	//연간판매계획조회
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");//col 33
	gridMain.setHeader("연도,차수,품목코드,품명,포장,단위,단가,1월,#cspan,2월,#cspan,3월,#cspan,4월,#cspan,5월,#cspan,6월,#cspan,7월,#cspan,8월,#cspan,9월,#cspan,10월,#cspan,11월,#cspan,12월,#cspan,합계,#cspan");
	gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액");
	gridMain.attachFooter("계,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0");
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,center,left,left,center,center,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right");
	gridMain.setColTypes("ro,ron,ro,ro,ro,ro,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron");
	gridMain.setColSorting("str,int,str,str,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y");
	calMain.hideTime();
	var t = new Date().getFullYear();
	byId("stDate").value = t;
	byId("edDate").value = t;
	
});

</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
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
	</form>
</div>