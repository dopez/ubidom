<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMst, calDtl;
$(document).ready(function(){
	Ubi.setContainer(4,[1],"1C");
	//급/상여생성
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,부서명,사번,성명,직위",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left");
	gridMain.setColTypes("ron,ro,ro,ro,ro");
	gridMain.setColSorting("int,str,str,str,str");
	gridMain.init();	
	
	calMst = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMst.loadUserLanguage("ko");
	calMst.setDateFormat("%Y/%m");
	calMst.hideTime();	   
    var t1 = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t1+"/"+m;
	
	calMst = new dhtmlXCalendarObject([{input:"giDate",button:"calpicker1"}]); 
	calMst.loadUserLanguage("ko");
	calMst.hideTime();	   
	 var t2 = dateformat(new Date());
	byId("giDate").value = t2;
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
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  지급일 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="giDate" id="giDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker1" class="calicon form-control">
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
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<div class="col-sm-3 col-md-3 col-sm-offset-1 col-md-offset-1">
			  <div class="col-sm-6 col-md-6">
			   <input type="button" name="cre" id="cre" value="생성" class="form-control btn btn-default btn-xs">
			  </div>
			  <div class="col-sm-6 col-md-6">
			   <input type="button" name="cre" id="cre" value="취소" class="form-control btn btn-default btn-xs">
			  </div>
			</div>
			<div class="col-sm-3 col-md-3 col-sm-offset-1 col-md-offset-1">
			  <div class="col-sm-6 col-md-6">
			   <input type="button" name="clo" id="clo" value="마감" class="form-control btn btn-default btn-xs">
			  </div>
			  <div class="col-sm-6 col-md-6">
			   <input type="button" name="clocc" id="clocc" value="마감취소" class="form-control btn btn-default btn-xs">
			  </div>
			</div>
		  </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>