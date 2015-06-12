<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout,subToolbar;
var calMain,t;
var subTabbar,tab1,tab2,tab3,tab4,tab5,tab6,tab7,tab8;
var tab1Toolbar,tab2Toolbar,tab3Toolbar,tab4Toolbar,tab5Toolbar,tab6Toolbar,tab7Toolbar,tab8Toolbar
var tabId = "a1";
var combo01,combo02,combo03;
var devPlanRParam; //= ${param};
var dateVal;
var seqVal;
$(document).ready(function() {

		Ubi.setContainer(4, [1, 2, 3, 4], "1C"); //개발계획등록

        layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout();

        //form//
        layout.cells("b").attachObject("bootContainer2");
        layout.cells("b").setHeight(180);
		
    	toolbar.attachEvent("onClick", fn_frmMain);
        //setDate//
        calMain = new dhtmlXCalendarObject([{input: "setDate",button: "calpicker1"}]);
        calMain.loadUserLanguage("ko");
        calMain.hideTime();
        fn_setDate();
        //tabbar//	
        subTabbar = subLayout.cells("a").attachTabbar({
            tabs: [{id: "a1",text: "목적/배경",active: true}, 
                   {id: "a2",text: "기술/시장/경쟁사동향"}, 
                   {id: "a3",text: "개발일정"}, 
                   {id: "a4",text: "인원계획"}, 
                   {id: "a5",text: "개발목표(수준)"}, 
                   {id: "a6",text: "성과활용계획"}, 
                   {id: "a7",text: "투자계획"}, 
                   {id: "a8",text: "시장규모"}]
        });
        subTabbar.setArrowsMode("auto");
        subTabbar.attachEvent("onTabClick", function(id, lastId) {
            tabId = id;
        });
        /*tab set*/

        fn_setTab1();
        fn_setTab2();
        fn_setTab3();
        fn_setTab4();
        fn_setTab5();
        fn_setTab6();
        fn_setTab7();
        fn_setTab8();
        
        fn_setTabColor(tabId);
        /*popUp*/
         $("#writerName, #ppsName, #postName").click(function(e){
			if(e.target.id == "writerName"){
				popFlag = 1;
				gfn_load_pop('w1','common/empPOP',true,{"writerName":$(this).val()});
			  }
			if(e.target.id == "ppsName"){
				popFlag = 2;
				gfn_load_pop('w1','common/empPOP',true,{"ppsName":$(this).val()});
			  }
 			if(e.target.id == "postName"){
 				gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
			}
	    })
        /*set seq*/
        //fn_getSeqReturn();

        if(devPlanRParam=="UPDATE"){

        }else{
        	fn_new();
        }
})/*doc ready end*/
function fn_new(){
	byId("frmMain").reset();
	fn_setDate();
    $('#setDate').keyup();
	byId("frmTab1").reset();
	byId("frmTab2").reset();
	tab3.clearAll();
	tab4.clearAll();
	byId("frmTab5_1").reset();
	byId("frmTab5_2").reset();
	byId("frmTab6_1").reset();
	byId("frmTab6_2").reset();
	byId("frmTab6_3").reset();
	tab7.clearAll();
	tab8Grid.clearAll();
	fn_setRowsTab8();
    fn_setCud("i");
 	byId("cudKey1").value = 'INSERT';
 	byId("cudKey2").value = 'INSERT';
 	byId("cudKey5").value = 'INSERT';
 	byId("cudKey6").value = 'INSERT';
}

function fn_frmSearch(){
	var mainParam = {};
	mainParam.setDate = $("#setDate").val();
	mainParam.setSeq = $("#setSeq").val();
	if(mainParam.setSeq==""|| mainParam.setSeq==null ||typeof mainParam.setSeq == "undefined"){
			mainParam.setSeq = "%";
	}
	gfn_callAjaxForForm(frmMain, mainParam, "selFrmMain");
}
function fn_delete(){
	fn_tabDelete("a3",tab3);
	fn_tabDelete("a4",tab4);
	fn_tabDelete("a7",tab7);
}

