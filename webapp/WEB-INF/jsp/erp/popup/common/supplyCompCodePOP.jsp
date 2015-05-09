<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var width = 303;
var height = 300;
var title="공급업체코드";
var compId, compName;
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//공급업체코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("공급업체코드,공급업체명");
	gridMain.setColumnIds("compCode,compName");
	gridMain.setInitWidths("150,150");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.setUserData("","pk","compCode");
	gridMain.init(); 
	fn_gridPopLoad();
	
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	    	  /* var params = "itemCode=" + $("#itemCode").val();
	    	  fn_gridPopLoad();*/
	         }
	});
	function fn_gridPopLoad(){
		fn_loadGridList("/erp/subTest/selComp",{},gridMain,fn_toParentGrid);
	}
	function fn_loadGridList(url, data, grid, callback) {
		var rtn = "";
		$.ajax({
			"url":url,
			"type":"get",
			"data":data
		}).done(function(jsonData) {
			if(jsonData!="") {
				rtn = {"data":jsonData};
				grid.clearAll();
				grid.parse(rtn, "js");
				setGridHeight();
				if (callback != null) { 
					callback();
				}
	        } else {
	        	grid.clearAll();
	        	alert("No Data");
	        }
		});
};
	function fn_toParentGrid(){
			//alert("5");
			/* gridMain.attachEvent("onRowDblClicked", function(rId,cInd){
			compId=gridMain.cells2(rId-1,cInd).getCellValue();
			compId=gridMain.cells2(rId-1,cInd+1).getCellValue();
			
		}) */
	}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label" id="poplabel" for="textinput">
			 업체명
			</label>
			<div class="col-xs-6">
			  <input name="supplyCompName" id="supplyCompName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>  
  </form>
</div>