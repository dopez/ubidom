<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var gridDtl;
var f_dxRules;
var custCodeVal;
$( document ).ready(function() {

	Ubi.setContainer(1,[1,2,3,4,5,6],"2U");
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	//공급업체등록

	layout.cells("b").attachObject("bootContainer");
	subLayout.cells("b").attachObject("bootContainer2");
	subLayout.cells("a").setWidth("303");

	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"고객코드", colId:"custCode", width:"80", align:"center", type:"ro"});
	gridMst.addHeader({name:"고객명", 	colId:"custKorName", width:"80", align:"center", type:"ro"});
	gridMst.addHeader({name:"사업자번호", 	colId:"custNumb", width:"120", align:"center", type:"ro"});
	gridMst.setUserData("","pk","custCode");
	gridMst.setColSort("str");

	gridMst.init();

	gridMst.attachEvent("onRowSelect",doOnRowSelectMst);

	gridDtl = new dxGrid("subGrid", false);
	gridDtl.addHeader({name:"고객코드", colId:"custCode", width:"80", align:"center", type:"ro"});
	gridDtl.addHeader({name:"사원번호", colId:"empNo", width:"80", align:"center", type:"ro"});
	gridDtl.addHeader({name:"이름", colId:"empName", width:"80", align:"center", type:"ro"});
	gridDtl.addHeader({name:"직책", 	colId:"jobPosition", width:"80", align:"center", type:"ed"});
	gridDtl.addHeader({name:"소속", 	colId:"deptName", width:"80", align:"center", type:"ed"});
	gridDtl.addHeader({name:"HP번호", 	colId:"hpNo", width:"80", align:"center", type:"ed"});
	gridDtl.addHeader({name:"전화", 	colId:"telNo", width:"80", align:"center", type:"ed"});
	gridDtl.addHeader({name:"이메일", 	colId:"eMail", width:"80", align:"center", type:"ed"});
	gridDtl.addHeader({name:"시작일자", 	colId:"startDate", width:"80", align:"center", type:"ed"});
	gridDtl.addHeader({name:"중지일자", 	colId:"stopDate", width:"80", align:"center", type:"ed"});
	gridDtl.addHeader({name:"비고", 	colId:"rmk", width:"80", align:"center", type:"ed"});
	gridDtl.setUserData("","pk","custCode");
	gridDtl.setColSort("str");


	gridDtl.init();

	fn_search();

	gridDtl.dxObj.setColumnHidden(1,true);
	gridDtl.attachEvent("onRowSelect",doRowDblClickedDtl);

    $("#pcSearchBtn").click(function(e){
    	if($("#postGbn1").is(":checked")){
    		execDaumPostcode("postNo","custAddress");
    	}else{
    		execDaumPostcode("postNo","custAddressB");
    	}
	});

	$("#custName").dblclick(function(e){
		gfn_load_pop('w1','common/supplyCompCodePOP',true,{"custName":$(this).val()});
	});

	$("#frmMain input:text,input:checkbox").on("change keyup", function(e){
		if($("#cudKey").val()!="INSERT"){
			$("#cudKey").val("UPDATE");
		}
	});
});

function fn_search(){
	gridDtl.clearAll();
	$("#frmMain")[0].reset();
	$("input:checkbox","#frmMain").removeAttr('checked');
	var obj={};
	if(!$("#frmSearch input[name='custCode']").val().length){
		obj.custCode="%";
		obj.custName="%";
	}
	gfn_callAjaxForGrid(gridMst,obj,"mst",subLayout.cells("a"));
	var custCodeColIdx = gridMst.getColIndexById("custCode");
	var values=gridMst.dxObj.collectValues(custCodeColIdx);

	if(custCodeVal != undefined){

		gridMst.dxObj.selectRow(values.indexOf(custCodeVal),true,true,true);
	}else{
		gridMst.dxObj.selectRow(0,true,true,true);
	}


}

