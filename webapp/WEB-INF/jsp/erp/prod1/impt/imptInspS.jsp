<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"2E");
	//수입검사등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("입고요청일자,공급업체,품목코드,품명,규격,단위,입고요청수량,최종판정,처리결과",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridMst.setColAlign("center,left,left,left,left,left,right,right,right");
	gridMst.setColTypes("ro,ro,ro,ro,ro,ro,ron,ron,ron");
	gridMst.setColSorting("date,str,str,str,str,str,int,int,int");
	gridMst.init();	
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("검사대기");	
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("검사항목코드,검사항목명,규격,허용오차,#cspan,검사값,#cspan,#cspan,#cspan,#cspan,"+
			          "판정",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			         "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			         "text-align:center;"]);
	gridDtl.attachHeader("#rspan,#rspan,#rspan,하한,상한,X1,X2,X3,X4,X5,"+
			             "#rspan",
			            ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
	                     "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
	                     "text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,50,50,50,50,50,"+
			              "100");
	gridDtl.setColAlign("left,left,left,right,right,right,right,right,right,right,"+
			            "center");
	gridDtl.setColTypes("ro,ro,ro,ron,ron,edn,edn,edn,edn,edn,"+
			            "coro");
	gridDtl.setColSorting("str,str,str,int,int,int,int,int,int,int,"+
			              "na");
	gridDtl.init();	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("검사항목별 기준 및 검사값");	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.hideTime();	   
    var t = dateformat(new Date());
	byId("stDate").value = t;
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
			  점검일자 
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
   </form>
  </div>
</div>