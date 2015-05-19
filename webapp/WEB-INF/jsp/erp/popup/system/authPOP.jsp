<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout,divAddDel;
var gridMst,treeMain;
var config={
		title:"권한등록 :: "+parent.menuNameParam,
		width:"620",
		height:"500"
	}
var menuname = parent.menuNameParam; //메뉴이름
var menucd = parent.menucdParam; //메뉴코드
$(document).ready(function(){
	Ubi.setContainer(1,[1,3],"3W");
	//권한등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    //사용자별, 그룹별 라디오 버튼 div
    layout.cells("b").attachObject("groupGbn");

    //cell 사이즈
    subLayout.cells("a").setWidth(230);
	subLayout.cells("b").setWidth(130);
	
	//버튼 div
	divAddDel = subLayout.cells("b").attachObject("divAddDel");
	
	//라디오 버튼 클릭 function
	fn_rdo_onClick();
	
	//버튼 클릭 이벤트
	$("#btnAdd").on("click",fn_btnAdd);
	$("#btnDel").on("click",fn_btnDel);
});
//doc Ready End

//조회 버튼 동작
function fn_search(){
	fn_noAuthList();
	fn_authList();
}
function fn_save(){
        var jsonStr = gridMst.getJsonUpdated2();
        console.log(jsonStr);
        if (jsonStr == null || jsonStr.length <= 0) return;
        $("#jsonData").val(jsonStr);
        $("#Pmenucd").val(menucd);
        $.ajax({
            url: "/erp/system/menuS/authSave",
            type: "POST",
            data: $("#hiddenform").serialize(),
            async: true,
            success: function(data) {
                MsgManager.alertMsg("INF001");
                gridMst.clearAll();
                fn_authList();
                gridDtl.clearAll();
                fn_noAuthList();
            }
        });
    
}
// 한줄 삭제 (테스트용);
function fn_delete() {
    var selRowID = gridMst.getSelectedRowId();
    var selRowIDx = gridMst.getSelectedRowIndex();
    if (gridMst.isDelRows(selRowID)) {
        if (MsgManager.confirmMsg("INF002")) {
            if (gridMst.chkUnsavedRow(selRowIDx, selRowID)) {
                return
            } else {
                var jsonStr = gridMst.getJsonRowDel(selRowID);
                if (jsonStr == null || jsonStr.length <= 0) return;
                $("#jsonData").val(jsonStr);
                $("#Pmenucd").val(menucd);
                console.log($("#hiddenform").serialize());
                $.ajax({
                    url: "/erp/system/menuS/authSave",
                    type: "POST",
                    data: $("#hiddenform").serialize(),
                    async: true,
                    success: function(data) {
                        MsgManager.alertMsg("INF003");
                        gridMst.clearAll();
                        fn_authList();
                        gridDtl.clearAll();
                        fn_noAuthList();
                    }
                });
            }
        } else {
            MsgManager.alertMsg("WRN004");
        }
    } else {
        MsgManager.alertMsg("WRN002");
    }
}
//우측 그리드 조회
function fn_noAuthList(){
	var param = "menucd="+menucd;
	gfn_callAjaxForGrid(gridDtl,param,"/erp/system/menuS/selNoAuthList",subLayout.cells("c"),fn_callBack);
}

//좌측 그리드 조회
function fn_authList(){
	var param = "menucd="+menucd;
	gfn_callAjaxForGrid(gridMst,param,"/erp/system/menuS/selAuthList",subLayout.cells("a"),fn_callBack);
}

//콜백
function fn_callBack(){
	
}

//라디오 버튼 클릭 이벤트
function fn_rdo_onClick() {
  if (userGbn.checked) {
  	gridMst = new dxGrid(subLayout.cells("a"), false);
      gridMst.addHeader({name:"사용자ID", colId:"multicd", 	width:"50", align:"center", type:"ro"});
  	gridMst.addHeader({name:"사용자명", 	 colId:"pname", 	width:"49", align:"center", type:"ro"});
  	gridMst.setColSort("str");	
  	gridMst.setUserData("","pk","multicd");
  	gridMst.init();
  	
  	gridDtl = new dxGrid(subLayout.cells("c"), false);
  	gridDtl.addHeader({name:"사용자ID", colId:"logid", 	width:"18", align:"center", type:"ro"});
  	gridDtl.addHeader({name:"사용자명", 	 colId:"personname", 	width:"18", align:"center", type:"ro"});
  	gridDtl.setColSort("str");	
  	gridDtl.setUserData("","pk","logid");
  	gridDtl.init();
  	
  	fn_authList();
  	fn_noAuthList();
  	
  } else {
  	gridMst = new dxGrid(subLayout.cells("a"), false);
      gridMst.addHeader({name:"그룹코드", colId:"groupId", 	width:"50", align:"center", type:"ro"});
  	gridMst.addHeader({name:"그룹명", 	 colId:"groupName", 	width:"48", align:"center", type:"ro"});
  	gridMst.setColSort("str");	
  	gridMst.setUserData("","pk","userId");
  	gridMst.init();
  	
  	gridDtl = new dxGrid(subLayout.cells("c"), false);
  	gridDtl.addHeader({name:"그룹코드", colId:"groupId", 	width:"20", align:"center", type:"ro"});
  	gridDtl.addHeader({name:"그룹명", 	 colId:"groupName", 	width:"20", align:"center", type:"ro"});
  	gridDtl.setColSort("str");	
  	gridDtl.setUserData("","pk","userId");
  	gridDtl.init();
  }
}

