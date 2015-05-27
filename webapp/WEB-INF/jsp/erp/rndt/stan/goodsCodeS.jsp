<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calStDate;
var comboItemGubn;
$(document).ready(function(){
		Ubi.setContainer(1, [1, 2, 3, 4], "2U"); //제품코드등록
		
		layout = Ubi.getLayout();
		toolbar = Ubi.getToolbar();
		subLayout = Ubi.getSubLayout();
		
		//form
		layout.cells("b").attachObject("bootContainer2");
		
		//left grid
		subLayout.cells("a").setWidth("252");
		
		gridMain = new dxGrid(subLayout.cells("a"), false);
		gridMain.addHeader({name:"제품코드",colId:"pCode",width:"50",align:"center",type:"ro"});
		gridMain.addHeader({name:"제품명",colId:"pName",width:"50",align:"center",type:"ro"});
		gridMain.setColSort("str");	
		gridMain.setUserData("","pk","pCode");
		gridMain.init(); 
		
		//right form
		subLayout.cells("b").attachObject("productCodeInfo");
		
		//set date
		calStDate = new dhtmlXCalendarObject([{
		    input: "validTime",
		    button: "calpicker1"
		}, {
		    input: "enterDate",
		    button: "calpicker2"
		}, {
		    input: "endDate",
		    button: "calpicker3"
		}]);
		calStDate.loadUserLanguage("ko");
		calStDate.hideTime();
		var t = dateformat(new Date());
		byId("enterDate").value = t;
		
		//combo
		comboItemGubn = dhtmlXComboFromSelect("itemGubn");
		comboItemGubn.addOption("1","제품");
		comboItemGubn.addOption("2","상품");
		
		

})
//doc Ready End

//조회 버튼 동작
function fn_search() {
 
}

//신규 버튼 동작
function fn_new(){
	
}

//저장 버튼 동작
function fn_save(){
	
}

//삭제 버튼 동작
function fn_remove(){
	
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
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 제품코드 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 제품명 </label>
                        <div class="col-sm-3 col-md-3">
                            <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="productCodeInfo">
    <form id="frmMain" class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
    <div class="container">
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    제품코드 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                <div class="col-sm-2 col-md-2">
                    <select name="itemGubn" id="itemGubn" class="form-control input-xs">
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    대분류 </label>
                <div class="col-sm-2 col-md-2">
                    <select name="itemKind1" id="itemKind1" class="form-control input-xs">
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    중분류 </label>
                <div class="col-sm-2 col-md-2">
                    <select name="itemKind2" id="itemKind2" class="form-control input-xs">
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    소분류 </label>
                <div class="col-sm-2 col-md-2">
					<select name="itemKind3" id="itemKind3" class="form-control input-xs">
	                </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    일련번호 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="itemNumb" id="itemNumb" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    제품명 </label>
                <div class="col-sm-6 col-md-6">
                    <input name="itemName" id="itemName" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    규격 </label>
                <div class="col-sm-6 col-md-6">
                    <input name="itemSpec" id="itemSpec" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    단위 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="itemUnit" id="itemUnit" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 포장단위 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="packUnit" id="packUnit" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    유통기간구분 </label>
                    <!-- disKind -->
                <div class="col-sm-2 col-md-2">
                    <select name="disKind" id="disKind" class="form-control input-xs">
                    </select>
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 유효기간 </label>
                <div class="col-sm-2 col-md-2">
                    <div class="col-sm-10 col-md-10">
                        <input name="validTime" id="validTime" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                     <div class="col-sm-2 col-md-2">
                        <input type="button" id="calpicker1" class="calicon form-control">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    LEAD TIME </label>
                <div class="col-sm-2 col-md-2">
                    <input name="leadTime" id="leadTime" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 안전재고 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="safetyQty" id="safetyQty" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
                <div class="col-sm-2 col-md-2">
                    <input type="radio" name="safetyKind" value="2" checked="checked">변동
                    <input type="radio" name="safetyKind" value="1">고정
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    순중량</label>
                <div class="col-sm-2 col-md-2">
                    <input name="baseWet" id="baseWet" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 총중량 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="totWet" id="totWet" type="text" value="" placeholder="" class="form-control input-xs">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    검사유무</label>
                <div class="col-sm-2 col-md-2">
                    <select name="inspYn" id="inspYn" class="form-control input-xs">
                    </select>
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 보관온도 </label>
                <div class="col-sm-2 col-md-2">
                    <div class="col-sm-4 col-md-4">
                        <input name="keepTemp1" id="keepTemp1" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class="col-sm-4 col-md-4" style="text-align: center; vertical-align: middle;">~</label>

                    <div class="col-sm-4 col-md-4">
                        <input name="keepTemp2" id="keepTemp2" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
                <label class="col-sm-2 col-md-2" style="vertical-align: middle;">
                        ˚C </label>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput">
                        등록일자 </label>
                    <div class="col-sm-2 col-md-2">
                        <div class="col-sm-10 col-md-10">
                            <input name="enterDate" id="enterDate" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker2" class="calicon form-control">
                        </div>
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용구분 </label>
                    <div class="col-sm-2 col-md-2">
                        <select id="useYn" name="useYn" class="form-control input-xs">
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput">
                        HS CODE </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="hsCode" id="hsCode" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class="col-sm-2 col-md-2 control-label" for="textinput"> 사용중지일자 </label>
                    <div class="col-sm-2 col-md-2">

                        <div class="col-sm-10 col-md-10">
                            <input name="endDate" id="endDate" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker3" class="calicon form-control">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput">
                        회계구분 </label>
                    <div class="col-sm-2 col-md-2">
                        <select name="acctKind" id="acctKind" class="form-control input-xs">
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>