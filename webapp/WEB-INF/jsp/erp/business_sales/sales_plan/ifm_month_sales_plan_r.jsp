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
	//연간판매계획등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");//col 31
	gridMain.setHeader("연월,품목코드,품명,포장,단위,재고,단가,출고실적,#cspan,N월,#cspan,N+1월,#cspan,N+2월,#cspan,N+3월,#cspan,N+4월,#cspan,N+5월,#cspan,N+6월,#cspan,N+7월,#cspan,N+8월,#cspan,N+9월,#cspan,N+10월,#cspan,N+11월,#cspan,합계,#cspan");
	gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,최근3개월,전월,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액");
	gridMain.attachFooter("계,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0");
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,");
	gridMain.setColAlign("left,left,left,center,center,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right");
	gridMain.setColTypes("ro,ro,ro,ro,ro,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron");
	gridMain.setColSorting("str,str,str,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y/%m");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t+"/"+m;
	byId("edDate").value = t+"/"+m;
});
function fn_monthLen(month){
 var initMonth;
	if(month < 10){		
		initMonth = "0"+month;
	}else{
		initMonth = month;
	}
	return initMonth;
}

</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
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