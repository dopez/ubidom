<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var o;
var gridMst;
var gridDtl;
$(document).ready(function(){
	ubi.init(1,[1,3,4,5,6],"2U");
	o = ubi.getDataSet(); 
	//제코드등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("코드,코드명",null,["text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("200,200");
	gridMst.setColAlign("left,left");
	gridMst.setColTypes("ro,ro");
	gridMst.setColSorting("str,str");
	gridMst.init();	
	o.slayout.cells("a").setWidth(400);
	
	gridDtl = o.slayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,내부코드,내부코드명,변수,비고",null,["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,200,200,200,200");
	gridDtl.setColAlign("center,left,left,right,left");
	gridDtl.setColTypes("ron,ro,ro,ron,ro");
	gridDtl.setColSorting("int,str,str,int,str");
	gridDtl.init();	
	
});
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				코드
		   </label>
			<div class="col-sm-1 col-md-1">
			 <input type="text" name="baseCode" id="baseCode" value="" placeholder="" class="form-control input-xs">
			</div>
			<div class="col-sm-2 col-md-2" style="margin-left: 10px;">
			 <input type="text" name="baseCode" id="baseCode" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	    </div>
      </div>     
  </form>
</div>