<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var mygrid;

$(function() {
	mygrid = new dxGrid("gridDiv", false);
	
	mygrid.addHeader({name:"편집", 		colId:"editStat", 	width:"5", 	align:"center", type:"ro"});
	mygrid.addHeader({name:"삭제", 		colId:"chk", 		width:"5", 	align:"center", type:"ch"});
	mygrid.addHeader({name:"시스템코드", 	colId:"sysCd", 		width:"10", align:"center", type:"ed"});
	mygrid.addHeader({name:"시스템명", 	colId:"sysNm", 		width:"*", 	align:"center", type:"ed"});
	mygrid.addHeader({name:"표시순서", 	colId:"viewIdx", 	width:"10", align:"center", type:"ed"});
	mygrid.addHeader({name:"사용여부", 	colId:"useYn", 		width:"10", align:"center", type:"coro"});
	mygrid.addHeader({name:"생성일", 		colId:"strCdate", 	width:"15", align:"center", type:"ro"});
	mygrid.addHeader({name:"생성자", 		colId:"strCuser", 	width:"15", align:"center", type:"ro"});
	
	mygrid.setUseYnCol(mygrid.getColIndexById("useYn"));
	mygrid.setUserData("","pk","sysCd");
	mygrid.init();

	g_dxRules = {
		sysCd : [r_notEmpty, r_len + "|3"],
		sysNm : [r_notEmpty, r_minLen + "|2", r_maxLen + "|6"],
		viewIdx : [r_notEmpty, r_onlyNumber, r_maxLen + "|3"]
	};
	
	fn_loadGridList();

	$("#btnSearch").click(function() {
		fn_loadGridList();
	});
	
	$("#btnAdd").click(function() {
		var totalColNum = mygrid.getColumnCount();
		var userYnColIdx = mygrid.getColIndexById('useYn');
		var strCdateColIdx = mygrid.getColIndexById('strCdate');
		var strCuserColIdx = mygrid.getColIndexById('strCuser');
		
		var data = new Array(totalColNum);
		
		data[userYnColIdx] = 'Y';
		data[strCdateColIdx] = '자동입력';
		data[strCuserColIdx] = '자동입력';
		
		mygrid.addRow(data, 0, 2);
	});

	$("#btnSave").click(function(){
		var jsonStr = mygrid.getJsonUpdated();
		if (jsonStr == null || jsonStr.length <= 0) return;
		
        $("#jsonData").val(jsonStr);
        
		$.ajax({
			url : "/erp/sys/prcs",
	        type : "POST",
	        data : $("#pform").serialize(),
	        async : true,
	        success : function(data) {
				if(data.rtnCode == "1") {
		        	MsgManager.alertMsg("INF001");
					fn_loadGridList();
				} else {
					return;
				}
	        }
		});
	});
	
	$("#btnRemove").click(function() {
		if(mygrid.isSelRows(1)) {
			if(!MsgManager.confirmMsg("INF002")) { //삭제하시겠습니까?
				return;
			} else {
				if(!mygrid.chkUnsavedRows()) {
					return;
				}
			}
		
			var jsonStr = mygrid.getJsonChecked(1);
			if (jsonStr == null || jsonStr.length <= 0) return;
			
	        $("#jsonData").val(jsonStr);
	        $.ajax({
				url : "/erp/sys/prcs",
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

	$("#btnPdf").click(function(){
		mygrid.getDxObj().toPDF("http://localhost/grid-pdf/generate");
	});

	$("#btnExcel").click(function(){
		mygrid.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
	});
});

function fn_loadGridList() {
	gfn_gridLoad("/erp/sys", {}, mygrid, fn_callBack);
}

function fn_callBack() {
	fncRowMerge(3);
	fncRowMerge(4);
	fncRowMerge(5);
	$("#totalCount").text(mygrid.getRowsNum());
}

function fncRowMerge(colIdx) {
	var preVal = mygrid.getDxObj().cells2(0,colIdx).getValue();
	var nowVal = "";
	for(var i = 1; i < mygrid.getRowsNum(); i++) {
		nowVal = mygrid.getDxObj().cells2(i,colIdx).getValue();
		if (preVal == nowVal) {
			var rowID = mygrid.getRowId(i);
			mygrid.getDxObj().setCellTextStyle(rowID, colIdx, "color:white;");
		}
		preVal = nowVal;
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
			<input type="button" value="삭제" id="btnRemove">&nbsp;&nbsp;
			<input type="button" value="PDF" id="btnPdf">&nbsp;&nbsp;
			<input type="button" value="XLS" id="btnExcel">&nbsp;&nbsp;
			<b>Total</b> : <span id = "totalCount"></span>건
		</div>
		<div class="grid-basic" style="width:100%;height:100%">
			<div id="gridDiv" ></div>
		</div>
	</div>
</div>
<div id="menuTree" style="width:300px"></div>