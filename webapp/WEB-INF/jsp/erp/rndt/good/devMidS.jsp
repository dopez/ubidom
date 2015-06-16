<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout,subTabbar;
var tab1Toolbar,tab2Toolbar,tab3Toolbar,tab4Toolbar,tab5Toolbar,tab6Toolbar;
var combo01;
var tab1,tab2,tab3,tab4,tab5,tab6;
$(document).ready(function() {

        Ubi.setContainer(4, [1, 2, 3, 4], "1C"); //개발중간평가등록

        layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout();

        //form//
        layout.cells("b").attachObject("bootContainer2");
        layout.cells("b").setHeight(180);

        //tabbar//	
        subTabbar = subLayout.cells("a").attachTabbar({
            tabs: [{id: "a1",text: "상황변화",active: true}, 
                   {id: "a2",text: "주요문제점"}, 
                   {id: "a3",text: "해결방안"}, 
                   {id: "a4",text: "지원요청사항"}, 
                   {id: "a5",text: "개발일정변경"}, 
                   {id: "a6",text: "인원계획변경"}, 
                   {id: "a7",text: "개발목표(수준)변경"}, 
                   {id: "a8",text: "투자계획변경"} ]

        });
        subTabbar.setArrowsMode("auto");
        subTabbar.attachEvent("onTabClick", function(id, lastId) {
            tabId = id;
        });
        
        fn_setTab1();
        fn_setTab2();
        fn_setTab3();
        fn_setTab4();
        fn_setTab5();
        fn_setTab6();
        var tab7 = subTabbar.tabs("a7").attachLayout("2E");
        var tab8 = subTabbar.tabs("a8").attachGrid();

        //7번탭
        tab7.cells("a").setHeight(200);
        tab7.cells("a").setText("1.수준");
        tab7.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
        var tab7Grid1 = tab7.cells("a").attachGrid();
        tab7Grid1.setImagePath("/component/dhtmlxGrid/imgs/");
        tab7Grid1.setHeader("구분, 계획,변경", null, ["text-align:center;", "text-align:center;", "text-align:center;"]);
        tab7Grid1.setInitWidths("100,300,300");
        tab7Grid1.setColAlign("left,left,left");
        tab7Grid1.setColTypes("ro,ed,ed");
        tab7Grid1.setColSorting("str,str,str");
        tab7Grid1.init();
        var tab7Grid = tab7.cells("b").attachGrid();
        tab7Grid.setImagePath("/component/dhtmlxGrid/imgs/");
        tab7Grid.setHeader("No, 주요 Spec 및 차별화 Point", null, ["text-align:center;", "text-align:center;"]);
        tab7Grid.setInitWidths("50,800");
        tab7Grid.setColAlign("left,left");
        tab7Grid.setColTypes("ro,ed");
        tab7Grid.setColSorting("str,str");
        tab7Grid.init();

        //8번탭
        tab8.setImagePath("/component/dhtmlxGrid/imgs/");
        tab8.setHeader("구분,당해년도(천원),Total(천원),비고", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
        tab8.setInitWidths("100,100,100,506");
        tab8.setColAlign("center,right,right,center,left");
        tab8.setColTypes("coro,price,price,txt");
        tab8.setColSorting("str,str,str,str");
        tab8.attachFooter("계,0,0,", ["text-align:center;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;"]);
        tab8.init();
        //tab end

        //setDate//
        calMain = new dhtmlXCalendarObject([{
            input: "stDate",
            button: "calpicker1"
        }]);
        calMain.loadUserLanguage("ko");
        calMain.hideTime();
        fn_setDate();

})//doc ready end
</script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSFn.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSTab1.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSTab2.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSTab3.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSTab4.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSTab5.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSTab6.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSTab7.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devMidS/devMidSTab8.js"></script>
<style>
form{
	padding-top: 10px; padding-bottom: 5px; margin: 0px;
}
</style>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<form class="form-horizontal"id="frmTab5">
<input type="hidden" id="jsonData1" name="jsonData1">
</form>
<form class="form-horizontal"id="frmTab5">
<input type="hidden" id="jsonData5" name="jsonData5">
</form>
<div id="bootContainer2">
    <div class="container">
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
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
                        <div class="col-sm-1 col-md-1">
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                            </div>
                        </div>
                        <div class="col-sm-offset-4 col-md-offset-4 col-sm-3 col-md-3">
                            <input type="button" class="btn btn-default btn-xs form-control" id="btnReportPrint" name="btnReportPrint" value="개발중간평가보고서인쇄">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 보고자 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="rptName" id="rptName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 개발번호 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="devNo" id="devNo" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('개발번호','common/devPlanPOP')">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 과제명 </label>
                        <div class="col-sm-10 col-md-10">
                            <input name="prjtName" id="prjtName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 보고자의견 </label>
                        <div class="col-sm-8 col-md-8">
                            <input type="radio" name="repoterOpn" value="1" checked="checked">현행계속
                            <input type="radio" name="repoterOpn" value="2">Drop
                            <input type="radio" name="repoterOpn" value="3">계획변경필요(수정계획서작성)
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
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
<div id="tab3" class="container">
    <form class="form-horizontal"  id="frmTab3">
    <input type="hidden" id="cudKey3" name="cudKey3">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="contents" id="contents"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                        <input name="contentsKind" id="contentsKind" type="hidden" value="3" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab4" class="container">
    <form class="form-horizontal"  id="frmTab4">
    <input type="hidden" id="cudKey4" name="cudKey4">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="contents" id="contents"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                        <input name="contentsKind" id="contentsKind" type="hidden" value="4" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
