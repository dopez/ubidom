<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst,gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,4],"2E");
	//복지지급품의등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("신청일자,부서,직급,성명,현재포인트,신청포인트,선택,결재,#cspan,#cspan,"+
			          "#cspan",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;"]);
	gridMst.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,작성,검토,검토,"+
			             "승인",
			            ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,70,70,70,"+
			              "70");
	gridMst.setColAlign("center,left,left,left,right,right,center,center,center,center,"+
			            "center");
	gridMst.setColTypes("ro,ro,ro,ro,ron,ron,ra,ro,ro,ro,"+
			            "ro");
	gridMst.setColSorting("date,str,str,str,int,int,na,str,str,str,"+
			              "str");
	gridMst.init();	

	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("접수일자,신청일자,현재포인트,신청포인트,신청항목,관련증빙",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;"]);
    gridDtl.setInitWidths("100,100,100,100,100,100");
	gridDtl.setColAlign("center,center,right,right,left,center");
	gridDtl.setColTypes("ro,ro,ron,ron,ro,ro");
	gridDtl.setColSorting("date,date,int,int,str,str");
	gridDtl.attachFooter("합계,,,,,");
	gridDtl.init();
	
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
			  일자 
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
   </form>
 </div>
</div>