<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var myGrid;

$(function() {
	myGrid = new dxGrid("gridDiv", false);
	myGrid.addHeader({name:"편집", 		colId:"editStat", 	width:"5", 	align:"center", type:"ro"});
	myGrid.addHeader({name:"삭제", 		colId:"chk", 		width:"5", 	align:"center", type:"ch"});
	myGrid.addHeader({name:"번호", 		colId:"rnum", 		width:"10", align:"center", type:"ro"});
	myGrid.addHeader({name:"품목코드", 	colId:"itemCode", 	width:"25", align:"center", type:"ed"});
	myGrid.addHeader({name:"품목명", 		colId:"itemName", 	width:"25", align:"center", type:"ed"});
	myGrid.addHeader({name:"규격", 		colId:"itemSize", 	width:"25", align:"center", type:"ed"});
	myGrid.attachEvent("onCheck", fn_GridCheck);
	myGrid.init();
	myGrid.getDxObj().enableSmartRendering(true);
	myGrid.getDxObj().setAwaitedRowHeight(25);
	
	/*
	myGrid = new dhtmlXGridObject('gridDiv');
	myGrid.setImagePath("/component/dhtmlxGrid/imgs/");
	myGrid.setHeader("rnum,itemCode,itemName,itemSize");
	myGrid.setColumnIds("no,itemCode,itemName,itemSize");
	myGrid.setInitWidths("50,200,200,200");
	myGrid.setColAlign("center,center,center,center");
	myGrid.setColTypes("ro,ed,ed,ed");
	myGrid.init();
	myGrid.enableSmartRendering(true);
	myGrid.setAwaitedRowHeight(25);
	*/

	g_dxRules = {
		itemCode : [r_notEmpty, r_minLen + "|2"],
		itemName : [r_notEmpty, r_minLen + "|2"],
		itemSize : [r_notEmpty]
	};

	$("#btnSearch").click(function() {
		fn_loadGridList();
	});
	
	$("#btnAdd").click(function() {
		var totalColNum = myGrid.getColumnCount();
		var rnumColIdx = myGrid.getColIndexById('rnum');
		
		var data = new Array(totalColNum);
		data[rnumColIdx] = '0';
		myGrid.addRow(data, myGrid.getRowsNum()+1, 1);
		editCol = editCol + (myGrid.getRowsNum()-1) + ";";
	});

	$("#btnSave").click(function(){
		var jsonStr = myGrid.getJsonUpdated2();

		if (jsonStr == null || jsonStr.length <= 0) return;
		
        $("#jsonData").val(jsonStr);
        
		$.ajax({
			url : "/erp/gridTest/prcs",
	        type : "POST",
	        data : $("#pform").serialize(),
	        async : true,
	        success : function(data) {
	        	MsgManager.alertMsg("INF001");
				fn_loadGridList();
	        }
		});
	});
	
	$("#btnRemove").click(function() {
		if(myGrid.isSelRows(1)) {
			if(!MsgManager.confirmMsg("INF002")) { //삭제하시겠습니까?
				return;
			}
		
			var jsonStr = myGrid.getJsonChecked(1);
			if (jsonStr == null || jsonStr.length <= 0) return;
			
	        $("#jsonData").val(jsonStr);
	        $.ajax({
				url : "/erp/gridTest/prcs",
		        type : "POST",
		        data : $("#pform").serialize(),
		        async : true,
		        success : function(data) {
		        	MsgManager.alertMsg("INF003");
					fn_loadGridList();
		        }
			});
		} else {
			MsgManager.alertMsg("WRN002");
		}
	});
});

function fn_loadGridList() {
	gfn_gridLoadXml("/erp/gridTest/list", {}, myGrid, fn_setCount);
	editCol = "";
	delCol = "";
}

function fn_setCount() {
	$("#totalCount").text(myGrid.getRowsNum());
}

function fn_GridCheck(selectedRowId, chkColumnId) {
    if(myGrid.getDxObj().cells2(selectedRowId-1,chkColumnId).getValue()=="1") {
    	delCol = delCol + ";";
    }
}
</script>

<form id="pform" name="pform" method="post">
	<input type="hidden" id="jsonData" name="jsonData"/>
</form>

<div>
	<div>
		<div style="line-height:35px;padding:5px 10px 0px 10px">
			<input type="button" value="조회" id="btnSearch">&nbsp;
			<input type="button" value="추가" id="btnAdd">&nbsp;
			<input type="button" value="저장" id="btnSave">&nbsp;
			<input type="button" value="삭제" id="btnRemove">&nbsp;&nbsp;&nbsp;&nbsp;
			<b>Total</b> : <span id = "totalCount"></span>건
		</div>
	</div>
</div>

<div id="gridDiv" style="width:100%;height:95%; background-color:white;overflow:hidden"></div>