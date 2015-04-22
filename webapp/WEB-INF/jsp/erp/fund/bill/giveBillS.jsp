<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,3,5,6,8],"1C");
	//지급어음등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,어음종류,발행은행,어음번호,어음금액,만기일,비고,거래처,계정,세목,"+
			           "전표일자(발행일),전표No(발행일),전표일자(만기일),전표No(만기일)",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                       "100,100,100,100");
	gridMain.setColAlign("center,left,left,left,right,center,left,left,left,left,"+
	                     "center,center,center,center");
	gridMain.setColTypes("ron,ed,ed,ed,edn,dhxCalendarA,ed,ed,ed,ed,"+
	                     "dhxCalendarA,dhxCalendarA,dhxCalendarA,dhxCalendarA");
	gridMain.setColSorting("int,str,str,str,int,date,str,Str,str,str,"+
	                       "date,date,date,date");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
});
function fn_search(){
	
}
function fn_save(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
}
function fn_excel(){
	
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
			    발행일
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
  </form>
 </div> 
</div>