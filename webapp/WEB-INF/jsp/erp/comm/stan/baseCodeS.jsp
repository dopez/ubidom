<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var gridMstCode;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"2U");
	//제코드등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

	layout.cells("b").attachObject("bootContainer");//attach search Condition div

	//좌측 그리드 config
	subLayout.cells("a").setWidth(300);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"코드",   colId:"code",     width:"150", align:"center", type:"ro"});
	gridMst.addHeader({name:"코드명", colId:"codeName", width:"150", align:"left",   type:"ro"});
	gridMst.setColSort("str");
	gridMst.setUserData("","pk","code");
	gridMst.init();
	gridMst.attachEvent("onRowSelect",doOnGridMstSelect);

	//우측 그리드 config
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"내부코드",   colId:"interCode", width:"100", align:"center",type:"ed"});
	gridDtl.addHeader({name:"내부코드명", colId:"interName", width:"150", type:"ed"});
	gridDtl.addHeader({name:"변수",       colId:"addVar",    width:"50", align:"center",type:"ed"});
	gridDtl.addHeader({name:"비고",       colId:"descRmk",   width:"50", align:"center",type:"ed"});
	gridDtl.setColSort("str");
	gridDtl.setUserData("","pk","");
	gridDtl.init();

	fn_loadGridMst(1);

});
//doc Ready End
function doOnGridMstSelect(id,ind){
	var code = gridMst.setCells(id,0).getValue();
	fn_loadGridDtl(code);
}
//btn function Start
function fn_search(){
	fn_loadGridMst(0);
	fn_cellChange(2);
}
//신규 버튼 동작
function fn_new(){
	var totalColNum = gridMst.getColumnCount();
  	var data = new Array(totalColNum);
  	var totalRowNum = gridMst.getRowsNum();
    gridMst.addRow(data);
    gridMst.selectRow(totalRowNum);
    fn_cellChange(1);
}
//cell 타입 변경
function fn_cellChange(flag){
	if(flag==1){
		gridMst.setColumnExcellType(0,"ed");
		gridMst.setColumnExcellType(1,"ed");
	  }else{
		gridMst.setColumnExcellType(0,"ro");
		gridMst.setColumnExcellType(1,"ro");
	  }
 }
//저장 버튼 동작
function fn_save() {
    var jsonStr = gridMst.getJsonUpdated2();
    var jsonStrSubString = jsonStr.substring(0, 2);
    $("#jsonData").val(jsonStr);

    var jsonStr2 = gridDtl.getJsonUpdated2();
    var jsonStrSubString2 = jsonStr2.substring(0, 2);
    $("#jsonData2").val(jsonStr2);

    if (jsonStrSubString == "[]" && jsonStrSubString2 == "[]") {
        dhtmlx.alert("변경된 코드가 없습니다.");
    } else {
        if (jsonStrSubString == "[]") {
            if (jsonStrSubString2 == "[]") {
                dhtmlx.alert("변경된 코드가 없습니다.");
            } else {
                fn_dtlSave();
            }
        } else {
            fn_mstSave();
        }
    }
}
function fn_mstSave(){
	gfn_callAjaxForGrid(gridMst,$("#hiddenform").serialize(),"gridMstSave",subLayout.cells("a"),fn_gridMstSaveCallBack);
}
function fn_gridMstSaveCallBack(){
    MsgManager.alertMsg("INF001");
    fn_loadGridMst(0);
    fn_gridMstEdit("off");
}
function fn_dtlSave(){
	var rowIdx = gridMst.getSelectedRowIndex();
	var codeMain = gridMst.setCells2(gridMst.getSelectedRowIndex(gridMst.getSelectedRowId()),0).getValue();
    $("#gridMstCode").val(codeMain);
    $.ajax({
        url : "/erp/comm/stan/baseCodeS/gridDtlSave",
        type : "POST",
        data : $("#hiddenform").serialize(),
        async : true,
        success : function(data) {
            MsgManager.alertMsg("INF001");
        	$("#gridMstCode").val('');
        	gridMst.selectRow(rowIdx);
        }
 });
}
//삭제 버튼 동작
function fn_remove(){
    var rodId = gridMst.getSelectedRowId();
    gridMst.cs_deleteRow(rodId);
}
//한줄삽입 버튼 동작
function fn_add(){
	var gridMstSelRow = gridMst.getSelectedRowId();
	var totalColNum = gridDtl.getColumnCount();
  	var data = new Array(totalColNum);
  	var totalRowNum = gridDtl.getRowsNum();

	if(gridMstSelRow==null||gridMstSelRow==""||typeof gridMstSelRow =="undefined"){
		dhtmlx.alert("대분류 코드를 선택하세요");
	}else{
		gridDtl.addRow(data);
		gridDtl.selectRow(totalRowNum);
	}

}
//한줄삭제 버튼 동작
function fn_delete(){
	var rodId = gridDtl.getSelectedRowId();
    gridDtl.cs_deleteRow(rodId);
}
//좌측 그리드 로드
function fn_loadGridMst(flag){
	var inputParams={}
	inputParams.codeName = $("#baseName").val();
	inputParams.code = $("#baseCode").val();
	if(inputParams.codeName==null ||inputParams.codeName==""){
		inputParams.codeName = "%";
	}
	if(inputParams.code==null ||inputParams.code==""){
		inputParams.code = "%";
	}
	if(flag == 1){
		gfn_callAjaxForGrid(gridMst,inputParams,"gridMstSel",subLayout.cells("a"),fn_First_loadGridMst);
	}else if(flag == 0){
		gfn_callAjaxForGrid(gridMst,inputParams,"gridMstSel",subLayout.cells("a"));
	}

	gridDtl.clearAll();
}
//우측 그리드 로드
function fn_loadGridDtl(code){
	var param = "code=" + code;
    gfn_callAjaxForGrid(gridDtl,param,"gridDtlSel",subLayout.cells("b"));
}
//좌측 그리드 콜백함수
function fn_First_loadGridMst(data){
	fn_loadGridDtl(data[0].code);
}

</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="jsonData2" name="jsonData2" />
    <input type="hidden" id="gridMstCode" name="gridMstCode" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			  <div class="col-sm-6 col-md-6">
			   <label class="col-sm-4 col-md-4 control-label" for="textinput">
					코드
			   </label>
				<div class="col-sm-2 col-md-2">
				 <input type="text" name="baseCode" id="baseCode" value="" placeholder="" class="form-control input-xs">
				</div>
				<div class="col-sm-3 col-md-3">
				<div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
				 <input type="text" name="baseName" id="baseName" value="" placeholder="" class="form-control input-xs">
				</div>
				</div>
			  </div>
		  </div>
	    </div>
      </div>
  </form>
 </div>
</div>