function fn_tabDelete(id,grid){
	if(tabId==id){
	    var selectedId = grid.getSelectedRowId();
	    grid.cs_deleteRow(selectedId);
	}
}
function fn_search(){
	fn_frmSearch();
	if(tabId=="a1"){
		fn_searchTab1();
	}
	if(tabId=="a2"){
		fn_searchTab2();
	}
	if(tabId=="a3"){
		fn_searchTab3();
	}
	if(tabId=="a4"){
		fn_searchTab4();
	}
	if(tabId=="a5"){
		fn_searchTab5();
	}
	if(tabId=="a6"){
		fn_searchTab6();
	}
	if(tabId=="a7"){
		fn_searchTab7();
	}
	if(tabId=="a8"){
		fn_searchTab8();
	}
}
function fn_seqValid(){
	var vFlag = "";
	if($("#setSeq").val()==null||$("#setSeq").val()==""
			||typeof $("#setSeq").val()=="undefined"
			||seqVal.length<=0||seqVal==null
			||seqVal==""){
		dhtmlx.alert("위 Form부터 작성/저장 하세요");
		vFlag = false;
		return vFlag;
	}else{
		vFlag = true;
		return vFlag;
	}
}
function fn_frmMainSave(){
	$("input[name=setSeq]").attr("disabled",false);
	dateVal = searchDate($("#setDate").val());
	seqVal = $("#setSeq").val();
 	var params = gfn_getFormElemntsData('frmMain');
	$("input[name=setSeq]").attr("disabled",true);
    $.ajax({
        type: 'POST',
        url: "/erp/rndt/stan/DevPlanS/frmMainSave",
        data: params,
        success: function(data) {
            MsgManager.alertMsg("INF001");
            }
    });
}
function fn_frmMain(id) {
    if (id == "btn3") {
        if ($('#setSeq').val() == '') {
            fn_getSeqReturn();
        }
        fn_frmMainSave();
        $('#setDate').keyup();
        fn_setCud("u");
    }
}
function fn_remove(){
    fn_setCud("d");
    fn_frmMainSave();
    fn_new();
}
/*set date*/
function fn_setDate(){
    t = dateformat(new Date());
    byId("setDate").value = t;
}
/*for textarea tag*/
function fn_textAreaSetbg(color)
{
	document.getElementById("contents").style.background=color
	document.getElementById("remarks").style.background=color
}
function fn_setTabColor(tabId){
	if(tabId=="a1"||tabId=="a2"){
		$(".dhx_cell_cont_tabbar",".dhx_cell_tabbar").css("background-color","#f9f9f8");
	}
}
function fn_getSeqReturn(){
	 var obj = {};
	    obj.tableName = 'TBL_DEV_PLAN_MST';
	    obj.seqColumn = 'SET_SEQ';
	    obj.dateColumn1 = 'SET_DATE';
	    obj.columnData1 = searchDate($("#setDate").val());
	    obj.returnLen = 2;
	    gfn_callAjaxComm(obj,"/erp/comm/stan/tableSeq/selTableSeq1",fn_SetSeq); 
};
function fn_SetSeq(data) {
   $("#setSeq").val(data[0].seq);
};
function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		var i;
		var obj={};
		for(i=0;i<data.length;i++){
			var params =  "postName=" + data[i].postName;
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			$("#postName").val(obj.postName);
			$("#ppsDept").val(obj.postCode);
		}		  
	}
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
};

</script>
<script type="text/javascript" src="/js/erp/rndt/devPlanS/devPlanSTab1.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanS/devPlanSTab2.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanS/devPlanSTab3.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanS/devPlanSTab4.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanS/devPlanSTab5.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanS/devPlanSTab6.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanS/devPlanSTab7.js"></script>
<script type="text/javascript" src="/js/erp/rndt/devPlanS/devPlanSTab8.js"></script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<style>
form{
	padding-top: 10px; padding-bottom: 5px; margin: 0px;
}
</style>
<div id="tab1" class="container">
    <form class="form-horizontal"  id="frmTab1">
            <input type="hidden" id="cudKey1" name="cudKey1">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="contents" id="contents"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                        <input name="contentsKind" id="contentsKind" type="hidden" value="1" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab2" class="container">
    <form class="form-horizontal"  id="frmTab2">
    <input type="hidden" id="cudKey2" name="cudKey2">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="contents" id="contents"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                        <input name="contentsKind" id="contentsKind" type="hidden" value="2" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<form class="form-horizontal"  id="frmTab3">
<input type="hidden" id="jsonData3" name="jsonData3">
</form>
<form class="form-horizontal"  id="frmTab4">
<input type="hidden" id="jsonData4" name="jsonData4">
</form>
<div id="tab5_1" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab5_1">
        <input type="hidden" id="cudKey5" name="cudKey5">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제품 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="itemName" id="itemName" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 기술 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="techName" id="techName" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 목표재료 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="targetMatr" id="targetMatr" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab5_2" class="container">
    <form class="form-horizontal"  id="frmTab5_2">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="remarks" id="remarks"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab6_1" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab6_1">
        <input type="hidden" id="cudKey6" name="cudKey6">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 국내 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="patentLocal" id="patentLocal" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 해외 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="patentFore" id="patentFore" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab6_2" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab6_2">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 국내 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="paperLocal" id="paperLocal" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 해외 </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="paperFore" id="paperFore" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab6_3" class="container">
    <form class="form-horizontal"  id="frmTab6_3">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="remarks" id="remarks"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<form class="form-horizontal"  id="frmTab7">
<input type="hidden" id="jsonData7" name="jsonData7">
</form>
<form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab8">
 <input type="hidden" id="jsonData8" name="jsonData8">
</form>
<div id="bootContainer2">
    <div class="container">
        <form class="form-horizontal"  id="frmMain">
        <input type="hidden" id="cudKey" name="cudKey">
        <script type="text/javascript">
        function fn_setCud(flag){
        	if(flag=="i"){
        		byId("cudKey").value = 'INSERT';
        	}
        	if(flag=="u"){
        		byId("cudKey").value = 'UPDATE';
        	}
        	if(flag=="d"){
        		byId("cudKey").value = 'DELETE';
        	}
        }
        </script>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="setDate" id="setDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                        </div>
                        <div class="col-sm-1 col-md-1">
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                <input name="setSeq" id="setSeq" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                            </div>
                        </div>
                        <div class="col-sm-offset-4 col-md-offset-4 col-sm-3 col-md-3">
                            <input type="button" class="btn btn-default btn-xs form-control" id="btnReportPrint" name="btnReportPrint" value="개발계획보고서인쇄">
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
                            <input name="ppsName" id="ppsName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('제안자','common/empPOP')">
                            <input name="ppsEmp" id="ppsEmp" type="hidden" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('제안자','common/empPOP')">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제안부서 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
                            <input name="ppsDept" id="ppsDept" type="hidden" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 과제명 </label>
                        <div class="col-sm-10 col-md-10">
                            <input name="problemName" id="problemName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>