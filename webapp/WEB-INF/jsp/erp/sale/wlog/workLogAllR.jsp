<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
        var gridDtl,gridMain;
        var calMain;
        var PscrnParm = parent.scrnParm;
        var comboVal;

$(document).ready(function() {

    Ubi.setContainer(2, [1, 8, 9], "2E"); //업무일지조회(전체)

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

    //form//
    layout.cells("b").attachObject("bootContainer2");

        //grid
    subLayout.cells("a").setHeight(88);
    subLayout.cells("a").showHeader();
    subLayout.cells("a").setText("종류별 상세 내용을 보려면 해당 종류 란을 더블 클릭하세요");
    gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"방문",colId:"col1",width:"5",align:"right",type:"ron"});
    gridMain.addHeader({name:"유선",colId:"col2",width:"5",align:"right",type:"ron"});
    gridMain.addHeader({name:"불량분석",colId:"col3",width:"5",align:"right",type:"ron"});
    gridMain.addHeader({name:"견적/가격조정",colId:"col4",width:"6",align:"right",type:"ron"});
    gridMain.addHeader({name:"TEST진행",colId:"col5",width:"5",align:"right",type:"ron"});
    gridMain.addHeader({name:"기술지원",colId:"col6",width:"5",align:"right",type:"ron"});
    gridMain.addHeader({name:"자료작성",colId:"col7",width:"5",align:"right",type:"ron"});
    gridMain.addHeader({name:"컴프레인",colId:"col8",width:"5",align:"right",type:"ron"});
    gridMain.addHeader({name:"계",colId:"colSum",width:"5",align:"right",type:"ron"});
    gridMain.setUserData("","pk","");
    gridMain.setColSort("str");
    gridMain.init();
    gridDtl = new dxGrid(subLayout.cells("b"),false);
    gridDtl.addHeader({name:"No",colId:"rNum",width:"5",align:"center",type:"ro"});
    gridDtl.addHeader({name:"일자",colId:"logDate",width:"5",align:"center",type:"ro"});
    gridDtl.addHeader({name:"고객",colId:"custKorName",width:"5",align:"center",type:"ro"});
    gridDtl.addHeader({name:"종류",colId:"workKind",width:"6",align:"center",type:"ro"});
    gridDtl.addHeader({name:"내용",colId:"logNote",width:"15",align:"left",type:"ro"});
    gridDtl.addHeader({name:"첨부",colId:"fileName",width:"5",align:"left",type:"ro"});
    gridDtl.dxObj.setUserData("","@logDate","format_date");
    gridDtl.setUserData("","pk","");
    gridDtl.setColSort("str");
    gridDtl.init();
    gridDtl.cs_setColumnHidden(["compId","empNo","logDate","logSeq","logNum","logName","custCode","logKind","korName"]);
    
    //setDate;
    calMain = new dhtmlXCalendarObject([{
        input: "frDate",
        button: "calpicker1"
    }, {
        input: "toDate",
        button: "calpicker2"
    }]);
    calMain.loadUserLanguage("ko");
    calMain.hideTime();
    var t = dateformat(new Date());
    byId("frDate").value = t;
    byId("toDate").value = t;
    //popUp
    $("#empNo, #custKorName").click(function(e){
		if(e.target.id == "empNo"){
			popParam = e;
			gfn_load_pop('w1','common/empPOP',true,{"empNo":$(this).val()});
		  }else if(e.target.id == "custKorName"){
			var param = ""
	        gfn_load_pop('w1', 'common/customPOP', true, {"custKorName": param});
		  }
    })
    gridMain.attachEvent("onRowSelect",fn_gridDtlSel);
    fn_search();
})
//doc ready end
function fn_gridDtlSel(rowId,cellIdx){
    var kindParam = "";
	if(cellIdx == 0){
		kindParam = "01";
	}else if(cellIdx==1){
		kindParam = "02";
	}else if(cellIdx==2){
		kindParam = "03";
	}else if(cellIdx==3){
		kindParam = "04";
	}else if(cellIdx==4){
		kindParam = "05";
	}else if(cellIdx==5){
		kindParam = "06";
	}else if(cellIdx==6){
		kindParam = "07";
	}else if(cellIdx==7){
		kindParam = "08";
	}else if(cellIdx==8){
		kindParam = "%";
}
	fn_gridSel("gridDtl",kindParam);
}
function fn_search() {
	var test = "test";
	fn_gridSel("gridMain",test);
}
function fn_gridSel(gridName,kindParam){
	$("#HworkKind").val(kindParam);
	$("#HlogKind").val(PscrnParm);
	if($("#empNo").val() == ""){
		$("#empNo").val("%");
	}
	if($("#custCode").val() == ""){
		$("#custCode").val("%");
	}
    var param = gfn_getFormElemntsData("frmSearch");
	if(gridName == "gridMain"){
	    gfn_callAjaxForGrid(gridMain, param, "gridMainSel", subLayout.cells("a"), fn_gridMainSelCallbckFunc);
	}else if(gridName == "gridDtl"){
		gfn_callAjaxForGrid(gridDtl, param, "gridDtlSel", subLayout.cells("a"), fn_gridDtlSelCallbckFunc);
	}
}
//excel
function fn_excel(){
	gridDtl.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
//print
function  fn_print(){
	gridDtl.printView();
 }
function fn_gridMainSelCallbckFunc(data) {
	fn_gridSel("gridDtl","%");
	if($("#custCode").val() == "%"){
		$("#custCode").val("");
	}
	if($("#empNo").val() == "%"){
		$("#empNo").val("");
	}
	$("#frDate").keyup();
	$("#toDate").keyup();
}
function fn_gridDtlSelCallbckFunc(data) {
	if($("#custCode").val() == "%"){
		$("#custCode").val("");
	}
	if($("#empNo").val() == "%"){
		$("#empNo").val("");
	}
}
function fn_onClosePop(pName, data) {
    var i;
    var obj = {};
    if (pName == "custCode") {
        for (i = 0; i < data.length; i++) {
            obj.custKorName = data[i].custKorName;
            obj.custCode = data[i].custCode;
            $('#custCode').val(obj.custCode);
            $('#custKorName').val(obj.custKorName);
        }
    } else if (pName == "empNo") {
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            //$('#korName').val(obj.korName);
            $('#empNo').val(obj.empNo);
        }
    }
}
</script>

<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="bootContainer2">
    <div class="container">
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" name="frmSearch"id="frmSearch">
        <input type="hidden" value="" id="HlogKind" name="HlogKind">
        <input type="hidden" value="" id="HworkKind" name="HworkKind">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            기간 </label>
                        <div class="col-sm-6 col-md-6">
                            <div class="col-sm-4 col-md-4">
                                <div class="col-sm-10 col-md-10">
                                    <input type="text" class="form-control input-xs format_date" name="frDate" id="frDate" value="">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'toDate', 'max')">
                                </div>
                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                            <div class="col-sm-4 col-md-4">
                                <div class="col-sm-10 col-md-10">
                                    <input type="text" class="form-control input-xs format_date" name="toDate" id="toDate" value="">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'frDate', 'min')">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class=" col-md-1 col-md-1 control-label" for="textinput" style="margin-left:-18px;padding-right: -15px;"> 고객 </label>
                  <div class="col-sm-2 col-md-2">
                      <input name="custKorName" id="custKorName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('고객코드','common/customCodePOP')">
                  </div>
                  <div class="col-sm-2 col-md-2">
                      <input name="custCode" id="custCode" type="hidden" value="" placeholder="">
                  </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>