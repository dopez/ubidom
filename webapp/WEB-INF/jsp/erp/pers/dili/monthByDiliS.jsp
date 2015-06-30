<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;  
var calMain;
var combo;
var rowSelVal;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,4,6,8],"3E");
	//월근태
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = new dxGrid(subLayout.cells("a"),false);
    gridMst.addHeader({name:"NO",           colId:"no", 	    width:"50", align:"center", type:"cntr"});
    gridMst.addHeader({name:"부서",         colId:"postName", 	width:"80", align:"left",   type:"ro"});
    gridMst.addHeader({name:"직위",         colId:"jikweeName", width:"80", align:"left",   type:"ro"});
    gridMst.addHeader({name:"사번",         colId:"empNo", 	    width:"80", align:"left",   type:"ro"});
    gridMst.addHeader({name:"성명",         colId:"korName", 	width:"80", align:"left",   type:"ro"});
    gridMst.addHeader({name:"근무일수",     colId:"workDay", 	width:"70", align:"right",  type:"ro"});
    gridMst.addHeader({name:"근무시간",     colId:"workTime", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"연장시간",     colId:"overTime", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"야근시간",     colId:"nightTime", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"특근시간",     colId:"holiTime", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"특근연장",     colId:"holiOver", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"주휴일수",     colId:"weekHoliy", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"지각시간",     colId:"lateTime", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"조퇴시간",     colId:"earlyTime", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"외출시간",     colId:"partTime", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"결근",         colId:"absence", 	width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"무단결근",     colId:"awol", 	    width:"70", align:"right",  type:"edn"});
    gridMst.addHeader({name:"연차휴가",     colId:"yuncha", 	width:"70", align:"right",  type:"edn"});
    gridMst.setColSort("str");
 	gridMst.setUserData("","pk","no");
 	gridMst.init();	
 	gridMst.cs_setColumnHidden(["totalTime","compId"]);
 	gridMst.attachEvent("onRowSelect",doOnMstRowSelect);
 	
	subLayout.cells("b").attachObject("bootContainer2");
	subLayout.cells("b").setHeight(50);
	
	gridDtl = new dxGrid(subLayout.cells("c"),false);
	gridDtl.addHeader({name:"NO",       colId:"no", 	   width:"50", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"근무일자", colId:"workDate",  width:"80", align:"center", type:"ro"});
	gridDtl.addHeader({name:"근태구분", colId:"workKind",  width:"60", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"정상",     colId:"workTime",  width:"60", align:"right",  type:"edn"});
	gridDtl.addHeader({name:"연장",     colId:"overTime",  width:"60", align:"right",  type:"edn"});
	gridDtl.addHeader({name:"야근",     colId:"nightTime", width:"60", align:"right",  type:"edn"});
	gridDtl.addHeader({name:"외출",     colId:"partTime",  width:"60", align:"right",  type:"edn"});
	gridDtl.addHeader({name:"조퇴",     colId:"earlyTime", width:"60", align:"right",  type:"edn"});
	gridDtl.addHeader({name:"지각",     colId:"lateTime",  width:"60", align:"right",  type:"edn"});
	gridDtl.addHeader({name:"총근무",   colId:"totalTime", width:"60", align:"right",  type:"ro"});
	gridDtl.setColSort("str");
	gridDtl.setUserData("","pk","no");
	gridDtl.dxObj.setUserData("","@workDate","format_date");
	gridDtl.init();	
	gridDtl.cs_setColumnHidden(["compId","empNo"]);
	
	calMain = new dhtmlXCalendarObject([{input:"yymm",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y/%m");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("yymm").value = t+"/"+m;
	
	fn_search();
	
	$("#monthBtn,#diliSaveBtn").click(function(e){
		if(e.target.id == "monthBtn"){
			var obj={};
			obj.yymm = $('#yymm').val();
			 gfn_callAjaxForGrid(gridMst,obj,"gridPopSearch",subLayout.cells("a"),fn_loadGridMstPOPCB);
		}
		if(e.target.id == "diliSaveBtn"){
			fn_DtlSave();
		}
	});
	
	$("#postName,#korName").keyup(function(e) {
    	if(e.target.id == "postName"){
    		gridMst.filterBy(1,byId("postName").value);
		}
    	if(e.target.id == "korName"){
    		gridMst.filterBy(4,byId("korName").value);
		}
	 }); 
	
	
	combo =gridDtl.getColumnCombo(2);
	gfn_1col_comboLoad(combo,"P008");
});
function fn_loadGridMstPOPCB(data){
	var obj=gfn_getFormElemntsData("frmMain");
	console.log("2",data);
	if(data[0].cnt > 0){
		if(MsgManager.confirmMsg("INF005")) { 
			gfn_callAjaxForGrid(gridMst,obj,"gridPopSave",subLayout.cells("a"));
			fn_search();
		}
	}else{
		gfn_callAjaxForGrid(gridMst,obj,"gridPopSave",subLayout.cells("a"));
		fn_search();
	}
}

function doOnMstRowSelect(id,ind){
	var empIdx = gridMst.getColIndexById('empNo');
	var empNoVal = gridMst.setCells(id,empIdx).getValue();
	$('#empNo').val(empNoVal);
	var obj=gfn_getFormElemntsData("frmMain");
	fn_loadGridDtl(obj);
}
//doc ready end
function fn_search(){
	gridDtl.clearAll();
	fn_loadGridMst();
}
function fn_save(){
	var rowIdx = gridMst.getSelectedRowIndex();
	var colIdx = gridMst.getColIndexById('empNo');
	rowSelVal=gridMst.setCells2(rowIdx, colIdx).getValue();
	
	var dateValue = $('#yymm').val();
	$('#monthDate').val(dateValue);
	 var jsonStr = gridMst.getJsonUpdated2();
	   if (jsonStr == null || jsonStr.length <= 0) return;         		
	       $("#jsonData").val(jsonStr);                      
	       $.ajax({
	          url : "/erp/pers/dili/monthByDiliS/gridMstSave",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	          MsgManager.alertMsg("INF001");
	          fn_search();
	          rowSelVal = null;
	           }
	      });
};
function fn_DtlSave(){
	var rowIdx = gridDtl.getSelectedRowIndex();
	var colIdx = gridDtl.getColIndexById('empNo');
	rowSelVal=gridDtl.setCells2(rowIdx, colIdx).getValue();
	
	 var jsonStr = gridDtl.getJsonUpdated2();
	   if (jsonStr == null || jsonStr.length <= 0) return;         		
	       $("#jsonData").val(jsonStr);                      
	       $.ajax({
	          url : "/erp/pers/dili/dayByDiliS/gridMainSave",
	          type : "POST",
	          data : $("#pform").serialize(),
	          async : true,
	          success : function(data) {
	          MsgManager.alertMsg("INF001");
	          fn_search();
	          rowSelVal = null;
	           }
	      });
};
function fn_remove(){
	for(var i=0; i<gridMst.getRowsNum();i++){
		gridMst.cs_deleteRow(gridMst.getRowId(i));	 
	 }
}
function fn_delete(){
	  var rodid = gridMst.getSelectedRowId();
	  gridMst.cs_deleteRow(rodid);
}
function fn_excel(){
	gridMst.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
}
function fn_loadGridMst(){
	var obj=gfn_getFormElemntsData("frmMain");
    gfn_callAjaxForGrid(gridMst,obj,"gridMstSearch",subLayout.cells("a"),fn_loadGridMstCB);
}
function fn_loadGridMstCB(data){
	console.log(data);
	$('#yymm').keyup();
	var rowIdx = cs_selectRow_check(gridMst,"empNo",rowSelVal);
	gridMst.selectRow(rowIdx,true,true,true);

}

