<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var mygrid;
var myMenu;

$(function() {
	
	//fncMenuConf();
	
	mygrid = new dxGrid("gridDiv", false);
	
	mygrid.addHeader({name:"편집", 		colId:"editStat", 	width:"5", 	align:"center", type:"ro"});
	mygrid.addHeader({name:"삭제", 		colId:"chk", 		width:"5", 	align:"center", type:"ch"});
	mygrid.addHeader({name:"시스템코드", 	colId:"sysCd", 		width:"10", align:"center", type:"ed"});
	mygrid.addHeader({name:"시스템명", 	colId:"sysNm", 		width:"*", 	align:"center", type:"ed"});
	mygrid.addHeader({name:"표시순서", 	colId:"viewIdx", 	width:"10", align:"center", type:"ed"});
	mygrid.addHeader({name:"사용여부", 	colId:"useYn", 		width:"10", align:"center", type:"coro"});
	mygrid.addHeader({name:"생성일", 		colId:"strCdate", 	width:"15", align:"center", type:"ro"});
	mygrid.addHeader({name:"생성자", 		colId:"strCuser", 	width:"15", align:"center", type:"ro"});
	
	/*
	mygrid.setHeader("편집,선택,시스템코드,시스템명,표시순서,사용여부,생성일,생성자");
	mygrid.setColId("editStat,chk,sysCd,sysNm,viewIdx,useYn,strCdate,strCuser");
	mygrid.setColWidthP("5,5,10,*,10,10,15,15");
	mygrid.setColAlign("center,center,center,center,center,center,center,center");
	mygrid.setColType("ro,ch,ed,ed,ed,coro,ro,ro");
	*/
	
	mygrid.setColSort("str");	
	//mygrid.setUseYnCol(mygrid.getColIndexById("topMenuYn"));
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
		//var topMenuYnColIdx = mygrid.getColIndexById('topMenuYn');
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
	        	MsgManager.alertMsg("INF001");
				fn_loadGridList();
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
		mygrid.getDxObj().toPDF("http://175.209.128.74/grid-pdf/generate");
	});
});

function fn_loadGridList() {
	gfn_gridLoad("/erp/sys", {}, mygrid, fn_setCount);
}

function fn_setCount() {
	$("#totalCount").text(mygrid.getRowsNum());
}

function fncMenuConf() {
	var req = $.ajax({
		url: "/erp/user/menu",
		type: "get",
		dataType: "json"
	});
	req.done(function(jsonData) {
		if("[]"!=JSON.stringify(jsonData)) {
			var data = {menuTree:jsonData};
			fncSetMenuLoad(data);
		} else {
			MsgManager.alertMsg("WRN040");
		}
	});
}

function fncSetMenuLoad(param) {
	if(myMenu!=null) {
		myMenu.getDxObj().destructor();
	}
	
	myMenu = new dxTree("menuTree");
	myMenu.setData(param.menuTree);
	myMenu.click(function(id){
		fncSelectItem(myMenu, id);
	});
	
	myMenu.load("menucd", "pmenucd", "menuname", myMenu);
}

function fncSelectItem(tree, id) {
	var exegbn = "";
	try {
		exegbn = tree.getUserData(id, "exegbn");
		if(exegbn=="0" && myMenu.getDxObj().getOpenState(id)==1) {
			myMenu.getDxObj().closeItem(id);
		} else {
			tree.getDxObj().openItem(id);
			tree.getDxObj().selectItem(id, false, false);
		}
	} catch(e){
		alert(e);
	}
	
	if(exegbn=="1") {
		var uri = tree.getUserData(id, "uri");
		alert(uri);
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
			<b>Total</b> : <span id = "totalCount"></span>건
		</div>
		<div class="grid-basic" style="width:100%;height:100%">
			<div id="gridDiv" ></div>
		</div>
	</div>
</div>
<div id="menuTree" style="width:300px"></div>