<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(4,[1,3,4,5,6],"2E");
	//세금계산서발행
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");

	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,고객,공급가액,세액,발행일자,구분,발행",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100");
	gridMst.setColAlign("center,left,right,right,center,center,center");
	gridMst.setColTypes("ron,ro,ron,ron,dhxCalendarA,ch,ra");
	gridMst.setColSorting("int,str,int,int,date,na,na");
	gridMst.attachFooter(",합계,,,,,");
	gridMst.init();	
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,마감일자,고객,품명,규격,수량,단가,공급가액,세액",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridDtl.setColAlign("center,center,left,left,left,right,right,right,right");
	gridDtl.setColTypes("ron,ro,ro,ro,ro,ron,ron,ron,ron");
	gridDtl.setColSorting("int,date,str,str,str,int,int,int,int");
	gridDtl.attachFooter(",합계,,,,,,,");
	gridDtl.init();
	
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
function fn_delete(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
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
			  일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                    <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
             </div>
		 </div>
	    </div>
      </div>
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 담당
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>  
	  <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 고객
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="custom" id="custom" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('고객','common/customPOP')">
			</div>
		  </div>
	  </div>
	</div> 
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 구분
			 </label>
			<div class="col-sm-3 col-md-3">
			 <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn" id="gubn" value="일반" checked="checked">일반
			  </div>
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn" id="gubn" value="영세">영세
			  </div>
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn" id="gubn" value="면세">면세
			  </div>
		   </div>
		   <div class="col-sm-4 col-md-4" style="margin-left: 5px;">
			 <div class="col-sm-6 col-md-6">
			    <input type="button" name="taxcalcul" id="taxcalcul" value="세금계산서발행" class="btn btn-default form-control">
			  </div>
			  <div class="col-sm-6 col-md-6">
			    <input type="button" name="mchS" id="mchS" value="매출전표생성" class="btn btn-default form-control">
			  </div>
			</div>
		  </div>
	  </div>
	</div>        
  </form>
 </div> 
</div>