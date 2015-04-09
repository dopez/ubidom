<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var o;
var gridMst;
var gridDtl01;
var gridDtl02;
$(document).ready(function(){
	ubi.init(1,[1,2,3,4,5,6],"4C");
	o = ubi.getDataSet(); 
	//포장BOM등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("포장자재",null,["text-align:center;"]);
	gridMst.setInitWidths("100");
	gridMst.setColAlign("left");
	gridMst.setColTypes("ro");
	gridMst.setColSorting("str");
	gridMst.init();	
	o.slayout.cells("a").setWidth(100);
	
	o.slayout.cells("b").attachObject("bootContainer2");
	o.slayout.cells("b").setHeight(150);
	
	gridDtl01 = o.slayout.cells("c").attachGrid();
	gridDtl01.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl01.setHeader("포장코드,포장명,규격,단위,수량,Loss율,사용일자,사용유무,비고",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl01.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridDtl01.setColAlign("left,left,left,left,right,right,center,center,left");
	gridDtl01.setColTypes("ro,ro,ro,ro,edn,edn,dhxCalendarA,coro,ed");
	gridDtl01.setColSorting("str,str,str,str,int,int,date,str,str");
	gridDtl01.init();	
	o.slayout.cells("c").showHeader();
	o.slayout.cells("c").setText("BOM등록");	
	
	gridDtl02 = o.slayout.cells("d").attachGrid();
	gridDtl02.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl02.setHeader("공정,구분,공정순서",null,
			["text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl02.setInitWidths("100,100,100");
	gridDtl02.setColAlign("center,center,right");
	gridDtl02.setColTypes("coro,coro,ro");
	gridDtl02.setColSorting("na,na,int");
	gridDtl02.init();
	o.slayout.cells("d").showHeader();
	o.slayout.cells("d").setText("공정등록");

	var tbrlayout = o.slayout.cells("d");
	subToolbar(toolbar,tbrlayout,[3,5,6]);
});

 var subToolbar = function(toolbar,sublayout,btn_id_array){
	
	toolbar = sublayout.attachToolbar();
		
	    var size = 18;
	    toolbar.clearAll();
	    toolbar.setIconSize(18);
	    toolbar.setIconsPath("/images/button/dhtmlx/");
	    toolbar.loadStruct("/common/json/button.json",fn_onLoad1);

	    function fn_onLoad1(){
	    	var item_id_set_arr = [1,2,3,4,5,6,7,8,9,10];
	    	
	    	for(var i=0; i< btn_id_array.length; i++){
	    		var index = item_id_set_arr.indexOf(btn_id_array[i]);
	            if (index > -1) {
	            	item_id_set_arr.splice(index, 1);
	            }
	    	}
	    	for(var i=0; i<item_id_set_arr.length; i++){
	    	
	    		toolbar.removeItem("btn"+item_id_set_arr[i]);	// item
	    		toolbar.removeItem("sep"+item_id_set_arr[i]); // seperator
	    	}	
	    }
	} 
function fn_new(){
	
}
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
function fn_popupMatrCode(){
	
}
function fn_popupGoodsCode(){
	
}
function fn_saveSub(){
	
}
function fn_row_insertSub(){
	
}
function fn_row_deleteSub(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
		  <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				포장코드
		  </label>
			<div class="col-sm-2 col-md-2">
			    <input type="text" name="packCode" id="packCode" value="" placeholder="" class="form-control input-xs">		
			</div>
		  <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
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
<div id="bootContainer2" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
			   포장코드
			  </label>
			  <div class="col-sm-2 col-md-2">
			    <input type="text" name="packCode" id="packCode" value="" placeholder="" class="form-control input-xs">		
			 </div>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
			   포장명
			  </label>
			  <div class="col-sm-2 col-md-2">
			    <input type="text" name="packName" id="packName" value="" placeholder="" class="form-control input-xs">		
			 </div>
	    </div>
      </div>  
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
			   규격
			  </label>
	    </div>
      </div> 
      <div class="row">
		<div class="form-group form-group-sm">
		     <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
			   가로
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="width" id="width" value="" placeholder="" class="form-control input-xs">		
			 </div>
			 <label class=" col-sm-1 col-md-1 control-label" for="textinput"> 
			   세로
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="heightLen" id="heightLen" value="" placeholder="" class="form-control input-xs">		
			 </div>
			 <label class=" col-sm-1 col-md-1 control-label" for="textinput"> 
			   높이
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="height" id="height" value="" placeholder="" class="form-control input-xs">		
			 </div>
			 <label class=" col-sm-1 col-md-1 control-label" for="textinput"> 
			   단위
			  </label>
			  <div class="col-sm-1 col-md-1">
			    <input type="text" name="unit" id="unit" value="" placeholder="" class="form-control input-xs">		
		      </div>
	    </div>
      </div> 
  </form>
</div>