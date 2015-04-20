<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4],"2U");
	//라인작업등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("부서코드,부서명",null,["text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("200,200");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();	
	subLayout.cells("a").setWidth(400);
	
	subLayout.cells("b").attachObject("bootContainer2");
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
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">	
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
		    부서코드
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="deptCode" id="deptCode" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
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
</div>
<div id="bootContainer2" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				라인코드
		   </label>
			<div class="col-sm-1 col-md-1">
			 <input type="text" name="lineCode" id="lineCode" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('라인코드','common/lineCodePOP')">
			</div>
	    </div>
      </div>
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				라인명
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="lineName" id="lineName" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				주생산제품
		   </label>
			<div class="col-sm-1 col-md-1">
			 <input type="text" name="workProduct" id="workProduct" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('제품코드','common/goodsCodePOP')">
			</div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				인원
		   </label>
			<div class="col-sm-1 col-md-1">
			 <input type="text" name="employee" id="employee" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				일생산수량
		   </label>
			<div class="col-sm-1 col-md-1">
			 <input type="text" name="dayWorkAmount" id="dayWorkAmount" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
      </div>       
  </form>
 </div> 
</div>