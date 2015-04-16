<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"1C");
	//건강검진대상자조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("부서,직급,성명,생년월일,마지막검진일자,다음검진일자",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100");
	gridMain.setColAlign("left,left,left,center,center,center");
	gridMain.setColTypes("ro,ro,ro,ro,ro,ro");
	gridMain.setColSorting("str,str,str,date,date,date");
	gridMain.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
	byId("stDate").value = t;
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  기준년도 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
		 </div>
	    </div>
      </div> 
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 등록자
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="register" id="register" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
		<div class="form-group form-group-sm">
			 <div class="col-sm-8 col-md-8">
				  <label class="col-sm-2 col-md-2 control-label" for="textinput">
					구분 
			      </label>
				  <div class="col-sm-4 col-md-4">
					 <div class="col-sm-3 col-md-3">
						<input type="radio" name="gubn" id="gubn" value="전체" checked="checked">전체
					 </div>
					 <div class="col-sm-4 col-md-4">
						<input type="radio" name="gubn" id="gubn" value="기준년도">기준년도
					 </div>
				   </div>
				</div>
		  </div>
	  </div>          
   </form>
 </div>
</div>