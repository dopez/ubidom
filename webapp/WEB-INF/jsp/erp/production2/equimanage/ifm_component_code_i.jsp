<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var o;
var gridMain;
$(document).ready(function(){
	ubi.init(1,[1,2,3,4],"2U");
	o = ubi.getDataSet(); 
	//부품코드등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("코드,부품명,규격",null,
			["text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100");
	gridMain.setColAlign("left,left,left");
	gridMain.setColTypes("ro,ro,ro");
	gridMain.setColSorting("str,str,str");
	gridMain.init();	
	o.slayout.cells("a").setWidth(300);
	
	o.slayout.cells("b").attachObject("bootContainer2");

});
function fn_new(){
	
}
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; "></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-7 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="code" id="code" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<div class="col-sm-4 col-md-4" style="margin-left: 10px;">
			     <input name="code2" id="code2" type="text" value="" placeholder="" class="form-control input-xs">			
 			</div>
		  </div>
	  </div>
	</div>
  </form>
</div>
<div id="bootContainer2" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     코드
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="code" id="code" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     종류
		   </label>
		   <div class="col-sm-1 col-md-1">
			  <button  type="button" class="btn btn-default form-control" name="sort1" id="sort1" >
			  2자
			  </button>
		   </div>
		   <div class="col-sm-1 col-md-1">
			  <button  type="button" class="btn btn-default form-control" name="sort2" id="sort2" >
			  3자
			  </button>
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     부품명
		   </label>
		   <div class="col-sm-4 col-md-4">
			  <input name="componentName" id="componentName" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     규격
		   </label>
		   <div class="col-sm-4 col-md-4">
			  <input name="standard" id="standard" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     단위
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="unit" id="unit" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
  </form>
</div>