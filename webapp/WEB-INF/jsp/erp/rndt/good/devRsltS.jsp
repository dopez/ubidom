<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
     <script type="text/javascript">
var layout, toolbar, subLayout,subTabbar;
var tab1Toolbar,tab2Toolbar,tab3Toolbar,tab4Toolbar,tab5Toolbar,tab6Toolbar,tab7Toolbar
var tab1,tab2,tab3,tab4,tab5,tab6,tab7
var calMain;
var tabId = "a1";
var popParam="";
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
            fn_setTab4();
            fn_setTab5();
            
            fn_setTab7();

            //tab end
            if($("#openParam").val()=="u"){
            	/*조회화면을 타고 올 때*/
            	dateVal = searchDate($("#setDate").val());
            	seqVal = $("#setSeq").val();
            	planNumVal = $("#planNumb").val();
            	fn_search();
           		fn_searchFrmTab("frmTab2","a2");
           		fn_searchFrmTab("frmTab3","a3");
    			fn_searchFrmTab("frmTab7","a7");
    			fn_searchFrmTab("frmTab4_1","a4");
    			fn_searchFrmTab("frmTab4_2","a4");
    			fn_searchFrmTab("frmTab5_1","a5");
    			fn_searchFrmTab("frmTab5_2","a5");
    			fn_searchFrmTab("frmTab5_3","a5");
           		
            	fn_frm1Chk();
            	fn_frm2Chk();
            	fn_frm3Chk();
            	fn_frm4Chk();
            	fn_frm5Chk();
            	fn_frm7Chk();

            }else{
            	/*처음 등록할 때*/
            	fn_setDate();
            	
            	
            	fn_frm1Chk();
            	fn_frm2Chk();
            	fn_frm3Chk();
            	fn_frm4Chk();
            	fn_frm5Chk();
            	fn_frm7Chk();
            }
            $("#planNumb, #korName, #evaluateNumb").dblclick(function(e){
    			if(e.target.id == "planNumb"){
    				var obj= {};
    					obj.problemName =$("#problemName").val();
    					obj.kind = $(':radio[name="midevalKind"]:checked').val()
    					if(obj.kind==0){
    						popParam="0";
    					}else if(obj.kind==1){
    						popParam="1";
    					}
    					gfn_load_pop('w1','common/devPlanPOP02',true,obj);
    			}
    			if(e.target.id == "korName"){
    				gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
    			}
    				if(e.target.id == "postName"){
    				popFlag = 5;
    					gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
    			}
    	    })
})
function fn_search(){
	if(fn_seqValid()){
		fn_frmSearch();
		if(tabId=="a1"){
			fn_searchFrmTab("frmTab1","a1");
		}
		if(tabId=="a2"){
			fn_searchFrmTab("frmTab2",tabId);
		}
		if(tabId=="a3"){
			fn_searchFrmTab("frmTab3",tabId);
		}
		if(tabId=="a4"){
			fn_searchFrmTab("frmTab4_1",tabId);
			fn_searchFrmTab("frmTab4_2",tabId);
		}
		if(tabId=="a5"){
			fn_searchFrmTab("frmTab5_1",tabId);
			fn_searchFrmTab("frmTab5_2",tabId);
			fn_searchFrmTab("frmTab5_3",tabId);
		}
		if(tabId=="a6"){
			//fn_searchGridTab(tab6,tabId,subTabbar.tabs("a6"),fn_selgridTab6CB)
		}
		if(tabId=="a7"){
			fn_searchFrmTab("frmTab7",tabId);
		}
	}
}
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
function fn_onClosePop(pName, data) {
    if (pName == "empNo") {
        var i;
        var obj = {};
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            $('#korName').val(obj.korName);
            $('#empNo').val(obj.empNo);
        }
    }
    if (pName == "planNumb") {
        var i;
        var obj = {};
        for (i = 0; i < data.length; i++) {
            obj.problemName = data[i].problemName;
            obj.planNumb = data[i].planNumb;
            $('#problemName').val(obj.problemName);
            $('#planNumb').val(obj.planNumb);
        }
    }
}
function fn_setNew(){
	byId("frmMain").reset();
	$("#setSeq").val("");
	$("#planNumb").val("");
	$("#problemName").val("");
	fn_setDate();
    $('#setDate,#dueDate').keyup();
    fn_setCud("cudKey","i");
}
function fn_setSearchParam(tabId){
	setSearchParam.setDate = dateVal;
	setSearchParam.setSeq = seqVal;
	setSearchParam.tabId = tabId;
	return setSearchParam;
}
function fn_searchGridTab(grid,tabId,layout,cbFunc){
	fn_setSearchParam(tabId);
	console.log(setSearchParam);
	gfn_callAjaxForGrid(grid,setSearchParam,"selGridTab",layout,cbFunc);

}
function fn_searchFrmTab(form,tabId){
	fn_setSearchParam(tabId);
	console.log(setSearchParam);
	gfn_callAjaxForForm(form, setSearchParam, "selFrmTab",fn_searchFrmTabCB);
}
function fn_searchFrmTabCB(data){
	console.log("form sel data=",data);
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
                        <input name="contentsKind" id="contentsKind" type="hidden" value="3" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<style>
/*개발중간평가등록 7번째 탭*/
#tab4_1 input {
    width: 100%;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    border-radius:1px;
    border: 1px solid #ccc;
    color: #555;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
#subt{
	text-align: center;
}
/*개발중간평가등록 7번째 탭*/
</style>
<div id="tab4_1" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab4_1">
        <input type="hidden" id="cudKey4" name="cudKey4">
        <input type="hidden" id="tabId4" name="tabId">
        <div class="col-sm-4 col-md-4">
