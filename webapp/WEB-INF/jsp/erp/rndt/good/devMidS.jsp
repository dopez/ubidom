<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var layout, toolbar, subLayout,subTabbar;
var tab1Toolbar,tab2Toolbar,tab3Toolbar,tab4Toolbar,tab5Toolbar,tab6Toolbar,tab7Toolbar,tab8Toolbar;
var combo01;
var tab1,tab2,tab3,tab4,tab5,tab6,tab7,tab8;
var tabId = "a1";
var popFlag;
var dateVal,seqVal,planNumVal;
var setSearchParam = {};
$(document).ready(function() {

        Ubi.setContainer(4, [1, 2, 3, 4], "1C"); //개발중간평가등록

        layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout();

        //main form//
        layout.cells("b").attachObject("bootContainer2");
        layout.cells("b").setHeight(180);
		
    	toolbar.attachEvent("onClick", fn_frmMain);

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
        fn_setTab7();
        fn_setTab8();
        //tab end

        //POP UP//
        $("#planNumb, #korName").dblclick(function(e){
			if(e.target.id == "planNumb"){
				gfn_load_pop('w1','common/devPlanPOP',true,{"problemName":$("#problemName").val()});
			}
			if(e.target.id == "korName"){
				gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
			}
 			if(e.target.id == "postName"){
				popFlag = 5;
 				gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
			}
	    })
	    
        //setDate//
        calMain = new dhtmlXCalendarObject([{
            input: "setDate",
            button: "calpicker1"
        }]);
        calMain.loadUserLanguage("ko");
        calMain.hideTime();
        if($("#openParam").val()=="u"){
        	dateVal = searchDate($("#setDate").val());
        	seqVal = $("#setSeq").val();
        	planNumVal = $("#planNumb").val();
        	fn_search();
       		fn_searchFrmTab("frmTab2","a2",fn_selfrmTab2CB);
       		fn_searchFrmTab("frmTab3","a3",fn_selfrmTab3CB);
       		fn_searchFrmTab("frmTab4","a4",fn_selfrmTab4CB);
       		//fn_searchFrmTab("frmTab5_1",tabId,fn_selfrmTab5CB_1);
       		//fn_searchFrmTab("tab6_1",tabId,fn_selfrmTab6CB_1);
       		//fn_searchFrmTab("tab6_2",tabId,fn_selfrmTab6CB_2);
       		//fn_searchFrmTab("tab6_3",tabId,fn_selfrmTab6CB_3);
       		//fn_searchGridTab(tab7,tabId,subTabbar.tabs("a7"),fn_selgridTab7CB);	
       		//fn_searchGridTab(tab8Grid,tabId,tab8.cells("a"),fn_selgridTab8CB);	
        	
	        fn_setCud("cudKey","u");
        	fn_frm2Chk();
        	fn_frm3Chk();
        	fn_frm4Chk();

        }else{
        	fn_setDate();
        	
        	fn_frm2Chk();
        	fn_frm3Chk();
        	fn_frm4Chk();
        }

})//doc ready end
function fn_search(){
	fn_frmSearch();
	if(tabId=="a1"){
		fn_searchGridTab(tab1,tabId,subTabbar.tabs("a1"),fn_selgridTab1CB)
	}
	if(tabId=="a2"){
		fn_searchFrmTab("frmTab2",tabId,fn_selfrmTab2CB);
	}
	if(tabId=="a3"){
		fn_searchFrmTab("frmTab3",tabId,fn_selfrmTab3CB);
	}
	if(tabId=="a4"){
		fn_searchFrmTab("frmTab4",tabId,fn_selfrmTab4CB);
	}
	if(tabId=="a5"){
		//fn_searchFrmTab("frmTab5_1",tabId,fn_selfrmTab5CB_1);
		//fn_searchFrmTab("frmTab5_2",tabId,fn_selfrmTab5CB_2);
	}
	if(tabId=="a6"){
		//fn_searchFrmTab("tab6_1",tabId,fn_selfrmTab6CB_1);
		//fn_searchFrmTab("tab6_2",tabId,fn_selfrmTab6CB_2);
		//fn_searchFrmTab("tab6_3",tabId,fn_selfrmTab6CB_3);
	}
	if(tabId=="a7"){
		//fn_searchGridTab(tab7,tabId,subTabbar.tabs("a7"),fn_selgridTab7CB);	
	}
	if(tabId=="a8"){
		//fn_searchGridTab(tab8Grid,tabId,tab8.cells("a"),fn_selgridTab8CB);	
	}
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
function fn_searchFrmTab(form,tabId,cbFunc){
	fn_setSearchParam(tabId);
	console.log(setSearchParam);
	gfn_callAjaxForForm(form, setSearchParam, "selFrmTab",cbFunc);
}
function fn_frmMain(id) {
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
	        fn_new();
        }
    }
}
function fn_onClosePop(pName,data){
	if (pName=="empNo") {
		var i;
		var obj={};
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            $('#korName').val(obj.korName);
            $('#empNo').val(obj.empNo);
        }
    }
	if (pName=="planNumb") {
		/*close가 된 후 result가 리턴 되기 때문에 success될 때 코드를 실행하게 만듬*/
		$.ajax({
		        type: 'POST',
		        url: "/erp/rndt/good/devMidS/planNumbChk",
		        data: "planNumb="+data[0].planNumb,
		        success: function(result) {
		        	if(result[0].cnt>0){
		    			dhtmlx.alert({
		    			    text: "이미 중간평가 된 과제입니다.",
		    			    callback: function(result){
		    			    	gfn_load_pop('w1','common/devPlanPOP',true,{"problemName":$("#problemName").val()});
		    			    }
		    			});
		        	}else{
		        		var i;
		    			var obj={};
		    	        for (i = 0; i < data.length; i++) {
		    	            obj.problemName = data[i].problemName;
		    	            obj.planNumb = data[i].planNumb;
		    	            $('#problemName').val(obj.problemName);
		    	            $('#planNumb').val(obj.planNumb);
		    	        }

		        	}
		        }
		    });
    }
};
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
                                <input name="setDate" id="setDate" type="text" value="${setDate}" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                        </div>
                        <div class="col-sm-1 col-md-1">
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                <input name="setSeq" id="setSeq" type="text" value="${setSeq}" placeholder="" class="form-control input-xs" disabled="disabled">
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
                            <input name="korName" id="korName" type="text" value="${empName}" placeholder="" class="form-control input-xs">
                            <input name="empNo" id="empNo" type="hidden" value="${empNo}" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 개발번호 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="planNumb" id="planNumb" type="text" value="${planNumb}" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 과제명 </label>
                        <div class="col-sm-10 col-md-10">
                            <input name="problemName" id="problemName" type="text" value="${problemName}" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 보고자의견 </label>
                        <div class="col-sm-8 col-md-8">
                            <input type="radio" name="opKind" value="1" checked="checked">현행계속
                            <input type="radio" name="opKind" value="2">Drop
                            <input type="radio" name="opKind" value="3">계획변경필요(수정계획서작성)
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<form class="form-horizontal"  id="frmTab1" name="frmTab1">
<input type="hidden" id="jsonData1" name="jsonData1">
<input type="hidden" id="tabId1" name="tabId">
</form>
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
<div id="tab4" class="container">
    <form class="form-horizontal"  id="frmTab4">
    <input type="hidden" id="cudKey4" name="cudKey4">
    <input type="hidden" id="tabId4" name="tabId">
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
<form class="form-horizontal"  id="frmTab5" name="frmTab5">
<input type="hidden" id="jsonData5" name="jsonData5">
<input type="hidden" id="tabId5" name="tabId">
</form>
<form class="form-horizontal"  id="frmTab6" name="frmTab6">
<input type="hidden" id="jsonData6" name="jsonData6">
<input type="hidden" id="tabId6" name="tabId">
</form>
<style>
/*개발중간평가등록 7번째 탭*/
#tab7_1 input {
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
<div id="tab7_1" class="container">
    <form class="form-horizontal" style="padding-top: 5px; padding-bottom: 5px; margin: 0px;" id="frmTab7_1">
        <input type="hidden" id="cudKey7" name="cudKey7">
        <input type="hidden" id="tabId7" name="tabId">
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
		        <td><input name="itemName" id="itemName" type="text" value="" placeholder=""></td>
		        <td><input name="itemName" id="itemName" type="text" value="" placeholder=""></td>
		      </tr>
		      <tr>
		        <td>기술</td>
		        <td><input name="itemName" id="itemName" type="text" value="" placeholder=""></td>
		        <td><input name="itemName" id="itemName" type="text" value="" placeholder=""></td>
		      </tr>
		      <tr>
		        <td>목표재료</td>
		        <td><input name="itemName" id="itemName" type="text" value="" placeholder=""></td>
		        <td><input name="itemName" id="itemName" type="text" value="" placeholder=""></td>
		      </tr>
		    </tbody>
		  </table>
	  </div>
    </form>
</div>
<div id="tab7_2" class="container">
    <form class="form-horizontal"  id="frmTab7_2">
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
 <form class="form-horizontal"  id="frmTab8" name="frmTab8">
<input type="hidden" id="jsonData8" name="jsonData8">
<input type="hidden" id="tabId8" name="tabId">
</form>