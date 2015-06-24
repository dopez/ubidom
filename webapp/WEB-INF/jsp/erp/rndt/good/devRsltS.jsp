<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
     <script type="text/javascript">
var layout, toolbar, subLayout,subTabbar;
var tab1Toolbar,tab2Toolbar,tab3Toolbar,tab4Toolbar,tab5Toolbar,tab6Toolbar,tab7Toolbar
var tab1,tab2,tab3,tab4,tab5,tab6,tab7
var calMain;
var tabId = "a1";
var popFlag;
var dateVal,seqVal,planNumVal,evaluateNumb;
var setSearchParam = {};
    $(document).ready(function() {

            Ubi.setContainer(4, [1, 2, 3, 4], "1C"); //개발결과등록

            layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();

            //form//
            layout.cells("b").attachObject("bootContainer2");
            layout.cells("b").setHeight(180);
            
        	toolbar.attachEvent("onClick", fn_frmMain);

            //tabbar//	
            subTabbar = subLayout.cells("a").attachTabbar({
                tabs: [{id: "a1",text: "개발완료개요",active: true}, 
                       {id: "a2",text: "Output 활용계획"},
                       {id: "a3",text: "개발성과"}, 
                       {id: "a4",text: "개발목표(수준)"}, 
                       {id: "a5",text: "특허출원 등"}, 
                       {id: "a6",text: "투자관련사항"}, 
                       {id: "a7",text: "보고자의견"},]});
            subTabbar.setArrowsMode("auto");
            subTabbar.attachEvent("onTabClick", function(id, lastId) {
                tabId = id;
            });
            
            fn_setTab1();
            fn_setTab2();
            fn_setTab3();
            
            fn_setTab7();

            //tab end
            if($("#openParam").val()=="u"){
            	/*조회화면을 타고 올 때*/
            	dateVal = searchDate($("#setDate").val());
            	seqVal = $("#setSeq").val();
            	planNumVal = $("#planNumb").val();
            	
            	fn_frm1Chk();
            	fn_frm2Chk();
            	fn_frm3Chk();
            	fn_frm7Chk();

            }else{
            	/*처음 등록할 때*/
            	fn_setDate();
            	
            	fn_frm1Chk();
            	fn_frm2Chk();
            	fn_frm3Chk();
            	fn_frm7Chk();
            }

})
function fn_frmMain(id) {
	if (id=="btn2"){
        fn_setNew();
	}
    if (id == "btn3") {//저장
    	if($("#planNumb").val()==""||$("#planNumb").val()==null||$("#planNumb").val().length<=0){
    		dhtmlx.alert("개발번호는 필수 입력입니다.");
    		return;
    	}else{
	        if ($('#setSeq').val() == '') {
	            fn_getSeqReturn();
		        fn_setCud("cudKey","i");
		        fn_frmMainSave();
		        $('#setDate').keyup();
		        fn_setCud("cudKey","u");
	        }else{
	        	fn_setCud("cudKey","u");
		        fn_frmMainSave();
		        $('#setDate').keyup();
	        }
    	}
    }
    if (id == "btn4"){//삭제
    	if ($('#setSeq').val() == '') {
            dhtmlx.alert("조회된 데이터가 없습니다.")
            return;
        }else{
	        fn_setCud("cudKey","d");
	        fn_frmMainSave();
	        fn_setNew();
        }
    }
}
</script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSFn.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSTab1.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSTab2.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSTab3.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSTab4.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSTab5.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSTab6.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSTab7.js"></script>
<script type="text/javascript" src="/script/erp/rndt/devRsltS/devRsltSTab8.js"></script>
<style>
form{
	padding-top: 10px; padding-bottom: 5px; margin: 0px;
}
</style>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="tab1" class="container">
    <form class="form-horizontal"  id="frmTab1">
    <input type="hidden" id="cudKey1" name="cudKey1">
    <input type="hidden" id="tabId1" name="tabId">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="contents" id="contents"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                        <input name="evaluateKind" id="evaluateKind" type="hidden" value="1" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab2" class="container">
    <form class="form-horizontal"  id="frmTab2">
    <input type="hidden" id="cudKey2" name="cudKey2">
    <input type="hidden" id="tabId2" name="tabId">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="contents" id="contents"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                        <input name="evaluateKind" id="evaluateKind" type="hidden" value="1" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab3" class="container">
    <form class="form-horizontal"  id="frmTab3">
    <input type="hidden" id="cudKey3" name="cudKey3">
    <input type="hidden" id="tabId3" name="tabId">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="contents" id="contents"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                        <input name="evaluateKind" id="evaluateKind" type="hidden" value="2" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab7" class="container">
    <form class="form-horizontal"  id="frmTab7">
    <input type="hidden" id="cudKey7" name="cudKey7">
    <input type="hidden" id="tabId7" name="tabId">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="contents" id="contents"
		                          placeholder="" class="form-control input-xs"
		                          onfocus="fn_textAreaSetbg('#e5fff3');" onblur="fn_textAreaSetbg('white')"></textarea>
                        <input name="evaluateKind" id="evaluateKind" type="hidden" value="3" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="bootContainer2">
    <div class="container">
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain01">
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
                            <input type="button" class="btn btn-default btn-xs form-control" id="btnReportPrint" name="btnReportPrint" value="개발결과보고서인쇄">
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
                            <input name="devNo" id="devNo" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('개발번호','common/devPlanPOP')">
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
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 출시예정일 </label>
                        <div class="col-sm-2 col-md-2">

                            <div class="col-sm-10 col-md-10">
                                <input name="dueDate" id="dueDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <span>
     <input type="button" id="calpicker2" class="calicon form-control">
   </span>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
<div id="patentInfo">
    <form action="" class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain02">
        <div class="row">
            <div class="form-group form-group-sm">
                <label class=" col-sm-2 col-md-1 control-label" for="textinput">
                    적용제품 </label>
                <div class="col-sm-6 col-md-6">
                    <input name="prjtName" id="prjtName" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class=" col-sm-2 col-md-1 control-label" for="textinput">
                    개발선행도 </label>
                <div class="col-sm-10 col-md-10">
                    <input type="radio" name="foregoDegree" value="1" checked="checked">국내경쟁사 후행
                    <input type="radio" name="foregoDegree" value="2">국내경쟁사 동일시점
                    <input type="radio" name="foregoDegree" value="3">국내최초
                    <input type="radio" name="foregoDegree" value="4">해외선진 Master 동일시점
                    <input type="radio" name="foregoDegree" value="5">세계최초
                </div>
            </div>
        </div>

    </form>
</div>