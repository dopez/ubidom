<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8],"1C");
	//적금전표생성
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,예금종류,은행,계좌번호,예금명,월불입액,납입일,결제은행,결제계좌번호,전표번호,"+
			           "계정",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                       "100");
	gridMain.setColAlign("center,left,left,left,left,right,center,left,left,left,"+
	                     "left");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ron,ro,ro,ro,ro,"+
	                     "ro");
	gridMain.setColSorting("int,str,Str,str,Str,int,date,str,str,str,"+
	                       "Str");
	gridMain.init();	

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
			 납입일
			 </label>
			<div class="col-sm-1 col-md-1">
			  <input name="nDay" id="nDay" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	   </div>
	  </div>  
       <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  전표일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                      <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-2 col-md-2 col-sm-offset-1 col-md-offset-1">
			  <input name="jpss" id="jpss" type="button" value="전표생성" class="form-control btn-default btn btn-xs">
			</div>
			<label class="col-sm-5 col-md-5 control-label" for="textinput" style="text-align: left;">
			 납입일자로 조회한후 전표일자로 전표생성을 합니다.
			 </label>
		 </div>
	    </div>
      </div>        
   </form>
 </div> 
</div>