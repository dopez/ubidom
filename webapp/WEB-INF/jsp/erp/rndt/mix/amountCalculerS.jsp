<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[2,3,4,5,6],"1C");
	//배합수량계산
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("NO,제품코드,제품명,제품재고,재공재고,적정재고,미출하수량,과부족수량,배합중량,생산예정수량",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,right,right,right,right,right,right,right");
	gridMain.setColTypes("ron,ro,ro,ron,ron,ron,ron,ron,edn,ron");
	gridMain.setColSorting("int,str,str,int,int,int,int,int,int,int");
	gridMain.attachFooter(",합계,,0,0,0,0,0,0,0");
	gridMain.init();	

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
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmCalcul" name="frmCalcul" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-7 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                      <input type="button" id="calpicker" class="calicon">
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
		  <div class="col-sm-7 col-md-7">
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
			 <div class="col-sm-7 col-md-7">
				  <label class="col-sm-2 col-md-2 control-label" for="textinput">
					제품군 
			      </label>
				  <div class="col-sm-3 col-md-3">
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
</div>