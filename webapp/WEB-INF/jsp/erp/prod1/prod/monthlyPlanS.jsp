<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"1C");
	//월간생산계획등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("품목코드,품명,포장,단위,전월실적,#cspan,재고,1일,2일,3일,"+
			           "4일,5일,6일,7일,8일,9일,10일,11일,12일,13일,"+
			           "14일,15일,16일,17일,18일,19일,20일,21일,22일,23일,"+
			           "24일,25일,26일,27일,28일,29일,30일,31일,합계",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,매출,생산,#rspan,#rspan,#rspan,#rspan,"+
			              "#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,"+
			              "#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,"+
			              "#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan",
			             ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,50,50,50,50,50,50,"+
			               "50,50,50,50,50,50,50,50,50,50,"+
			               "50,50,50,50,50,50,50,50,50,50,"+
			               "50,50,50,50,50,50,50,50,50");
	gridMain.setColAlign("left,left,left,left,right,right,right,right,right,right,"+
			             "right,right,right,right,right,right,right,right,right,right,"+
			             "right,right,right,right,right,right,right,right,right,right,"+
			             "right,right,right,right,right,right,right,right,right");
	gridMain.setColTypes("ro,ro,ro,ro,ron,ron,ron,edn,edn,edn,"+
			             "edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,"+
			             "edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,"+
			             "edn,edn,edn,edn,edn,edn,edn,edn,edn");
	gridMain.setColSorting("str,str,str,str,int,int,int,int,int,int,"+
			               "int,int,int,int,int,int,int,int,int,int,"+
			               "int,int,int,int,int,int,int,int,int,int,"+
			               "int,int,int,int,int,int,int,int,int");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y/%m");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t+"/"+m;
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  연월
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
             </div>
		 </div>
	    </div>
      </div>           
  </form>
 </div> 
</div>