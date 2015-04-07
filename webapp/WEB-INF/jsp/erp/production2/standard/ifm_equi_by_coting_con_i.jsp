<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.calicon{
width: 32px;
height: 28px;
}
</style>
<script type="text/javascript">
var o;
var gridMst;
var gridDtl;
var calMain;
$(document).ready(function(){
	ubi.init(1,[1,2,3,4,5,6],"3L");
	o = ubi.getDataSet(); 
	//설비별코팅조건등록
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("설비코드,설비명",null,["text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100");
	gridMst.setColAlign("left,left");
	gridMst.setColTypes("ro,ro");
	gridMst.setColSorting("str,str");
	gridMst.init();	

	gridDtl = o.slayout.cells("c").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,약품명,온도,진공도,애칭,어시스트,두께,Rate,에칭,방식",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,right,right,right,right,right,right,left");
	gridDtl.setColTypes("edn,ed,ed,edn,edn,edn,edn,edn,edn,ed");
	gridDtl.setColSorting("int,str,str,int,int,int,int,int,int,str");
	gridDtl.init();	
	o.slayout.cells("c").showHeader();
	o.slayout.cells("c").setText("코팅조건");
	
	o.slayout.cells("b").attachObject("bootContainer");
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	    var t = dateformat(new Date());
		byId("stDate").value = t;
});
function fn_new(){
	
}
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
}
function fn_popupBaseMatr(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  일자 
			</label>
			 <div class="col-sm-5 col-md-5">
			    <div class="col-sm-5 col-md-5">
				  <div class="input-group date" id="date">
					 <div class="col-sm-9 col-md-9">
						<input type="text" class="form-control input-xs" name="stDate" id="stDate" value="" >
					 </div>
					 <div class="col-sm-3 col-md-3">
					      <span>
						     <img id="calpicker" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						  </span>
					 </div>
				   </div>
				</div>
			     <div class="col-sm-2 col-md-2" style="margin-left: 10px;">
                    <input  name="snum" id="snum" type="text" value="0001" readonly="readonly" class="form-control input-xs">
                </div>
		   </div> 
	    </div>
      </div>      
      <div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 설비코드
		    </label>
			<div class="col-sm-2 col-md-2">
			  <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
     <div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 설비명
		    </label>
			<div class="col-sm-4 col-md-4">
			  <input name="equiName" id="equiName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
	<div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 모재
		    </label>
			<div class="col-sm-2 col-md-2">
			  <input name="baseMatr" id="baseMatr" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
	<div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 생산능력
		    </label>
			<div class="col-sm-2 col-md-2">
			  <input name="pudcability" id="pudcability" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
	<div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 적정인원
		    </label>
			<div class="col-sm-2 col-md-2">
			  <input name="suitableEmp" id="suitableEmp" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
  </form>
</div>