<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var o;
var gridMain;
$(document).ready(function(){
	ubi.init(1,[1,2,3,4],"2U");
	o = ubi.getDataSet(); 
	//라인작업등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("부서코드,부서명",null,["text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("200,200");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();	
	o.slayout.cells("a").setWidth(400);
	
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
function fn_popupDeptCode(){
	
}
function fn_popupGoodsCode(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
		    부서코드
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="deptCode" id="deptCode" value="" placeholder="" class="form-control input-xs">
			</div>
           <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
		    부서명
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="deptName" id="deptName" value="" placeholder="" class="form-control input-xs">
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
				라인코드
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="lineCode" id="lineCode" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
      </div>
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				라인명
		   </label>
			<div class="col-sm-4 col-md-4">
			 <input type="text" name="lineName" id="lineName" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				주생산제품
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="workProduct" id="workProduct" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				인원
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="employee" id="employee" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				일생산수량
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="dayWorkAmount" id="dayWorkAmount" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
      </div>       
  </form>
</div>