function doOnRowSelectMst(id,ind){
	$("#frmMain")[0].reset();
	$("input:checkbox","#frmMain").removeAttr('checked');
	$("#cudKey").val("UPDATE");
	var obj = {};
	obj.custCode= gridMst.setCells(id,0).getValue();
	obj.custName= gridMst.setCells(id,1).getValue();
	gfn_callAjaxForForm("frmMain",obj,"mst");
	gfn_callAjaxForGrid(gridDtl,obj,"dtl",subLayout.cells("b"));

}

function doRowDblClickedDtl(rId,cInd){
	if(cInd == 2){
		gfn_load_pop('w1','common/empPOP',true,{});
	}
}

function fn_add(){
	var custCode = $("#frmMain input[name='custCode']").val();

	var totalColNum = gridDtl.getColumnCount();
    var data = new Array(totalColNum);

    var custCodeColIdx = gridDtl.getColIndexById("custCode");
    var startDateColIdx = gridDtl.getColIndexById('startDate');
    var stopDateColIdx = gridDtl.getColIndexById('stopDate');

    data[custCodeColIdx] = custCode;
    var date = dateformat(new Date());
	data[startDateColIdx] = "99991231";
	data[stopDateColIdx] = "99991231";

    gridDtl.addRow(data);


}

function fn_delete(){
	var selectedId = gridDtl.getSelectedRowId();
	gridDtl.cs_deleteRow(selectedId);
}

function fn_remove(){
	$("#cudKey").val("DELETE");
	fn_save();
}

function fn_new(){
	gridMst.clearSelection();
	gridDtl.clearAll();
	$("#frmMain")[0].reset();
	$("input:checkbox","#frmMain").removeAttr('checked');
// 	$("#custKindA").attr("checked",true);
	$("#cudKey").val("INSERT");
	console.log("fn_new()")
}

function fn_save(){

	var crud = $("#cudKey").val();

	f_dxRules = {
			   custKorName : ["고객명",r_notEmpty],
		       regiNumb: ["주민번호",r_notEmpty]
	};

	if(crud == "INSERT"){

		var d = fn_process1()[0];
		$("#frmMain input[name='custCode']").val(d.custCode);

		if(d.rtnCode=="0"){
			if(gfn_formValidation('frmMain')){
				fn_process2();
				fn_process3();
				fn_search();
			};
		};

		if(d.rtnCode=="1"){
			dhtmlx.confirm("거래처명이 중복입니다. 저장하시겠습니까?", function(result){
				if(gfn_formValidation('frmMain')){
					fn_process2();
					fn_process3();
					fn_search();
				};
			});
		};

		if(d.rtnCode=="2"){
			dhtmlx.confirm("사업자 번호가 중복입니다.");
			$( "#custNumb" ).focus();
		};
	};

	if(crud == "UPDATE"){

		if(gfn_formValidation('frmMain')){
			fn_process2();

			fn_process3();
			fn_search();
		};
	};

	if(crud == "DELETE"){
		fn_process2();
		fn_search();
	};

	function fn_process1(){
		var obj = {};
		obj.cudKey = $("#cudKey").val();
		obj.custKorName = $("#custKorName").val();
		obj.regiNumb = $("#regiNumb").val();
		gfn_callAjaxComm(obj,"chkValid",callBckFun);


	};

    function fn_process2(){
    	gfn_callAjaxComm(gfn_getFormElemntsData("frmMain"),"mstSave");
    };
    function fn_process3(){
	 	var jsonStr = gridDtl.getJsonUpdated2();
	    $("#jsonData").val(jsonStr);
	    gfn_callAjaxComm($("#frmServer").serialize(),"dtlSave");
	    dhtmlx.alert("저장 완료");
	    custCodeVal=$("#frmMain input[name='custCode']").val();
    };
}

function fn_onClosePop(pName,data){

	if(pName == "postCode"){
		var obj={};
		for(i=0;i<data.length;i++){
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			$("#postName").val(obj.postName);
			$("#postCode").val(obj.postCode);
		}
	}
	if(pName == "empNo"){
		var empNoColIndex = gridDtl.dxObj.getColIndexById("empNo");
		var empNameColIndex = gridDtl.dxObj.getColIndexById("empName");
		var selectedId = gridDtl.dxObj.getSelectedRowId();
		gridDtl.setCells(selectedId,empNoColIndex).setValue(data[0].empNo);
		gridDtl.setCells(selectedId,empNameColIndex).setValue(data[0].korName);
	}
}

