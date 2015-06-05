<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain//,itemGubn, itemKind1,itemKind2,itemKind3;
var calStDate;
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
		gridMain.attachEvent("onRowSelect",doOnRowSelect);

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
		itemGubn = dhtmlXComboFromSelect("itemGubn");
		itemGubn.addOption("1","제품");
		itemGubn.addOption("2","상품");
		itemGubn.readonly(true);
	    comboAcctKind = dhtmlXComboFromSelect("acctKind");
		itemKind1 = dhtmlXComboFromSelect("itemKind1");
		itemKind2 = dhtmlXComboFromSelect("itemKind2");
		itemKind3 = dhtmlXComboFromSelect("itemKind3");
		/* grouping combo*/
		fn_comboSet(itemKind1, "A001");
		fn_comboSet(comboAcctKind, "J04");
        fn_comboSet(itemKind2, "A002");
        fn_comboSet(itemKind3, "A003");

		fn_search();
		fn_new();
})
//doc Ready End
function doOnRowSelect(id, ind){
	fn_new();
	fn_setEnable("off");

	byId("cudKey").value = "UPDATE";
	var obj={};
	obj.itemCode= gridMain.setCells(id,0).getValue();
	fn_loadFormList(obj);	
}
function fn_loadFormList(obj){
	gfn_callAjaxForForm("frmMain",obj,"formMain",fn_loadFormListCB);
}
function fn_loadFormListCB(data){
	//selectOption
	itemGubn.setComboValue(data[0].itemGubn);
    itemKind1.setComboValue(data[0].itemKind1);
    itemKind2.setComboValue(data[0].itemKind2);
    itemKind3.setComboValue(data[0].itemKind3);
    comboAcctKind.setComboValue(data[0].itemGubn);
    $("#itemCodeTemp").val(data[0].itemCode);
}
//신규 버튼 동작
function fn_new(){
    byId("frmSearch").reset();
    byId("frmMain").reset();
	byId("enterDate").value = dateformat(new Date());
	fn_setEnable("on");
	byId("cudKey").value = "INSERT";                    
	$("input[name=itemCode]").attr("disabled", true);
    $("input[name=itemNumb]").attr("disabled", true);

}

function fn_gridMainSel(){
	if($("#pCode").val() == ""){
		$("#pCode").val("%");
	}
	if($("#pName").val() == ""){
		$("#pName").val("%");
	}
	var obj= gfn_getFormElemntsData('frmSearch');
    gfn_callAjaxForGrid(gridMain,obj,"gridMainSel",subLayout.cells("a"));
    byId("frmSearch").reset();

}
//조회 버튼 동작
function fn_search() {
	fn_gridMainSel();
}
function fn_validForm(){
	if($('#cudKey').val()=='INSERT'){
	fn_comboValid(itemKind1,"대분류");
	fn_comboValid(itemKind2,"중분류");
	fn_comboValid(itemKind3,"소분류");
	fn_comboValid(itemGubn,"제품구분");
	}
	f_dxRules = {
			itemName: ["제품명", r_notEmpty],
		    itemSpec: ["제품규격", r_notEmpty],
		    itemUnit: ["단위", r_notEmpty],
		    packUnit: ["포장단위", r_onlyNumber],
		    safetyQty: ["안전재고", r_onlyNumber],
		    leadTime: ["lead time", r_onlyNumber],
		    totWet: ["총중량", r_onlyNumber],
		    baseWet: ["순중량", r_onlyNumber],
		    keepTemp1: ["보관온도", r_onlyNumber],
		    keepTemp2: ["보관온도", r_onlyNumber]
			};
}
//저장 버튼 동작
function fn_save() {
    fn_validForm();
    $("input[name=itemCode]").attr("disabled", false);
    $("input[name=itemNumb]").attr("disabled", false);
    if (gfn_formValidation('frmMain')) {
        var params = gfn_getFormElemntsData('frmMain');
        console.log(params)
        $.ajax({
            type: 'POST',
            url: "/erp/rndt/stan/goodsCodeS/frmSave",
            data: params,
            success: function(data) {
                MsgManager.alertMsg("INF001");
                fn_search();
                fn_saveFrmCallbck()
                }
        });
    }
}
function fn_saveFrmCallbck(){
	if ($('#cudKey').val() == 'DELETE') {
        fn_new();
        return;
    }else{
    var obj ={}; 
    obj.itemCode = $("#itemCodeTemp").val();
    fn_loadFormList(obj);
    $("input[name=itemCode]").attr("disabled", true);
    $("input[name=itemNumb]").attr("disabled", true);
    }
}
//삭제 버튼 동작
function fn_remove() {
    $('#cudKey').val('DELETE');
    var rodid = gridMain.getSelectedRowId();
    gridMain.cs_deleteRow(rodid);
}

