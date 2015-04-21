<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3],"2U");
	//급/상여수정
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,사번,성명,직위,기본급,직책수당,연장수당,심야수당,특근수당,휴일수당,식대보조금,자가운전보조,년차수당,"+
			"기타수당,상여,급여총액,국민연금,건강보험,고용보험,장기요양보험,소득세,지방소득세,연말정산건강,연말정산소득,연말정산지,기타공제,차감액,지급액",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMst.setColAlign("center,left,left,left,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right");
	gridMst.setColTypes("ron,ro,ro,ro,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn");
	gridMst.setColSorting("int,str,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int");
	gridMst.init();	
	subLayout.cells("a").setWidth(403);
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,사번,성명,직위,기본급,직책수당,연장수당,심야수당,특근수당,휴일수당,식대보조금,자가운전보조,년차수당,"+
			"기타수당,상여,급여총액,국민연금,건강보험,고용보험,장기요양보험,소득세,지방소득세,연말정산건강,연말정산소득,연말정산지,기타공제,차감액,지급액",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,left,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right");
	gridDtl.setColTypes("ron,ro,ro,ro,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn");
	gridDtl.setColSorting("int,str,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int");
	gridDtl.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y/%m");
	calMain.hideTime();	   
    var t1 = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t1+"/"+m;
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
function fn_search(){
	
}
function fn_save(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  급여년월 
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
			 <div class="col-sm-4 col-md-4 col-sm-offset-1 col-md-offset-1">
			   <div class="col-sm-3 col-md-3">
			      <input type="radio" name="mgubn" id="mgubn" value="급여" checked="checked">급여
			   </div>
			    <div class="col-sm-3 col-md-3">
			      <input type="radio" name="mgubn" id="mgubn" value="상여">상여
			   </div>
			    <div class="col-sm-6 col-md-6">
			      <input type="radio" name="mgubn" id="mgubn" value="성과급">성과급
			   </div>
			 </div>
		  </div>
	   </div>
	 </div>  
  </form>
 </div> 
</div>