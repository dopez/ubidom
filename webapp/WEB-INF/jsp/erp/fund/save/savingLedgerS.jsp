<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5],"1C");
	//수탁어음현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,예금종류,은행,계좌번호,적금명,가입일,만기일,월불입액,만기금액,만기이자,"+
			           "이율,납입일,계정,세목,결제은행,결제계좌번호,사용유무,수금여부",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                       "100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,center,center,right,right,right,"+
	                     "right,center,left,left,left,left,center,center");
	gridMain.setColTypes("ron,ed,ed,ed,ed,dhxCalendarA,dhxCalendarA,edn,edn,edn,"+
	                     "edn,dhxCalendarA,ed,ed,ed,ed,ch,coro");
	gridMain.setColSorting("int,str,str,str,str,date,date,int,int,int,"+
	                       "int,date,str,Str,str,str,na,na");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
});
function fn_search(){
	
}
function fn_new(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_row_insert(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
	  <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-3 col-md-3 control-label" for="textinput">
			 미사용통장보기
			 </label>
			<div class="col-sm-1 col-md-1">
			  <input name="nusebank" id="nusebank" type="checkbox" value="y">
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>