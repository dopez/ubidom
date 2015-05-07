<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var orinGrid;
var config={
	title:"품목코드",
	id:"itemCode",
	width:"300",
	height:"500"
}
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//품목코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer2");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	
	gridMain.addHeader({name:"품목코드", colId:"itemCode", 	width:"15", align:"center", type:"ro"});
	gridMain.addHeader({name:"품목명", 	colId:"itemName", 	width:"15", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","itemCode");
	gridMain.init(); 
	
	var params = "itemCode=" + parent.fn_onOpenPop();
	gfn_gridLoad("/erp/subTest",params, gridMain, fn_PopValue);
	
	
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	    	  var params = "itemCode=" + $("#itemCode").val();
	    	  gfn_gridLoad("/erp/subTest",params, gridMain, fn_PopValue);
	         }
	});
	
	 function fn_PopValue(){
		 gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	 }
	 
	 function doOnRowDblClicked(rId,cInd){
		  var row = rId-1;
		  var cell = cInd;
		  var itemCode = gridMain.setCells2(row,0).getValue();
		  var itemName = gridMain.setCells2(row,1).getValue();
		  var arr = [{"itemCode":itemCode,"itemName":itemName}];
		  parent.fn_onClosePop(config.id,arr)
	  }
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer2" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label" id="poplabel" for="textinput">
			 품목명
			</label>
			<div class="col-xs-6">
			  <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>  
  </form>
</div>
