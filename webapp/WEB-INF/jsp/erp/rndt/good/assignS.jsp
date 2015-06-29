<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var gridDtl, layout, toolbar, subLayout;
var gridMst,girdDtl;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(2,[1,2,3,4],"2E"); //접수,배정 등록
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("제품개선요청내역");
	gridMst = new dxGrid(subLayout.cells("a"),false);
	gridMst.addHeader({name:"No",colId:"rNum",width:"50",align:"center",type:"cntr"});
	gridMst.addHeader({name:"관리번호",colId:"reqDno",width:"100",align:"center",type:"ro"});
	gridMst.addHeader({name:"완료요청일자",colId:"endReqDate",width:"100",align:"center",type:"ro"});
	gridMst.addHeader({name:"고객",colId:"custKorName",width:"100",align:"left",type:"ro"});
	gridMst.addHeader({name:"요청자",colId:"reqEmpName",width:"100",align:"left",type:"ro"});
	gridMst.addHeader({name:"품목코드",colId:"itemCode",width:"120",align:"center",type:"ro"});
	gridMst.addHeader({name:"품명",colId:"itemName",width:"150",align:"left",type:"ro"});
	gridMst.addHeader({name:"개선요청내용",colId:"reqConts",width:"300",align:"left",type:"ro"});
	gridMst.dxObj.setUserData("","@endReqDate","format_date");
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","rNum");
  	gridMst.dxObj.enableMultiselect(true);
	gridMst.init();
    gridMst.cs_setColumnHidden(["setNo","setDate","setSeq","custCode",+
                                "reqEmp","state","assignsDate","assignsEmp",+
                                "equiCode","inchEmp","deliDate","resultDate",+
                                "resultEmp","reqBefore","reqAfter","remarks",+
                                "stateName","inchEmpName","equiName","assignsEmpName","resultEmpName"]);
	
	//down
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText('배정내역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
	'<input type="button" value="선택항목 추가" onclick="fn_btnAdd()" class="imgTest" style="background-color: buttonhighlight;">&nbsp;&nbsp;&nbsp;&nbsp;'+
	'<input type="button" value="선택항목 제거" onclick="" class="imgRowRemove" style="background-color: buttonhighlight;">');
	gridDtl = new dxGrid(subLayout.cells("b"),false);
	gridDtl.addHeader({name:"No",colId:"rNum",width:"50",align:"center",type:"cntr"});
	gridDtl.addHeader({name:"관리번호",colId:"reqDno",width:"100",align:"center",type:"ro"});
	gridDtl.addHeader({name:"고객",colId:"custKorName",width:"100",align:"left",type:"ro"});
	gridDtl.addHeader({name:"요청자",colId:"reqEmpName",width:"100",align:"left",type:"ro"});
	gridDtl.addHeader({name:"품목코드",colId:"itemCode",width:"120",align:"center",type:"ro"});
	gridDtl.addHeader({name:"품명",colId:"itemName",width:"150",align:"left",type:"ro"});
	gridDtl.addHeader({name:"개선요청내용",colId:"reqConts",width:"300",align:"left",type:"ro"});
	gridDtl.addHeader({name:"사용설비",colId:"equiName",width:"150",align:"left",type:"ro"});
	gridDtl.addHeader({name:"상태",colId:"stateName",width:"100",align:"center",type:"ro"});
	gridDtl.addHeader({name:"담당자",colId:"inchEmpName",width:"100",align:"center",type:"ro"});
	gridDtl.addHeader({name:"납기일자",colId:"deliDate",width:"100",align:"center",type:"ro"});
	gridDtl.addHeader({name:"완료요청일자",colId:"endReqDate",width:"100",align:"center",type:"ro"});
	gridDtl.dxObj.setUserData("","@endReqDate","format_date");
	gridDtl.dxObj.setUserData("","@deliDate","format_date");
	gridDtl.setColSort("str");	
	gridDtl.setUserData("","pk","rNum");
  	gridDtl.dxObj.enableMultiselect(true);
	gridDtl.init();
    gridDtl.cs_setColumnHidden(["setNo","setDate","setSeq","custCode","reqEmp",+
                                "state","assignsDate","assignsEmp","equiCode","inchEmp",+
                                "resultDate","resultEmp","reqBefore","reqAfter","remarks",+
                                "assignsEmpName","resultEmpName"]);
	
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{
         input: "assignsDate",
         button: "calpicker1"
     }]);
     calMain.loadUserLanguage("ko");
     calMain.hideTime();
     var t = dateformat(new Date());
     byId("assignsDate").value = t;
		
     $("#assignsEmpName").dblclick(function(e){
     	if(e.target.id == "assignsEmpName"){
 			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
 		}
     })
     fn_selGridMst();
})
function fn_search(){
	fn_selGridMst();
}
function fn_selGridMst(){
    gfn_callAjaxForGrid(gridMst,"","selGridMst",subLayout.cells("a"));
}
function fn_onClosePop(pName, data) {
    if (pName == "empNo") {
         $('#assignsEmpName').val(data[0].korName);
         $('#assignsEmp').val(data[0].empNo);
    }
}
//추가 버튼 이벤트
function fn_btnAdd(){
	/*var selRowId = {};
    	selRowId = gridMst.getSelectedRowId();
   	var selRowIdArr = selRowId.split(",");

   	var setDate = {};
   	var setSeq = {};
   	var reqDno = {};
   	var custCode = {};
   	var reqEmp = {};
   	var itemCode = {};
   	var reqConts = {};
   	var state = {};
   	var endReqDate = {};
   	var assignsDate = {};
   	var assignsEmp = {};
   	var equiCode = {};
   	var inchEmp = {};
   	var deliDate = {};
   	var resultDate = {};
   	var resultEmp = {};
   	var reqBefore = {};
   	var reqAfter = {};
   	var remarks = {};*/

   	var totalColNum = gridDtl.getColumnCount();
   	for(i=0;i<=totalColNum;i++){
   		console.log(gridDtl.getColumnId(i));
   	}
  	var totalRowNum = gridDtl.getRowsNum();
  	//getColIdx(colId)
  	/*var data = new Array(totalColNum);
   	for(i=0;i<selRowIdArr.length;i++){
   		alert("hi");
   		//alert(gridGetVal(selRowIdArr[i],gridMst,"state"));
   		var colIdx = gridDtl.getColIndexById("setDate")
   		alert(colIdx);
   		alert("done");
   		data[getDtlColIdx("setDate")] = gridGetVal(selRowIdArr[i],gridMst,"setDate");
   		data[getDtlColIdx("setSeq")] = gridGetVal(selRowIdArr[i],gridMst,"setSeq");
   		data[getDtlColIdx("reqDno")] = gridGetVal(selRowIdArr[i],gridMst,"reqDno");
   		data[getDtlColIdx("custCode")] = gridGetVal(selRowIdArr[i],gridMst,"custCode");
   		data[getDtlColIdx("reqEmp")] = gridGetVal(selRowIdArr[i],gridMst,"reqEmp");
   		data[getDtlColIdx("itemCode")] = gridGetVal(selRowIdArr[i],gridMst,"itemCode");
   		data[getDtlColIdx("reqConts")] = gridGetVal(selRowIdArr[i],gridMst,"reqConts");
   		data[17] = gridGetVal(selRowIdArr[i],gridMst,"state");
   		data[getDtlColIdx("endReqDate")] = gridGetVal(selRowIdArr[i],gridMst,"endReqDate");
   		data[getDtlColIdx("assignsDate")] = gridGetVal(selRowIdArr[i],gridMst,"assignsDate");
   		data[getDtlColIdx("assignsEmp")] = gridGetVal(selRowIdArr[i],gridMst,"assignsEmp");
   		data[getDtlColIdx("equiCode")] = gridGetVal(selRowIdArr[i],gridMst,"equiCode");
   		data[getDtlColIdx("inchEmp")] = gridGetVal(selRowIdArr[i],gridMst,"inchEmp");
   		data[getDtlColIdx("deliDate")] = gridGetVal(selRowIdArr[i],gridMst,"deliDate");
   		data[getDtlColIdx("resultDate")] = gridGetVal(selRowIdArr[i],gridMst,"resultDate");
   		data[getDtlColIdx("resultEmp")] = gridGetVal(selRowIdArr[i],gridMst,"resultEmp");
   		data[getDtlColIdx("reqBefore")] = gridGetVal(selRowIdArr[i],gridMst,"reqBefore");
   		data[getDtlColIdx("reqAfter")] = gridGetVal(selRowIdArr[i],gridMst,"reqAfter");
   		data[getDtlColIdx("remarks")] = gridGetVal(selRowIdArr[i],gridMst,"remarks");
   		data[getDtlColIdx("stateName")] = gridGetVal(selRowIdArr[i],gridMst,"stateName");
   		data[getDtlColIdx("inchEmpName")] = gridGetVal(selRowIdArr[i],gridMst,"inchEmpName");
   		data[getDtlColIdx("equiName")] = gridGetVal(selRowIdArr[i],gridMst,"equiName");
   		data[getDtlColIdx("assignsEmpName")] = gridGetVal(selRowIdArr[i],gridMst,"assignsEmpName");
   		data[getDtlColIdx("resultEmpName")] = gridGetVal(selRowIdArr[i],gridMst,"resultEmpName");
	    gridMst.dxObj.deleteRow(selRowIdArr[i]);
  		
  		gridDtl.addRow(data);
   	}
   	gridDtl.selectRow(totalRowNum);*/
}
function getDtlColIdx(colId){
	/*grid colIdx 가져옴*/
	var colIdx = gridDtl.getColIndexById(colId);
	return colIdx;
}
</script>
<script type="text/javascript" src="/script/erp/rndt/impReqS/impReqSGridFn.js"></script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="bootContainer2">
    <div class="container">
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 배정일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="assignsDate" id="assignsDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 배정자 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="assignsEmpName" id="assignsEmpName" type="text" value="${empName}" placeholder="" class="form-control input-xs">
                            <input name="assignsEmp" id="assignsEmp" type="hidden" value="${empNo}" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>