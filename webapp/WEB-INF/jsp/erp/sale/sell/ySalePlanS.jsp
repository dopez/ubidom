<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;   
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"1C");
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	//연간판매계획등록
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");//col 31
	gridMain.setHeader("품목코드,품명,포장,단위,단가,1월,#cspan,2월,#cspan,3월,#cspan,4월,#cspan,5월,#cspan,6월,#cspan,7월,#cspan,8월,#cspan,9월,#cspan,10월,#cspan,11월,#cspan,12월,#cspan,합계,#cspan");
	gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액,수량,금액");
	gridMain.attachFooter("계,#cspan,#cspan,#cspan,#cspan,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0");
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,");
	gridMain.setColAlign("left,left,center,center,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right");
	gridMain.setColTypes("ed,ed,ed,ed,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn");
	gridMain.setColSorting("str,str,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
	byId("stDate").value = t;
	
});

</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer">
<div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
		<div class="row">
			<div class="col-sm-7 col-md-7">
				<div class="form-group form-group-sm">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						연도 </label>
					<div class="col-sm-2 col-md-2">
							<div class="col-sm-10 col-md-10">
								<input name="stDate" id="stDate" type="text" value=""
									placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-2 col-md-2">
								<input type="button" id="calpicker1" class="calicon form-control">
							</div>
						
					</div>
					<div class="col-sm-1 col-md-1">
						<div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
							<input name="seqNo" id="seqNo" type="text" value=""
								placeholder="" class="form-control input-xs" disabled="disabled">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-7 col-md-7">
				<div class="form-group form-group-sm">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						담당 </label>
					<div class="col-sm-2 col-md-2">
						<input name="chargeName" id="chargeName" type="text" value=""
							placeholder="" class="form-control input-xs">
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>