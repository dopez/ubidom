<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout;
var gridMst, gridDtl;
var calStDate;
var equiCode;
var kindParam;
$(document).ready(function(){

     Ubi.setContainer(0, [1, 3, 4, 5, 6], "3L"); //진공증착기준등록

     layout = Ubi.getLayout();
     toolbar = Ubi.getToolbar();
     subLayout = Ubi.getSubLayout();

    //left grid//
    subLayout.cells("a").setWidth(253);
	gridMst = new dxGrid(subLayout.cells("a"),false);
	gridMst.addHeader({name:"설비코드",colId:"equiCode",width:"50",align:"center",type:"ro"});
	gridMst.addHeader({name:"설비명",colId:"equiName",width:"49",align:"center",type:"ro"});
	gridMst.setUserData("","pk","");
	gridMst.setColSort("str");
	gridMst.init();

    //right form & grid//
    subLayout.cells("b").attachObject("bootContainer");
    subLayout.cells("b").setHeight(114);

    subLayout.cells("c").setText("증착조건");
    gridDtl = new dxGrid(subLayout.cells("c"),false);
    gridDtl.addHeader({name:"No",colId:"rNum",width:"5",align:"center",type:"cntr"});
    gridDtl.addHeader({name:"모재",colId:"matrCodeMjName",width:"5",align:"center",type:"ro"});
    gridDtl.addHeader({name:"약품명",colId:"matrName",width:"5",align:"center",type:"ro"});
    gridDtl.addHeader({name:"온도",colId:"temperature",width:"5",align:"center",type:"ed"});
    gridDtl.addHeader({name:"진공도",colId:"vacuumRate",width:"5",align:"center",type:"ed"});
    gridDtl.addHeader({name:"에칭",colId:"etching1",width:"5",align:"center",type:"ed"});
    gridDtl.addHeader({name:"어시스트",colId:"assist",width:"5",align:"center",type:"ed"});
    gridDtl.addHeader({name:"두께",colId:"thickness",width:"5",align:"center",type:"ed"});
    gridDtl.addHeader({name:"Rate",colId:"rate",width:"5",align:"center",type:"ed"});
    gridDtl.addHeader({name:"에칭",colId:"ecthing2",width:"5",align:"center",type:"ed"});
    gridDtl.addHeader({name:"방식",colId:"method",width:"5",align:"center",type:"ed"});
    gridDtl.setUserData("","pk","No");
    gridDtl.setColSort("str");
    gridDtl.init();
    gridDtl.cs_setColumnHidden(["matrCodeMj","matrCode","applyDate","equiCode"]);
    //set date//
    calStDate = new dhtmlXCalendarObject([{input:"stDate",button: "calpicker1"}]);
    calStDate.loadUserLanguage("ko");
    calStDate.hideTime();
    var t = dateformat(new Date());
    byId("stDate").value = t;
    gridMst.attachEvent("onRowSelect",fn_doOnMstRowSelect);
    gridDtl.attachEvent("onRowSelect",fn_doOnDtlRowSelect);
	
    //gridMstSel
    fn_getEquiCode();
    alert("hi");
})
//doc ready end