function fn_callBckFun(data){
	var count=gridDtl.dxObj.getRowsNum();
	if(count > 0){
		for(var i=0;i<count;i++){
			gridDtl.setCells2(i,0).setValue(data[0].custCode);
		}
	}
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer">
    <div class="container">
        <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            고객코드
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="custCode" id="custCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            고객명
                        </label>
                        <div class="col-sm-4 col-md-4">
                            <input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<form id="frmServer">
<input type="hidden" id="jsonData" name="jsonData">
</form>
<div id="bootContainer2">
    <div class="container">
        <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        고객코드
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="custCode" id="custCode" type="text" placeholder="" class="form-control input-xs" readonly>
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        고객명
                    </label>
                    <div class="col-sm-4 col-md-4">
                        <input name="custKorName" id="custKorName" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        주민번호
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="regiNumb" id="regiNumb" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        대표자명
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="director" id="director" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        사업자등록번호
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="custNumb" id="custNumb" type="text" value="" placeholder="" class="form-control input-xs" required >
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        법인번호
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="bussCode" id="bussCode" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        업태
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="bussKind" id="bussKind" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        종목
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="lawNumb" id="lawNumb" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        우편번호
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <div class="col-sm-9 col-md-9">
                            <input name="postNo" id="postNo" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-3 col-md-3">
                            <button type="button" class="btn btn-default form-control" name="pcSearchBtn" id="pcSearchBtn" onclick="gfn_load_popup('우편번호','common/zipCodePOP')">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        주소구분
                    </label>
                    <div class="col-sm-3 col-md-3">
                        <div class="col-sm-4 col-md-4">
                            <input type="radio" name="postGbn" id="postGbn1" value="도로명" checked>도로명
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <input type="radio" name="postGbn" id="postGbn2" value="지번">지번
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        주소(도로명)
                    </label>
                    <div class="col-sm-8 col-md-8">
                        <input name="custAddress" id="custAddress" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        주소(지번)
                    </label>
                    <div class="col-sm-8 col-md-8">
                        <input name="custAddressB" id="custAddressB" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        전화번호
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="telNo" id="telNo" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        이메일
                    </label>
                    <div class="col-sm-4 col-md-4">
                        <input name="eMail" id="eMail" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        팩스번호
                    </label>
                    <div class="col-sm-2 col-md-2">
                        <input name="faxNo" id="faxNo" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        홈페이지
                    </label>
                    <div class="col-sm-4 col-md-4">
                        <input name="homePage" id="homePage" type="text" value="" placeholder="" class="form-control input-xs">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                        거래여부
                    </label>
                    <div class="col-sm-3 col-md-3">
                        <div class="col-sm-4 col-md-4">
                            <input type="radio" name="useYn" id="useYnT" value="" checked>거래
                        </div>
                        <div class="col-sm-6 col-md-6">
                            <input type="radio" name="useYn" id="useYnF" value="">거래중지
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <label class="col-sm-2 col-md-2 control-label" for="textinput">
                        구분
                    </label>
                    <div class="col-sm-10 col-md-10">
                        <input type="checkbox" name="custKindA" value="1" checked>매출
                        <input type="checkbox" name="custKindB" value="1">매입
                        <input type="checkbox" name="custKindL" value="1">외주
                        <input type="checkbox" name="custKindH" value="1">금융
                        <input type="checkbox" name="custKindQ" value="1">품질
                        <input type="checkbox" name="custKindZ" value="1">총무
                        <input type="checkbox" name="custKindE" value="1">Buyer
                    </div>
                </div>
            </div>
            <input type="hidden"  name="cudKey" id="cudKey"/>
            <input type="hidden" id="" name="hpNo"/>
            <input type="hidden" id="" name="rmk"/>
        </form>
    </div>
    <div id="subGrid" style="width:800px;margin-left:200px;height:300px;"></div>
</div>