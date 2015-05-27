<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl01, gridDtl02;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"4C");
	//포장BOM등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("포장자재",null,
			         ["text-align:center;"]);
	gridMst.setInitWidths("100");
	gridMst.setColAlign("left");
	gridMst.setColTypes("ro");
	gridMst.setColSorting("str");
	gridMst.init();	
	subLayout.cells("a").setWidth(103);
	
	subLayout.cells("b").attachObject("bootContainer2");
	subLayout.cells("b").setHeight(150);
	
	gridDtl01 = subLayout.cells("c").attachGrid();
	gridDtl01.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl01.setHeader("포장코드,포장명,규격,단위,수량,Loss율,사용일자,사용유무,비고",null,
			           ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl01.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridDtl01.setColAlign("left,left,left,left,right,right,center,center,left");
	gridDtl01.setColTypes("ro,ro,ro,ro,edn,edn,dhxCalendarA,coro,ed");
	gridDtl01.setColSorting("str,str,str,str,int,int,date,str,str");
	gridDtl01.init();	
	subLayout.cells("c").showHeader();
	subLayout.cells("c").setText("BOM등록");	
	
	gridDtl02 = subLayout.cells("d").attachGrid();
	gridDtl02.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl02.setHeader("공정,구분,공정순서",null,
			           ["text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl02.setInitWidths("100,100,100");
	gridDtl02.setColAlign("center,center,right");
	gridDtl02.setColTypes("coro,coro,ro");
	gridDtl02.setColSorting("na,na,int");
	gridDtl02.init();
	subLayout.cells("d").showHeader();
	subLayout.cells("d").setText("공정등록");

	var tbrlayout = subLayout.cells("d");
	subToolbar(toolbar,tbrlayout,[3,5,6]);
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
				포장코드
		  </label>
			<div class="col-sm-2 col-md-2">
			    <input type="text" name="packCode" id="packCode" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('자재코드','common/matrCodePOP')">		
			</div>
		  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				포장명
		  </label>
		   <div class="col-sm-2 col-md-2">
			    <input type="text" name="packName" id="packName" value="" placeholder="" class="form-control input-xs">		
		  </div>
		 </div>
	    </div>
      </div>     
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
			   포장코드
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="packCode" id="packCode" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('자재코드','common/matrCodePOP')">		
			 </div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
			   포장명
			  </label>
			  <div class="col-sm-2 col-md-2">
			    <input type="text" name="packName" id="packName" value="" placeholder="" class="form-control input-xs">		
			 </div>
	    </div>
      </div>  
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
			   규격
			  </label>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
			   가로
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="width" id="width" value="" placeholder="" class="form-control input-xs">		
			 </div>
			 <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   세로
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="heightLen" id="heightLen" value="" placeholder="" class="form-control input-xs">		
			 </div>
			 <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   높이
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="height" id="height" value="" placeholder="" class="form-control input-xs">		
			 </div>
			 <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
			   단위
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="unit" id="unit" value="" placeholder="" class="form-control input-xs">		
		      </div>
	    </div>
      </div> 
  </form>
 </div> 
</div>