function fn_loadGridDtl(params){
	gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"),fn_loadGridDtlCB);
}
function fn_loadGridDtlCB(data){
	$('#yymm').keyup();
}

function fn_exit(){
	var exitVal = cs_close_event([gridMst,gridDtl]);
	if(exitVal){
		mainTabbar.tabs(ActTabId).close();	
	}else{
		if(MsgManager.confirmMsg("WRN012")){
			mainTabbar.tabs(ActTabId).close();	
		}else{
			return true;
		}
	} 
}
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
     <input type="hidden" id="monthDate" name="monthDate" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
    <div class="container">
        <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
           <input type="hidden" id="empNo" name="empNo">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                           	 년월
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="yymm" id="yymm" type="text" value="" class="form-control input-xs format_month">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker" class="calicon form-control">
                            </div>
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput">
                           	 직군
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <select name="jikgun" id="jikgun" class="form-control input-xs">
							   <option value="%" selected="selected">전체</option>
							   <option value="01">관리직</option>
							   <option value="02">생산직</option>
							   <option value="03">용역</option>
							   <option value="04">외국인</option>
							   <option value="05">기술직</option>
							   <option value="06">계약직</option>
                            </select>
                        </div>
                        <label class="col-sm-5 col-md-5" for="textinput" style="font-size: 11px;">
                            *월근태생성은 해당년월 및 사원별로 생성 할수있습니다.
                        </label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                          부서
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput">
                         	성명
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-2 col-md-2" style="margin-left: 5px;">
                            <input type="button" name="monthBtn" id="monthBtn" value="월근태생성" class="form-control btn btn-default btn-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="bootContainer2" style="position: relative;">
    <div class="container">
        <form class="form-horizontal" id="frmNote" name="frmNote" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-10 col-md-10">
                        <label class="col-sm-4 col-md-4" for="textinput">
                            *해당사원의 1개월치 일일근태입니다.
                        </label>
                        <label class="col-sm-5 col-md-5" for="textinput">
                            1. 해당항목 수정 후 반드시 데이터 값 확인후 저장하시기 바랍니다.
                            <br> 2. 일근태 저장 후 월근태를 재생성 하시기 바랍니다.
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input type="button" name="diliSaveBtn" id="diliSaveBtn" value="일근태저장" class="form-control btn btn-default btn-xs">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>