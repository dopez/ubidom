<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calStDate;
var popParam;
//화면 매개변수
var PscrnParm = parent.scrnParm;
$(document).ready(function() {

    Ubi.setContainer(2, [1, 3, 5, 6], "1C"); //업무일지등록

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

    //form//
    layout.cells("b").attachObject("bootContainer");

    //grid	
    gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"No",colId:"rNum",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"내용",colId:"logNote",width:"15",align:"left",type:"ed"});
    gridMain.addHeader({name:"첨부",colId:"fileName",width:"5",align:"left",type:"ed"});
    gridMain.setUserData("","pk","");
    gridMain.setColSort("str");
    gridMain.init();
    gridMain.cs_setColumnHidden(["empNo","logDate","logSeq","logNum","logName","custCode","logKind","custKorName","workKind"]);
	
    //setDate//
    calStDate = new dhtmlXCalendarObject([{
        input: "stDate",
        button: "calpicker1"
    }]);
    calStDate.loadUserLanguage("ko");
    calStDate.hideTime();
    var t = dateformat(new Date());
    byId("stDate").value = t;
	
    //seq
    fn_getSeqReturn();
    
    //popUp
    //gridMain.attachEvent("onRowSelect",doOnRowSelect);
     
	$("#korName").click(function(e){
		if(e.target.id == "korName"){
			popParam = e;
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		  }
    })
	fn_search();
	console.log(PscrnParm);
})
//doc ready end

function fn_getSeqReturn() {
    var obj = {};
    obj.tableName = 'TBL_WORK_LOG';
    obj.seqColumn = 'LOG_SEQ';
    obj.dateColumn1 = 'LOG_DATE';
    obj.columnData1 = $("#stDate").val();
    obj.dateColumn2 = 'LOG_KIND';
    obj.columnData2 = PscrnParm;
    obj.returnLen = 3;
    console.log(obj);
    gfn_callAjaxComm(obj, "/erp/sale/wlog/workLogS/seqReturn", fn_SetSeq);
}

function fn_SetSeq(data) {
    $("#seqNo").val(data[0].seq);
}

function fn_search() {
    var obj = {};
    obj.logKind = PscrnParm;
    obj.logDate = $("#stDate").val();
    obj.logSeq = $("#seqNo").val();
    gfn_callAjaxForGrid(gridMain, obj, "/erp/sale/wlog/workLogS/gridMainSel", subLayout.cells("a"), fn_gridMainSelCallbckFunc)
}

function fn_gridMainSelCallbckFunc(data) {
    console.log(data);
}

function fn_delete() {
    var selectedId = gridMain.getSelectedRowId();
    gridMain.cs_deleteRow(selectedId);
}

function fn_save() {
    var selRowIdx = gridMain.getSelectedRowIndex();
    var empNoColIdx = gridMain.getColIndexById('empNo');
    var empNoVal = $('#empNo').val();
    if (empNoVal == null || empNoVal.length <= 0) {
        dhtmlx.alert("사원이름을 입력해주세요.");
    } else {
        gridMain.setCells2(selRowIdx, empNoColIdx).setValue(empNoVal);
        var jsonStr = gridMain.getJsonUpdated2();
        $("#jsonData").val(jsonStr);
        var frmParam = $("#frmServer").serialize();

        console.log(frmParam);
        console.log(jsonStr);

        //gfn_callAjaxComm(frmParam,"gridMainSave", fn_gridMainSaveCallbckFunc);

        if (jsonStr == null || jsonStr.length <= 0) return;

        $.ajax({
            url: "/erp/sale/wlog/workLogS/gridMainSave",
            type: "POST",
            data: frmParam,
            async: true,
            success: function(data) {
                //MsgManager.alertMsg("INF001");
                fn_gridMainSaveCallbckFunc(data);
            }
        });
    }

}

function fn_gridMainSaveCallbckFunc(data) {
    dhtmlx.alert("저장 완료");
    //gridMain.selectRow(data[0].rNum);
    fn_search();

}

function fn_add() {
    var totalColNum = gridMain.getColumnCount();
    var data = new Array(totalColNum);
    var empNoColIdx = gridMain.getColIndexById('empNo');
    var logDateColIdx = gridMain.getColIndexById('logDate');
    var logSeqColIdx = gridMain.getColIndexById('logSeq');
    var logKindColIdx = gridMain.getColIndexById('logKind');
    data[empNoColIdx] = $("#empNo").val();
    data[logDateColIdx] = $("#stDate").val();
    data[logSeqColIdx] = $("#seqNo").val();
    data[logKindColIdx] = PscrnParm;
    gridMain.addRow(data);
}

function fn_onClosePop(pName, data) {
    var i;
    var obj = {};
    if (pName == "custCode") {
        for (i = 0; i < data.length; i++) {
            obj.custKorName = data[i].custKorName;
            obj.custCode = data[i].custCode;
            var selRowIdx = gridMain.getSelectedRowIndex();
            var custCodeIdx = gridMain.getColIndexById('custCode');
            var custKorNameIdx = gridMain.getColIndexById('custKorName');
            gridMain.setCells2(selRowIdx, custCodeIdx).setValue(obj.custCode);
            gridMain.setCells2(selRowIdx, custKorNameIdx).setValue(obj.custKorName);
        }
    } else if (pName == "empNo") {
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            $('#korName').val(obj.korName);
            $('#empNo').val(obj.empNo);
            //저장할 때 gridMain.setCells2(selRowIdx,empNoColIdx).setValue($("#empNo").val()); 맞춰주기
        }
    }
};
</script>

<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<form id="frmServer">
<input type="hidden" id="jsonData" name="jsonData">
</form>
<div id="bootContainer">
    <div class="container">
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                        </div>
<!--                         <div class="col-sm-1 col-md-1">
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
                        <div class="col-sm-1 col-md-1">
                            <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
<%--                             <input name="empNo" id="empNo" type="text" value="${empNo}" placeholder="" class="form-control input-xs" disabled="disabled"> --%>
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
<%--                                 <input name="korName" id="korName" type="text" value="${empName}" placeholder="" class="form-control input-xs"> --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>