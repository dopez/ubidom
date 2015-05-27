<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"2U"); 
	//검사기준등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("품목코드,품명,규격,단위",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100");
	gridMst.setColAlign("left,left,left,left");
	gridMst.setColTypes("ro,ro,ed,ro");
	gridMst.setColSorting("str,str,str,str");
	gridMst.init();	
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("품목정보");	
	subLayout.cells("a").setWidth(400);
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("검사항목코드,검사항목,검사기준,허용오차,#cspan",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100");
	gridDtl.setColAlign("left,left,left,right,right");
	gridDtl.setColTypes("ro,ro,ro,edn,edn");
	gridDtl.setColSorting("str,str,str,int,int");
	gridDtl.init();	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("검사항목별 기준");	
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
		     <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
		      품목코드
		     </label>
			 <div class="col-sm-2 col-md-2">
			    <input type="text" name="itemCode" id="itemCode" value="" placeholder="" class="form-control input-xs">
			 </div>
             <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
		       품명
		     </label>
			 <div class="col-sm-2 col-md-2">
			    <input type="text" name="itemName" id="itemName" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	    </div>
      </div>     
  </form>
 </div> 
</div>
