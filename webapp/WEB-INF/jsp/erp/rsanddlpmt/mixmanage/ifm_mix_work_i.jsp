<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.calicon{
width: 27px;
height: 27px;
margin-top : 1px;
}
</style>
<script type="text/javascript">
var o;
var gridMst;
var gridDtl;
var calMain;
$(document).ready(function(){
	ubi.init(3,[2,3,4,5,6],"2E");
	o = ubi.getDataSet(); 
	//배합작업등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("NO,제품코드,제품명,배합수량,배합중량,Batch,선택",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100");
	gridMst.setColAlign("center,left,left,right,right,left,center");
	gridMst.setColTypes("ron,ro,ro,ron,ron,ro,ra");
	gridMst.setColSorting("int,str,str,int,int,str,na");
	gridMst.attachFooter(",합계,,0,0,,0");
	gridMst.init();	
	
	gridDtl = o.slayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("NO,원료코드,원료명,단위소요량,배합수량,투입중량",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,right,right,right");
	gridDtl.setColTypes("ron,ro,ro,ron,ron,ron");
	gridDtl.setColSorting("int,str,str,int,int,int");
	gridDtl.attachFooter(",합계,,0,0,0");
	gridDtl.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	    var t = dateformat(new Date());
		byId("stDate").value = t;
});
function fn_new(){
	
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
			  일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                       <span>
						 <img id="calpicker" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
					   </span>
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
             </div>
		 </div>
	    </div>
      </div>      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 작업자
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="worker" id="worker" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
			<div class="form-group form-group-sm">
			 <div class="col-sm-12 col-md-7">
				  <label class="col-sm-2 col-md-2 control-label" for="textinput">
					제품군 
			      </label>
				  <div class="col-sm-2 col-md-2">
					 <div class="col-sm-4 col-md-4">
						<input type="radio" name="gubn" id="gubn" value="1군" checked="checked">1군
					 </div>
					 <div class="col-sm-4 col-md-4">
						<input type="radio" name="gubn" id="gubn" value="2군">2군
					 </div>
					 <div class="col-sm-4 col-md-4">
						<input type="radio" name="gubn" id="gubn" value="3군">3군
					 </div>
				   </div>
				   <label class="col-sm-2 col-md-2 control-label" for="textinput">
					  제품군 
			         </label>
			         <div class="col-sm-2 col-md-2">
				       <select name="productfamily" id="productfamily" class="form-control input-xs">
				        <option value="1군">1군</option>
				        <option value="2군">2군</option>
				        <option value="3군">3군</option>
				       </select>
				     </div>
				</div>
			</div>
		</div>      
  </form>
</div>