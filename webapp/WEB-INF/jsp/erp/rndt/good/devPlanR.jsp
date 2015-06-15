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

     Ubi.setContainer(3, [1, 8, 9], "1C"); //개발계획조회

     layout = Ubi.getLayout();
     toolbar = Ubi.getToolbar();
     subLayout = Ubi.getSubLayout();

     //form//
     layout.cells("b").attachObject("bootContainer2");

     //grid	
     gridMain = new dxGrid(subLayout.cells("a"),false);
     gridMain.addHeader({name:"일자",colId:"setDate",width:"100",align:"center",type:"ro"});
     gridMain.addHeader({name:"작성자",colId:"writerName",width:"100",align:"center",type:"ro"});
     gridMain.addHeader({name:"제안자",colId:"ppsName",width:"100",align:"center",type:"ro"});
     gridMain.addHeader({name:"제안부서",colId:"postName",width:"100",align:"center",type:"ro"});
     gridMain.addHeader({name:"과제명",colId:"problemName",width:"100",align:"center",type:"ro"});
     gridMain.addHeader({name:"개발예산(천원)",colId:"",width:"100",align:"center",type:"ro"});
     gridMain.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"ro"});
     gridMain.addHeader({name:"#cspan",colId:"",width:"100",align:"center",type:"ro"});

 	gridMain.atchHeader();
 	gridMain.addAtchHeader({atchHeaderName:"#rspan"});
 	gridMain.addAtchHeader({atchHeaderName:"#rspan"});
 	gridMain.addAtchHeader({atchHeaderName:"#rspan"});
 	gridMain.addAtchHeader({atchHeaderName:"#rspan"});
 	gridMain.addAtchHeader({atchHeaderName:"#rspan"});
 	gridMain.addAtchHeader({atchHeaderName:"시작"});
 	gridMain.addAtchHeader({atchHeaderName:"종료"});
 	gridMain.addAtchHeader({atchHeaderName:"일수"});
 	gridMain.dxObj.setUserData("","@setDate","format_date");
 	gridMain.setColSort("str");	
 	gridMain.setUserData("","pk","");
 	gridMain.atchHeaderInit();
    gridMain.init();
    gridMain.cs_setColumnHidden(["setDate","setSeq"]);
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
    $("#writerName, #ppsName, #postName").click(function(e){
		if(e.target.id == "writerName"){
			popFlag = 1;
			gfn_load_pop('w1','common/empPOP',true,{"writerName":$(this).val()});
		  }
		if(e.target.id == "ppsName"){
			popFlag = 2;
			gfn_load_pop('w1','common/empPOP',true,{"ppsName":$(this).val()});
		  }
	})
	fn_search()
})
function doOnRowDbClicked(rId,cInd){
	var cFlag = true;
	var setDateIdx = gridMain.getColIndexById('setDate');
	var setSeqIdx = gridMain.getColIndexById('setSeq');
	var dateValue = searchDate(gridMain.setCells(rId,setDateIdx).getValue());
	var seqValue = gridMain.setCells(rId,setSeqIdx).getValue();
	var openP = "u";
	var ids = mainTabbar.getAllTabs();
	var preId = "1000000680";
	for(var i=0;i<ids.length;i++){
		if(ids[i] == preId){
			if(MsgManager.confirmMsg("INF006")) { 
				mainTabbar.tabs(preId).close();
				cFlag = true;
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
		mainTabbar.tabs(preId).attachURL("/"+uri+".do",null,{setDate:dateValue,setSeq:seqValue,openParam:openP});	
/* 		mainTabbar.tabs(preId).attachURL("/"+uri+".do",null,{setDate:dateValue,setSeq:seqValue});	 */
	}
	
};
function fn_search(){
	fn_selGridMain();
}
function fn_selGridMain(){
	var obj={};
	obj.stDate = searchDate($("#stDate").val());
	obj.edDate = searchDate($("#edDate").val());
	obj.writerEmp = $("#writerEmp").val();
	obj.ppsEmp = $("#ppsEmp").val();
	console.log(obj);
	 gfn_callAjaxForGrid(gridMain,obj,"selGridMain",subLayout.cells("a"),fn_selGridMainCB);
}
function fn_selGridMainCB(data){
	console.log("devR data=",data);
}
function fn_onClosePop(pName,data){
	if (pName=="empNo"&& popFlag == 1) {
		var i;
		var obj={};
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            $('#writerName').val(obj.korName);
            $('#writerEmp').val(obj.empNo);
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
                                        <input type="text" class="form-control input-xs format_date" name="edDate" id="edDate" value="">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                       <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
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
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 작성자 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="writerName" id="writerName" type="text" value="${empName}" placeholder="" class="form-control input-xs">
                    <input name="writerEmp" id="writerEmp" type="hidden" value="${empNo}" placeholder="" class="form-control input-xs">
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