function fn_comboValid(comboId, name) {
    var comboChk = comboId.getSelectedValue();
    if (comboChk == null || comboChk == "" || typeof comboChk == "undefined") {
        dhtmlx.alert(name + " 선택은 필수 항목입니다.");
        return;
    }
    return;
}


function fn_comboSet(comboId,params){
	comboId.setTemplate({
		    input: "#interCode#",
		    input: "#interName#",
		    columns: [
		       {header: "내부코드", width: 100,  option: "#interCode#"},
			   {header: "코드명",   width: 100,  option: "#interName#"}
		    ]
		});
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
	comboId.readonly(true);
	var obj={};
	obj.compId = '100';
	obj.code = params;
	doOnOpen(comboId,obj);
}
function doOnOpen(comboId,params){
	$.ajax({
		"url":"/erp/cmm/InterCodeR",
		"type":"post",
		"data":params,
		"success" : function(data){
		  var list = data;
		  for(var i=0;i<list.length;i++){
			 comboId.addOption([
			  {value: list[i].interCode, text:
			  {interCode: list[i].interCode,
			   interName: list[i].interName}}   
			   ]);	
		    }
		}
  });	
};
function fn_setEnable(flag){
	if(flag=="on"){
	    itemKind1.enable();
	    itemGubn.enable();
	    itemKind2.enable();
	    itemKind3.enable();
	    itemGubn.unSelectOption();
	    itemKind1.unSelectOption();
		itemKind2.unSelectOption();
		itemKind3.unSelectOption();
	}else if(flag=="off"){
    itemKind1.disable();
    itemGubn.disable();
    itemKind2.disable();
    itemKind3.disable();

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
    <input type="hidden" id="cudKey" name="cudKey" />
    <input type="hidden" id="itemCodeTemp" name="itemCodeTemp" />
    <div class="container">
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput"> 제품코드 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
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
                <label class="col-sm-2 col-md-2 control-label" for="textinput"> 대분류 </label>
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
                    <input name="itemNumb" id="itemNumb" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                </div>
                <div class="col-sm-2 col-md-2">
                    <p style="margin: 6px 0px -5px 15px;">일련번호는 저장 시 자동 생성</p>
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
                    <input name="packUnit" id="packUnit" type="text" value="0" placeholder="" class="form-control input-xs">
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
                    	<option value="0">제조</option>                    
                    	<option value="1">개봉</option>                    
                    </select>
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 유효기간 </label>
                <div class="col-sm-2 col-md-2">
                    <div class="col-sm-10 col-md-10">
                        <input name="validTime" id="validTime" type="text" value="" placeholder="" class="form-control input-xs format_date">
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
                    <input name="leadTime" id="leadTime" type="text" value="0" placeholder="" class="form-control input-xs">
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 안전재고 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="safetyQty" id="safetyQty" type="text" value="0" placeholder="" class="form-control input-xs">
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
                    <input name="baseWet" id="baseWet" type="text" value="0" placeholder="" class="form-control input-xs">
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 총중량 </label>
                <div class="col-sm-2 col-md-2">
                    <input name="totWet" id="totWet" type="text" value="0" placeholder="" class="form-control input-xs">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group form-group-sm">
                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                    검사유무</label>
                <div class="col-sm-2 col-md-2">
                    <select name="inspYn" id="inspYn" class="form-control input-xs">
                    	<option value="0">무검사</option>
                    	<option value="1">검사</option>
                    </select>
                </div>
                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 보관온도 </label>
                <div class="col-sm-2 col-md-2">
                    <div class="col-sm-4 col-md-4">
                        <input name="keepTemp1" id="keepTemp1" type="text" value="0" placeholder="" class="form-control input-xs">
                    </div>
                    <label class="col-sm-4 col-md-4" style="text-align: center; vertical-align: middle;">~</label>

                    <div class="col-sm-4 col-md-4">
                        <input name="keepTemp2" id="keepTemp2" type="text" value="0" placeholder="" class="form-control input-xs">
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
                            <input name="enterDate" id="enterDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker2" class="calicon form-control">
                        </div>
                    </div>
                    <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용구분 </label>
                    <div class="col-sm-2 col-md-2">
                        <select id="useYn" name="useYn" class="form-control input-xs">
                        	<option value="0">사용</option>
                    		<option value="1">미사용</option>
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
                            <input name="endDate" id="endDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
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