function fn_save(){
	var jsonStr = gridDtl.getJsonUpdated2();
	console.log(jsonStr);
    $("#jsonData").val(jsonStr);
    if (jsonStr == "[]" || jsonStr.length <= 0){
    	dhtmlx.alert("변경된 사항이 없습니다.");
    	return;
    }
    var frmParam = $("#frmMain").serialize();
    $.ajax({
        url: "/erp/rndt/stan/vaccCoatS/prcsGridDtl",
        type: "POST",
        data: frmParam,
        async: true,
        success: function() {
        	dhtmlx.alert("저장완료");
        }
    });
}
/* 한줄 삭제 */
function fn_delete(){
    var selectedId = gridDtl.getSelectedRowId();
    var cudKeyIdx = gridDtl.getColIndexById('cudKey');
    var cudKeyVal = gridDtl.setCells2(selectedId, cudKeyIdx).getValue();
	console.log(cudKeyVal);
	console.log("딜리트로우 타기 전 커드키 밸류 = "+cudKeyVal);
    gridDtl.cs_deleteRow(selectedId);
	console.log("딜리트로우 타고 난 후 커드키 밸류 = "+cudKeyVal);
}
/*gridDtl 한줄 삽입*/
function fn_add() {
	if(equiCode==""||typeof equiCode=="undefined"){
		dhtmlx.alert("설비코드를 선택해주세요");
	}else{
  	var totalRowNum = gridDtl.getRowsNum();
    var totalColNum = gridDtl.getColumnCount();
    var data = new Array(totalColNum);
    var equiCodeColIdx = gridDtl.getColIndexById('equiCode');
    var applyDateColIdx = gridDtl.getColIndexById('applyDate');
    data[equiCodeColIdx] = equiCode
    var splitfrDate = $("#stDate").val().split("/");
    var frDate = splitfrDate[0]+splitfrDate[1]+splitfrDate[2];
    data[applyDateColIdx] = frDate;
    gridDtl.addRow(data);
    gridDtl.selectRow(totalRowNum);
	}
}
/*gridDtl 로우 셀렉트 이벤트 핸들러 (모재코드, 약품코드 조회 팝업)*/
function fn_doOnDtlRowSelect(rId, cellId){
	if(cellId == 1){
		kindParam = "M"
		gfn_load_pop('w1', 'rndt/vaccCoatSPop', true, {
            "matrKind1": "M"
        });
	}else if(cellId == 2){
		kindParam = "P"
		gfn_load_pop('w1', 'rndt/vaccCoatSPop', true, {
            "matrKind2": "P"
        });
	}
}
/*gridMst 로우 셀렉트 이벤트 핸들러 */
function fn_doOnMstRowSelect(rId, cellId){
    var selRowIdx = gridMst.getSelectedRowIndex();
    var equiCodeIdx = gridMst.getColIndexById('equiCode');
    var equiCodeVal = gridMst.setCells2(selRowIdx, equiCodeIdx).getValue();
    var equiNameIdx = gridMst.getColIndexById('equiName');
    var equiNameVal = gridMst.setCells2(selRowIdx, equiNameIdx).getValue();
    $("#equiNm").val(equiNameVal);
    $("#equiCd").val(equiCodeVal);
	equiCode = equiCodeVal;
	fn_getGridDtl(equiCode);
    $('#stDate').mask('####/##/##');
}
/*gridDtl 조회 및 콜백 함수*/
function fn_getGridDtl(equiCode){
	var param = {};
	param.equiCode = equiCode;
	gfn_callAjaxForGrid(gridDtl, param, "/erp/rndt/stan/vaccCoatS/gridDtlSel", subLayout.cells("c"), fn_gridDtlSelCallbckFunc);
}
function fn_gridDtlSelCallbckFunc(data){
	if(data != ''){
    byId("stDate").value = data[0].applyDate;
    $('#stDate').mask('0000/00/00');
	}
}
/*gridMst 조회 및 콜백 함수*/
function fn_getEquiCode(){
	var param = "";
	gfn_callAjaxForGrid(gridMst, param, "/erp/rndt/stan/vaccCoatS/gridMstSel", subLayout.cells("a"), fn_gridMstSelCallbckFunc);
}
function fn_gridMstSelCallbckFunc(data){
    var t = dateformat(new Date());
    byId("stDate").value = t;
}
/*조회버튼 동작*/
function fn_search(){
	fn_getEquiCode();
}
/* 팝업 닫힐 때 */
function fn_onClosePop(mkind, data) {
    var i;
    var obj = {};
    var selRowIdx = gridDtl.getSelectedRowIndex();
    var matrCodeMjIdx = gridDtl.getColIndexById('matrCodeMj');
    var matrCodeMjNameIdx = gridDtl.getColIndexById('matrCodeMjName');
    var matrCodeIdx = gridDtl.getColIndexById('matrCode');
    var matrNameIdx = gridDtl.getColIndexById('matrName');
    if (mkind == "P") {
        for (i = 0; i < data.length; i++) {
            obj.matrName = data[i].matrName;
            obj.matrCode = data[i].matrCode;
            gridDtl.setCells2(selRowIdx, matrCodeIdx).setValue(obj.matrCode);
            gridDtl.setCells2(selRowIdx, matrNameIdx).setValue(obj.matrName);
        }
    } else if (mkind == "M") {
        for (i = 0; i < data.length; i++) {
            obj.matrCodeMjName = data[i].matrName;
            obj.matrCodeMj = data[i].matrCode;
            gridDtl.setCells2(selRowIdx, matrCodeMjIdx).setValue(obj.matrCodeMj);
            gridDtl.setCells2(selRowIdx, matrCodeMjNameIdx).setValue(obj.matrCodeMjName);
        }
    }
};
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
        <input type="hidden" id="jsonData" name="jsonData">
   </form>
<div id="bootContainer">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
    <input type="hidden" id="matrKind1" name="matrKind1" value = "M">
    <input type="hidden" id="matrKind2" name="matrKind2" value = "P">
        <div class="container">
            <div class="col-sm-8 col-md-8">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 적용일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs format-date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 설비코드 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="equiCd" id="equiCd" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 설비명 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="equiNm" id="equiNm" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>