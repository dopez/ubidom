<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var orinGrid;
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//품목코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

    layout.cells("b").attachObject("bootContainer");

	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("품목코드,품목명",null,
			["text-align:center;","text-align:center;"]);
	gridMain.setColumnIds("itemCode,itemName");
	gridMain.setInitWidths("150,150");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();

	orinGrid = parent.window.gridMst;
	var getValue = orinGrid.setCells2(orinGrid.getSelectedRowIndex(),0).getValue();
	alert(getValue);

	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	           fn_loadGridList("/erp/subTest", {}, gridMain, fn_PopValue);
	         }
	});
	//실제 조회로직
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


	  function fn_PopValue(){
		gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	  }

	  function doOnRowDblClicked(rId,cInd){
		  var row = rId-1;
		  var cell = cInd;
		  var itemCode = gridMain.cells2(row,cell).getValue();
		  var itemName = gridMain.cells2(row,cell+1).getValue();
		 orinGrid.setCells2(orinGrid.getSelectedRowIndex(),0).setValue(itemCode);
		 orinGrid.setCells2(orinGrid.getSelectedRowIndex(),1).setValue(itemName);


	  }
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label" id="poplabel" for="textinput">
			 품목명
			</label>
			<div class="col-xs-6">
			  <input name="itemName" id="itemName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>
  </form>
</div>