<!--         <div class="col-md-offset-1 col-sm-offset-1 col-sm-4 col-md-4"> -->
	       <table class="table">
		    <thead>
		      <tr>
		        <th class="col-sm-1 col-md-1">구분</th>
		        <th class="col-sm-1 col-md-1" id="subt">계획</th>
		        <th class="col-sm-1 col-md-1" id="subt">변경</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>제품</td>
		        <td><input name="itemName" id="itemName" type="text" value="" placeholder="" readonly="readonly"></td>
		        <td><input name="cItemName" id="cItemName" type="text" value="" placeholder=""></td>
		      </tr>
		      <tr>
		        <td>기술</td>
		        <td><input name="techName" id="techName" type="text" value="" placeholder=""readonly="readonly"></td>
		        <td><input name="cTechName" id="cTechName" type="text" value="" placeholder=""></td>
		      </tr>
		      <tr>
		        <td>목표재료</td>
		        <td><input name="targetMatr" id="targetMatr" type="text" value="" placeholder=""readonly="readonly"></td>
		        <td><input name="cTargetMatr" id="cTargetMatr" type="text" value="" placeholder=""></td>
		      </tr>
		    </tbody>
		  </table>
	  </div>
    </form>
</div>
<div id="tab4_2" class="container">
    <form class="form-horizontal"  id="frmTab4_2">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 내용 </label>
                    <div class="col-sm-10 col-md-10">
                        <textarea style="background-color:white;  height: 300px;padding: 5px;border: 3px solid #cccccc;"
		                          cols="50" rows="10" name="remarks" id="remarks"
		                          placeholder="" class="form-control input-xs"
		                          readonly="readonly"></textarea>
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
                        <input name="contentsKind" id="contentsKind" type="hidden" value="4" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="bootContainer2">
    <div class="container">
        <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
            <input name="cudKey" id="cudKey" type="hidden">
	        <input type="hidden" value="${openParam}"id="openParam" name="openParam">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="setDate" id="setDate" type="text" value="" placeholder="" class="form-control input-xs format_date"> </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control"> </div>
                        </div>
                        <div class="col-sm-1 col-md-1">
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                <input name="setSeq" id="setSeq" type="text" value="" placeholder="" class="form-control input-xs" readonly="readonly"> </div>
                        </div>
                        <div class="col-sm-offset-4 col-md-offset-4 col-sm-3 col-md-3">
                            <input type="button" class="btn btn-default btn-xs form-control" id="btnReportPrint" name="btnReportPrint" value="개발결과보고서인쇄"> </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 보고자 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="empNo" id="empNo" type="hidden" value="${empNo}" placeholder="" class="form-control input-xs">
                            <input name="korName" id="korName" type="text" value="${empName}" placeholder="" class="form-control input-xs"> </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 개발번호 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="planNumb" id="planNumb" type="text" value="" placeholder="" class="form-control input-xs"> 
                        </div>
                        <div class="col-sm-6 col-md-6" id="radioBtn">
							<input type="radio" name="midevalKind" id="midevalKind" value="0" checked="checked">개발계획
							<input type="radio" name="midevalKind" id="midevalKind" value="1">중간평가
							<input type="hidden" name="midEvalParam" id="midEvalParam" value="${midEvalParam}">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 과제명 </label>
                        <div class="col-sm-10 col-md-10">
                            <input name="problemName" id="problemName" type="text" value="" placeholder="" class="form-control input-xs"> </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 출시예정일 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="dueDate" id="dueDate" type="text" value="" placeholder="" class="form-control input-xs format_date"> </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker2" class="calicon form-control"> </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="tab5_1" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab5_1">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 적용제품 </label>
                    <div class="col-sm-10 col-md-10">
                        <input name="targetItem" id="targetItem" type="text" value="" placeholder="" class="form-control input-xs"> </div>
                </div>
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 개발선행도 </label>
                    <div class="col-sm-10 col-md-10">
                        <input type="radio" name="devKind" value="1" checked="checked">국내경쟁사 후행
                        <input type="radio" name="devKind" value="2">국내경쟁사 동일시점
                        <input type="radio" name="devKind" value="3">국내최초
                        <input type="radio" name="devKind" value="4">해외선진 Master 동일시점
                        <input type="radio" name="devKind" value="5">세계최초 </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab5_2" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab5_2">
        <input type="hidden" id="cudKey5" name="cudKey5">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 국내(계획) </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="patentLocal" id="patentLocal" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;" readonly="readonly">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 국내(실적) </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="cPatentLocal" id="cPatentLocal" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;">
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 해외(계획) </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="patentFore" id="patentFore" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;" readonly="readonly">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 해외(실적) </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="cPatentFore" id="cPatentFore" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="tab5_3" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab5_3">
        <div class="row">
            <div class="col-sm-8 col-md-8">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 국내(계획) </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="paperLocal" id="paperLocal" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;" readonly="readonly">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 국내(실적) </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="cPaperLocal" id="cPaperLocal" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;">
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 해외(계획) </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="paperFore" id="paperFore" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;" readonly="readonly">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 해외(실적) </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="cPaperFore" id="cPaperFore" type="text" value="" placeholder="건" class="form-control input-xs" style="text-align: right;">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>