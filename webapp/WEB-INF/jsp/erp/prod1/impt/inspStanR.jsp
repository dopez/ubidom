<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8,9],"1C");
	//검사기준조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,품목코드,품명,단위,검사항목,검사기준,허용오차,#cspan",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,하한값,상한값",
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,left,right,right");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ron,ron");
	gridMain.setColSorting("int,str,str,str,str,str,int,int");
	gridMain.init();		
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
function fn_popupItemCode(){
	
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
			 품목코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('품목코드','common/itemCodePOP')">
			</div>
		  </div>
	  </div>
	</div>   
  </form>
 </div> 
</div>