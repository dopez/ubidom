<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain,calMain,combo01,combo02;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"1C");
	//제품개선접수등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"),false);
	gridMain.addHeader({name:"No",colId:"rNum",width:"50",align:"center",type:"cntr"});
	gridMain.addHeader({name:"관리번호",colId:"reqDno",width:"100",align:"center",type:"ro"});
	gridMain.addHeader({name:"요청일자",colId:"setDate",width:"100",align:"center",type:"ro"});
	gridMain.addHeader({name:"고객",colId:"custKorName",width:"100",align:"left",type:"ro"});
	gridMain.addHeader({name:"요청자",colId:"reqEmpName",width:"100",align:"left",type:"ro"});
	gridMain.addHeader({name:"품목코드",colId:"itemCode",width:"120",align:"center",type:"ro"});
	gridMain.addHeader({name:"품명",colId:"itemName",width:"150",align:"left",type:"ro"});
	gridMain.addHeader({name:"사용설비",colId:"equiName",width:"150",align:"left",type:"ro"});
	gridMain.addHeader({name:"상태",colId:"stateName",width:"100",align:"center",type:"ro"});
	gridMain.addHeader({name:"담당자",colId:"inchEmpName",width:"100",align:"center",type:"ro"});
	gridMain.addHeader({name:"납기일자",colId:"deliDate",width:"100",align:"center",type:"ro"});
	gridMain.addHeader({name:"개선요청내용",colId:"reqConts",width:"300",align:"left",type:"ro"});
	gridMain.addHeader({name:"완료요청일자",colId:"endReqDate",width:"100",align:"center",type:"ro"});
	gridMain.dxObj.setUserData("","@endReqDate","format_date");
	gridMain.dxObj.setUserData("","@setDate","format_date");
	gridMain.dxObj.setUserData("","@deliDate","format_date");
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","setNo");
	gridMain.init();
    gridMain.cs_setColumnHidden(["setNo","custCode","setSeq","reqEmp","equiCode","inchEmp","state"]);
    gridMain.attachEvent("onRowDblClicked",doOnRowDbClicked);
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
	
    $("#reqEmpName,#custKorName").dblclick(function(e){
    	if(e.target.id == "reqEmpName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		}
    	if(e.target.id == "custKorName"){
    		gfn_load_pop('w1', 'common/customPOP', true,{"custKorName":$(this).val()});
		}
    })
    fn_search();
});
function fn_search(){
	/*조회*/
	fn_selGridMain();
}
function fn_selGridMain(){
	var obj = {}
	obj.stDate = searchDate($("#stDate").val());
	obj.edDate = searchDate($("#edDate").val());
	obj.custCode = $("#custCode").val();
	obj.reqEmp = $("#reqEmp").val();
    gfn_callAjaxForGrid(gridMain,obj,"selGridMain",subLayout.cells("a"));
}
function doOnRowDbClicked(rowId, colIdx){
	/*dbl click*/
	if(gridGetVal(rowId,gridMain,"state")=="20"){
		dhtmlx.alert("배정되어 있는 건은 수정 불가 합니다.");
		return;
	}else if(gridGetVal(rowId,gridMain,"state")=="30"){
		dhtmlx.alert("완료되어 있는 건은 수정 불가 합니다.");
		return;
	}else{
	var obj = {};
		obj.setDate = searchDate(gridGetVal(rowId,gridMain,"setDate"));
		obj.setSeq = gridGetVal(rowId,gridMain,"setSeq");
		obj.setNo = gridGetVal(rowId,gridMain,"setNo");
		obj.empNo = gridGetVal(rowId,gridMain,"reqEmp");
		obj.empName = gridGetVal(rowId,gridMain,"reqEmpName");
		gfn_moveMenu("1000001161", obj);
	}

}
function fn_onClosePop(pName, data) {
    if (pName == "empNo") {
         $('#reqEmpName').val(data[0].korName);
         $('#reqEmp').val(data[0].empNo);
    }
    if (pName == "custCode") {
    	$('#custKorName').val(data[0].custKorName);
        $('#custCode').val(data[0].custCode);
    }
}
</script>
<script type="text/javascript" src="/script/erp/rndt/impReqS/impReqSGridFn.js"></script>

<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<form class="form-horizontal"  id="frmJson">
<input type="hidden" id="jsonData" name="jsonData">
</form>
<div id="bootContainer" style="position: relative;">
    <div class="container">
        <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
            <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    접수일자 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs format_date" name="stDate" id="stDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                           <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                        </div>
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                    <div class="col-sm-4 col-md-4">
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
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            	고객
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="custKorName" id="custKorName" type="text" value="" placeholder="" class="form-control input-xs">
                            <input name="custCode" id="custCode" type="hidden" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            	요청자
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="reqEmpName" id="reqEmpName" type="text" value="" placeholder="" class="form-control input-xs">
                            <input name="reqEmp" id="reqEmp" type="hidden" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>