//추가 버튼 이벤트
function fn_btnAdd(){
    var selRowId = gridDtl.getSelectedRowId();
    var selRowIdx = gridDtl.getSelectedRowIndex(selRowId);
    
    var logid = gridDtl.setCells2(selRowIdx, "0").getValue(selRowIdx - 1);
    var personname = gridDtl.setCells2(selRowIdx, "1").getValue(selRowIdx - 1);
	
    var totalColNum = gridMst.getColumnCount();
  	var totalRowNum = gridMst.getRowsNum();
  	
  	var multicdColIdx = gridMst.getColIndexById("multicd");
  	var pnameColIdx = gridMst.getColIndexById("pname");
  	
  	var data = new Array(totalColNum);
  		data[multicdColIdx] = logid;
  		data[pnameColIdx] = personname;
  	
  	gridDtl.dxObj.deleteRow(selRowId);
	gridMst.addRow(data);
  	gridMst.selectRow(totalRowNum);
}

//제거 버튼 이벤트
function fn_btnDel(){
    var selRowId = gridMst.getSelectedRowId();
    var selRowIdx = gridMst.getSelectedRowIndex(selRowId);
	 if (gridMst.isDelRows(selRowId)) {
            if (fn_chkUnsavedRow(selRowIdx, selRowId)) {
                return
            } else {
                var jsonStr = gridMst.getJsonRowDel(selRowId);
                if (jsonStr == null || jsonStr.length <= 0) return;
                $("#jsonData").val(jsonStr);
                $("#Pmenucd").val(menucd);
                console.log($("#hiddenform").serialize());
                $.ajax({
                    url: "/erp/system/menuS/authSave",
                    type: "POST",
                    data: $("#hiddenform").serialize(),
                    async: true,
                    success: function(data) {
                        MsgManager.alertMsg("INF003");
                        gridMst.clearAll();
                        fn_authList();
                        gridDtl.clearAll();
                        fn_noAuthList();
                    }
                });
            }
    } else {
        MsgManager.alertMsg("WRN002");
    }
}

//좌측 그리드에서 우측그리드로 row 이동
function fn_MstToDtl(){
	var selRowId = gridMst.getSelectedRowId();
    var selRowIdx = gridMst.getSelectedRowIndex(selRowId);
	var multicd = gridMst.setCells2(selRowIdx, "0").getValue(selRowIdx - 1);
    var pname = gridMst.setCells2(selRowIdx, "1").getValue(selRowIdx - 1);
	
    var totalColNum = gridDtl.getColumnCount();
  	var totalRowNum = gridDtl.getRowsNum();
  	
  	var logidColIdx = gridDtl.getColIndexById("logid");
  	var personnameColIdx = gridDtl.getColIndexById("personname");
  	
  	var data = new Array(totalColNum);
  		data[logidColIdx] = multicd;
  		data[personnameColIdx] = pname;
	
  	gridMst.dxObj.deleteRow(selRowId);
	gridDtl.addRow(data);
	gridDtl.selectRow(totalRowNum);
}

//cudkey chk 
function fn_chkUnsavedRow(rowNum,rowId){
	var cudColIdx = gridMst.dxObj.getColIndexById(cudKeyCol);
	var isDelRow = false;
	var cudColVal = gridMst.dxObj.cells2(rowNum,cudColIdx).getValue();
	if (cudColVal == actInsert) {
		isDelRow = true;
		fn_MstToDtl();
	}
	return isDelRow;
}
</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="Pmenucd" name="Pmenucd" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="divAddDel" style="display:table; height:100%; width:100%; background:linear-gradient(#e0e0e0, #d9d9d9);overflow:hidden;text-align:center;">
    <div class="form-group form-group-sm" style=" position:absolute;top: 50%;display:table-cell; vertical-align:middle;  margin-top:-40%;">
        <div class="col-sm-offset-1 col-sm-10">
            <input name="btnAdd" id="btnAdd" type="button" value="◀ 추가" placeholder="" class="btn btn-default btn-xs form-control" style="margin-bottom: 15px">
            <input name="btnDel" id="btnDel" type="button" value="제거 ▶" placeholder="" class="btn btn-default btn-xs form-control">
        </div>
    </div>
</div>
<div id="groupGbn" style="position: relative;">
    <div class="container">
	    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
	        <div class="form-group form-group-sm">
	            <div class="col-sm-2 col-md-2">
		            <div class="col-sm-offset-1 col-sm-11 col-md-11">
		                <input type="radio" id="userGbn" name="groupGbn" value="0" onclick="fn_rdo_onClick()" checked="checked">사용자별
		                <input type="radio" id="gpGbn"name="groupGbn" value="1" onclick="fn_rdo_onClick()">그룹별
		            </div>
	            </div>
	        </div>
	    </form>
    </div>
</div>