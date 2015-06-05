<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
var PscrnParm = parent.scrnParm;
var comboVal;
$(document).ready(function() {

    Ubi.setContainer(2, [1, 8, 9], "1C"); //업무일지조회(담당)

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

    //form//
    layout.cells("b").attachObject("bootContainer2");

    //grid
    gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"No",colId:"rNum",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"일자",colId:"logDate",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"담당",colId:"korName",width:"5",align:"center",type:"ro"});
    gridMain.addHeader({name:"내용",colId:"logNote",width:"15",align:"left",type:"ro"});
    gridMain.addHeader({name:"첨부",colId:"fileName",width:"5",align:"left",type:"ro"});
    gridMain.dxObj.setUserData("","@logDate","format_date");
    gridMain.setUserData("","pk","");
    gridMain.setColSort("str");
    gridMain.init();
    gridMain.cs_setColumnHidden(["compId","empNo","logDate","logSeq","logNum","logName","custCode","logKind","custKorName","workKind"]);

    //setDate;
    calMain = new dhtmlXCalendarObject([{
        input: "stDate",
        button: "calpicker1"
    }, {
        input: "edDate",
        button: "calpicker2"
    }]);
    calMain.loadUserLanguage("ko");
    calMain.hideTime();
    var t = dateformat(new Date());
    byId("stDate").value = t;
    byId("edDate").value = t;
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
    fn_search();
})
//doc ready end
function fn_search() {
    var obj = {};
    var splitfrDate = $("#stDate").val().split("/");
    var splittoDate = $("#edDate").val().split("/");
    var frDate = splitfrDate[0]+splitfrDate[1]+splitfrDate[2];
    var toDate = splittoDate[0]+splittoDate[1]+splittoDate[2];
    obj.logKind = PscrnParm;
    obj.frDate = String(frDate);
    obj.toDate = String(toDate);
    obj.empNo = $("#empNo").val();
    obj.workKind = comboVal;
    obj.custCode = $("#custCode").val();
    if(obj.empNo==null||obj.empNo.length<=0){
    	obj.empNo = '%';
    }
    if(obj.workKind==null||obj.workKind.length<=0){
    	obj.workKind = '%';
    }
    if(obj.custCode==null||obj.custCode.length<=0){
    	obj.custCode = '%';
    }

    gfn_callAjaxForGrid(gridMain, obj, "/erp/sale/wlog/workLogAllR/gridMainSelProd1", subLayout.cells("a"), fn_gridMainSelCallbckFunc)
}
//excel
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
//print
function  fn_print(){
	gridMain.printView();
 }
function fn_gridMainSelCallbckFunc(data) {
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
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 기간 </label>
                        <div class="col-sm-6 col-md-6">
                            <div class="col-sm-4 col-md-4">
                                <div class="input-group date" id="date1">
                                    <div class="col-sm-10 col-md-10">
                                        <input type="text" class="form-control input-xs format_date" name="stDate" id="stDate" value="">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                    </div>
                                </div>
                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                            <div class="col-sm-4 col-md-4">
                                <div class="input-group date" id="date2">
                                    <div class="col-sm-10 col-md-10">
                                        <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker2" class="calicon form-control format_date" onclick="setSens(1,'stDate', 'min')">
                                    </div>
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
                            <input name="empNo" id="empNo" type="text" value="${empNo}" placeholder="" class="form-control input-xs" disabled="disabled">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
