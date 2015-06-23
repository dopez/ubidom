<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
var popFlag;
var mainMenu = parent.mainMenu;
var mainTabbar = parent.mainTabbar;
var tabId = null;
var uri = null;
    $(document).ready(function() {

        Ubi.setContainer(3, [1, 8, 9], "1C"); //개발중간평가조회

        layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout();

        //form//
        layout.cells("b").attachObject("bootContainer2");

        //grid	
        gridMain = new dxGrid(subLayout.cells("a"),false);
		gridMain.addHeader({name:"보고일자",colId:"setDate",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"보고자",colId:"empName",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"제안자",colId:"ppsName",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"제안부서",colId:"postName",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"과제명",colId:"problemName",width:"200",align:"left",type:"ro"});
		gridMain.addHeader({name:"계획",colId:"sumDhAmt",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"#cspan",colId:"stDate",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"#cspan",colId:"endDate",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"#cspan",colId:"dd",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"변경",colId:"sumCDhAmt",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"#cspan",colId:"cStDate",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"#cspan",colId:"cEndDate",width:"100",align:"center",type:"ro"});
		gridMain.addHeader({name:"#cspan",colId:"cDd",width:"100",align:"center",type:"ro"});
		gridMain.dxObj.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,계발예산(천원),개발기간,#cspan,#cspan,개발예산(천원),개발기간,#cspan,#cspan", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
		gridMain.dxObj.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,시작,종료,일수,#rspan,시작,종료,일수", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
		//gridMain.dxObj.attachFooter("개발예산 Total,#cspan,#cspan,#cspan,#cspan,#stat_total,,#cspan,#cspan,#cspan,#cspan,#cspan,#stat_total", ["text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", ]);
		gridMain.dxObj.setUserData("","@setDate","format_date");
		gridMain.dxObj.setUserData("","@stDate","format_date");
		gridMain.dxObj.setUserData("","@endDate","format_date");
		gridMain.dxObj.setUserData("","@cEndDate","format_date");
		gridMain.dxObj.setUserData("","@cStDate","format_date");
		gridMain.setColSort("str");	
		gridMain.setUserData("","pk","setDate");
    	gridMain.init();
        gridMain.cs_setColumnHidden(["evaluateNumb","midEvalKind","planNumb","empNo","setSeq","opKind"]);
        gridMain.attachEvent("onRowDblClicked",doOnRowDbClicked);
        gridMain.enableSmartRendering(false);
        
	    //calRangeDate
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
	    $("#empName, #ppsName").dblclick(function(e){
			if(e.target.id == "empName"){
				popFlag = 1;
				gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
			  }
			if(e.target.id == "ppsName"){
				popFlag = 2;
				gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
			  }
		})
		fn_search()

})
function gridGetVal(rId,gridNm,colId){
    	var colIdx = gridNm.getColIndexById(colId);
    	var colVal = gridNm.setCells(rId,colIdx).getValue();
    	return colVal;
}
function doOnRowDbClicked(rId,cInd){
	var cFlag = true;
	var dateValue = searchDate(gridGetVal(rId,gridMain,"setDate"));
	var seqValue = gridGetVal(rId,gridMain,"setSeq");
	var problemNameValue = gridGetVal(rId,gridMain,"problemName");
	var planNumbValue = gridGetVal(rId,gridMain,"planNumb");
	var empNameValue = gridGetVal(rId,gridMain,"empName");
	var empNoValue = gridGetVal(rId,gridMain,"empNo");
	var midEvalKindValue = gridGetVal(rId,gridMain,"midEvalKind");
	var evaluateNumbValue = gridGetVal(rId,gridMain,"evaluateNumb");
	var opKindValue = gridGetVal(rId,gridMain,"opKind");
	var openP = "u";
	var obj = {planNumb:planNumbValue,problemName:problemNameValue,empName:empNameValue,empNo:empNoValue,setDate:dateValue,setSeq:seqValue,openParam:openP};
	obj.midEvalKind = midEvalKindValue;
	obj.evaluateNumb = evaluateNumbValue;
	obj.opKind = opKindValue;
	var ids = mainTabbar.getAllTabs();
	var preId = "1000000683";
	for(var i=0;i<ids.length;i++){
		if(ids[i] == preId){
			if(MsgManager.confirmMsg("INF006")) { 
				mainTabbar.tabs(preId).close();
				cFlag = true;
				break;
			}else{
				cFlag = false;
				return;
			}
		}
	}
	if(cFlag){
		var uri = mainMenu.getUserData(preId, "uri");
		var menuItemText = mainMenu.getDxObj().getItemText(preId);
		mainTabbar.addTab(preId, menuItemText, null, null, true, true);
		mainTabbar.tabs(preId).attachURL("/"+uri+".do",null,obj);	
	}
};
function fn_search(){
	fn_selGridMain();
}
function fn_selGridMain(){
	var obj={};
	obj.stDate = searchDate($("#stDate").val());
	obj.edDate = searchDate($("#edDate").val());
	obj.empNo = $("#empNo").val();
	obj.ppsEmp = $("#ppsEmp").val();
	console.log(obj);
	 gfn_callAjaxForGrid(gridMain,obj,"selGridMain",subLayout.cells("a"),fn_selGridMainCB);
}
function fn_selGridMainCB(data){
	console.log("devmidR data=",data);
}
function fn_print(){
   	gridMain.cs_printView("개발중간평가");
}
function fn_onClosePop(pName,data){
	if (pName=="empNo"&& popFlag == 1) {
		var i;
		var obj={};
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            $('#empName').val(obj.korName);
            $('#empNo').val(obj.empNo);
        }
    }
	if (pName=="empNo"&& popFlag == 2) {
		var i;
		var obj={};
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            $('#ppsName').val(obj.korName);
            $('#ppsEmp').val(obj.empNo);
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
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    기간 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                           <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                        </div>
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    보고자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="empName" id="empName" type="text" value="${empName}" placeholder="" class="form-control input-xs">
                    <input name="empNo" id="empNo" type="hidden" value="${empNo}" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제안자 </label>
                                <div class="col-sm-2 col-md-2">
                                                                <input name="ppsName" id="ppsName" type="text" value="" placeholder="" class="form-control input-xs">
                            <input name="ppsEmp" id="ppsEmp" type="hidden" value="" placeholder="" class="form-control input-xs">

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>