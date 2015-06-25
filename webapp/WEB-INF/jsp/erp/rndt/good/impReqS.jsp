<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain,calMain,combo01,combo02;
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"1C");
	//제품개선접수등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"),false);
	gridMain.addHeader({name:"No",colId:"rNum",width:"50",align:"center",type:"cntr"});
	gridMain.addHeader({name:"고객코드",colId:"custCode",width:"100",align:"center",type:"ro"});
	gridMain.addHeader({name:"고객",colId:"custKorName",width:"150",align:"left",type:"combo"});
	gridMain.addHeader({name:"품목코드",colId:"itemCode",width:"120",align:"center",type:"ro"});
	gridMain.addHeader({name:"품명",colId:"itemName",width:"150",align:"left",type:"combo"});
	gridMain.addHeader({name:"개선요청내용",colId:"reqConts",width:"300",align:"left",type:"ed"});
	gridMain.addHeader({name:"완료요청일자",colId:"endReqDate",width:"100",align:"center",type:"dhxCalendarA"});
	gridMain.dxObj.setUserData("","@endReqDate","format_date");
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","rNum");
	gridMain.init();
    gridMain.cs_setColumnHidden(["setDate","setSeq","reqDno","reqEmp","reqEmpName","state"]);
    gridMain.attachEvent("onRowDblClicked",doOnRowDbClicked);
	calMain = new dhtmlXCalendarObject([{input:"setDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	fn_setDate();
	
    $("#reqEmpName").dblclick(function(e){
    	if(e.target.id == "reqEmpName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		}
    })
    fn_setCombo();
});
function fn_save(){
	fn_saveGridMain();
}
function fn_search(){
	/*조회*/
	
}
function fn_new(){
	/*신규*/
	fn_setNew();
}
function fn_add(){
	/*항목삽입*/
  	var totalRowNum = gridMain.getRowsNum();
    var totalColNum = gridMain.getColumnCount();
    var data = new Array(totalColNum);
    gridMain.addRow(data);
    gridMain.selectRow(totalRowNum);
}
function fn_delete(){
	/*항목삭제*/
	var rowId = gridMain.getSelectedRowId();
	gridMain.cs_deleteRow(rowId);
}
function fn_remove(){
	var jsonStr = gridMain.getJsonUpdated2();
	if (jsonStr == "[]" || jsonStr.length <= 2){
		dhtmlx.alert("삭제할 행이 없습니다.");
		return
	}else{
		gridMain.dxObj.forEachRow(function(id) {
			gridSetVal(gridMain,"cudKey",'DELETE');
		});
		fn_saveGridMain();
		fn_setNew();
	}
}
function doOnRowDbClicked(rowId, colIdx){
	/*dbl click*/
    if (colIdx == 1) {
        gfn_load_pop('w1', 'common/customPOP', true);
   }
	if (colIdx == 3) {
        gfn_load_pop('w1', 'common/itemPOP', true);
   }
}
function fn_setDate(){
	var t = dateformat(new Date());
	byId("setDate").value = t;
};
function fn_onClosePop(pName, data) {
    if (pName == "empNo") {
         $('#reqEmpName').val(data[0].korName);
         $('#reqEmp').val(data[0].empNo);
    }
    if (pName == "custCode") {
		 gridSetVal(gridMain,"custCode",data[0].custCode);
		 gridSetVal(gridMain,"custKorName",data[0].custKorName);
    }
    if (pName == "itemCode") {
		 gridSetVal(gridMain,"itemCode",data[0].itemCode);
		 gridSetVal(gridMain,"itemName",data[0].itemName);
    }
}
</script>
<script type="text/javascript" src="/script/erp/rndt/impReqS/impReqSCombo.js"></script>
<script type="text/javascript" src="/script/erp/rndt/impReqS/impReqSFrmFn.js"></script>
<script type="text/javascript" src="/script/erp/rndt/impReqS/impReqSGridFn.js"></script>

<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<form class="form-horizontal"  id="frmJson">
<input type="hidden" id="jsonData" name="jsonData">
</form>
<div id="bootContainer" style="position: relative;">
    <div class="container">
        <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            	요청일자
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="setDate" id="setDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker" class="calicon form-control">
                            </div>
                        </div>
                        <div class="col-sm-1 col-md-1">
                            <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                                <input name="setSeq" id="setSeq" type="text" value="" placeholder="" class="form-control input-xs" readonly="readonly">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            	요청자
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="reqEmpName" id="reqEmpName" type="text" value="${empName}" placeholder="" class="form-control input-xs">
                            <input name="reqEmp" id="reqEmp" type="hidden" value="${empNo}" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>