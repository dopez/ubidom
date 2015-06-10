<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
        <script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst,gridDtl,subLayoutD,subTb,combo01;
var calMain;
var popParam;
var popFlag;
   $(document).ready(function() {

   	Ubi.setContainer(1, [1, 2, 3, 4], "3L"); //BOM등록

        layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout();

        //form//
        layout.cells("b").attachObject("bootContainer");

       //up
		subLayout.cells("a").setWidth("300");
		gridItem = new dxGrid(subLayout.cells("a"), false);
		gridItem.addHeader({name:"제품코드",colId:"pCode",width:"150",align:"center",type:"ro"});
		gridItem.addHeader({name:"제품명",colId:"pName",width:"147",align:"left",type:"ro"});
		gridItem.setColSort("str");	
		gridItem.setUserData("","pk","pCode");
		gridItem.init(); 
		gridItem.attachEvent("onRowSelect",fn_gridItemSelect);
		toolbar.attachEvent("onClick",toolbarOnClick);

		subLayoutA = subLayout.cells("b").attachLayout("2U");
		subLayout.cells("b").setHeight(210);
		subLayoutLeftGrid = subLayoutA.cells("a");
		subLayoutRightForm = subLayoutA.cells("b");

		subLayoutRightForm.hideHeader();
		subLayoutRightForm.attachObject("bootContainer2");
		
		subLayoutLeftGrid.setWidth(500);
		subLayoutLeftGrid.hideHeader();
		gridMst = new dxGrid(subLayoutLeftGrid, false);
		gridMst.addHeader({name:"개정번호",colId:"revNo",width:"100",align:"center",type:"ro"});
		gridMst.addHeader({name:"개정일자",colId:"revDate",width:"100",align:"center",type:"ro"});
		gridMst.addHeader({name:"사유",colId:"revCause",width:"297",align:"center",type:"ro"});
		gridMst.dxObj.setUserData("","@revDate","format_date");
		gridMst.setColSort("str");	
		gridMst.setUserData("","pk","revNo");
		gridMst.init(); 
		gridMst.attachEvent("onRowSelect",fn_gridMstSelect);

	   //down
	   
	   subLayout.cells("c").showHeader();
	   subLayout.cells("c").setText("BOM");
	   subLayout.cells("c").hideArrow();
	   var tbrlayout = subLayout.cells("c");
	   subTb = subToolbar("toolbar",tbrlayout,[3,4,5,6]);
	   subTb.attachEvent("onClick",subToolbarOnClick);
	   gridDtl = new dxGrid(subLayout.cells("c"), false);
	   gridDtl.addHeader({name:"개정번호",colId:"revNo",width:"100",align:"center",type:"ro"});
	   gridDtl.addHeader({name:"공정",colId:"progNaem",width:"100",align:"center",type:"combo"});
	   gridDtl.addHeader({name:"자재코드",colId:"matrCode",width:"100",align:"center",type:"ro"});
	   gridDtl.addHeader({name:"자재명",colId:"matrName",width:"100",align:"center",type:"ro"});
	   gridDtl.addHeader({name:"소요량",colId:"wet",width:"100",align:"right",type:"ed"});
	   gridDtl.addHeader({name:"Loss율",colId:"loss",width:"100",align:"right",type:"ed"});
	   gridDtl.setColSort("str");	
	   gridDtl.setUserData("","pk","revNo");
	   gridDtl.init();
	   /* gridDtl.dxObj.setNumberFormat("0,000.00",4,".",",");
	   gridDtl.dxObj.setNumberFormat("0,000.00",5,".",","); */
       gridDtl.cs_setColumnHidden(["compId","itemCode","rmk","prog"]);
       gridDtl.cs_setNumberFormat(["wet","loss"],"0,000.00");
       gridDtl.attachEvent("onRowSelect",fn_getMatrPop);

       $("#btnGjCh").on("click",function(){
    	   fn_btnClick();
       })
       $("#empName").on("click",function(){
			popFlag = 1;
			gfn_load_pop('w1','common/empPOP',true,{"empName":$(this).val()});
       })
       $("#appvEmpName").on("click",function(){
			popFlag = 2;
			gfn_load_pop('w1','common/empPOP',true,{"appvEmpName":$(this).val()});
       })
       /*팝업*/
/*     	$("#empName, #appvEmpName","#btnGjCh").click(function(e){
			if(e.target.id == "empName"){
				popParam = e;
				popFlag = 1;
				gfn_load_pop('w1','common/empPOP',true,{"empName":$(this).val()});
			  }
			if(e.target.id == "appvEmpName"){
				popParam = e;
				popFlag = 2;
				gfn_load_pop('w1','common/empPOP',true,{"appvEmpName":$(this).val()});
			  }
 			if(e.target.id == "btnGjCh"){
				alert("hi");
				fn_btnClick();
			}
	    }) */
	    /*콤보*/
	    var combo01 = gridDtl.getColumnCombo(1);
		fn_comboLoad(combo01,gridDtl.getColumnId(2),"J03",1);
		combo01.attachEvent("onClose",function(){
               var selIdx = gridDtl.getSelectedRowIndex()
			   var progColIdx = gridDtl.getColIndexById('prog');
			   var interCd = combo01.getSelectedText().interCode;
			   gridDtl.setCells2(selIdx,progColIdx).setValue(interCd);
		});
	   //set date//
	   calMain = new dhtmlXCalendarObject([{input: "gjDate",button: "calpicker1"},{input: "appvlDate",button: "calpicker2"}, {input: "edDate",button: "calpicker3"}]);
	   calMain.loadUserLanguage("ko");
	   calMain.hideTime();
	   fn_setDate();
	   
	   fn_setDblMask();
	   fn_loadGridItem();
})
/*개정변경 버튼 동작*/
function fn_btnClick(){
	   var params = {};
	   params.itemCode = $("#itemCode").val();
	   params.revNo = $("#gjCode").val();
	   $.ajax({
			type:'POST',
			url:"/erp/rndt/stan/bomS/prcsBomCopy",
			data:params,
			success:function(data){
				dhtmlx.alert("복사완료");
				fn_setNew();
				fn_frmMainSaveCallBck();
		    }
		});
}
/*자재코드 팝업*/
function fn_getMatrPop(rid,colIdx){
   	  var param = ""
      if (colIdx == 2) {
           gfn_load_pop('w1', 'common/matrCodePOP', true, {"matrCode": param});
      }
}
/*아래그리드 한줄삽입 시*/
function fn_setBomEle(){
  	var totalRowNum = gridDtl.getRowsNum();
    var totalColNum = gridDtl.getColumnCount();
    var data = new Array(totalColNum);
    
    var revNoColIdx = gridDtl.getColIndexById('revNo');
    var itemCodeColIdx = gridDtl.getColIndexById('itemCode');
    data[revNoColIdx] = $("#gjCode").val();
    data[itemCodeColIdx] = $("#itemCode").val();
    
    gridDtl.addRow(data);
    gridDtl.selectRow(totalRowNum);
   }
function fn_setDate(){
	   var t = dateformat(new Date());
	   byId("gjDate").value = t;
   }
function toolbarOnClick(id){
   if(id == "btn1"){//조회
	   gridMst.clearAll();
	   fn_setNew();
	   fn_loadGridItem();
	}
   if(id == "btn2"){//신규
	   fn_setNew();
	}
   if(id == "btn3"){//저장
	   fn_frmMainSave();
	}
   if(id == "btn4"){//삭제
	    var rodid = gridMst.getSelectedRowId();
	    if(rodid == "" || rodid ==null){
	    	dhtmlx.alert("삭제할 행을 선택하세요");
	    	return;
	    }else{
	    	fn_Delete();
	    	gridMst.cs_deleteRow(rodid);
	    	fn_setDefVal();
	    	fn_callAjaxFrmMain();
	    	gridDtl.clearAll();
	    }
	    byId("frmMain").reset();
		fn_Insert();
		fn_setDate();
	}
}
function fn_setNew(){
	gridDtl.clearAll();
    byId("frmMain").reset();
	fn_Insert();
	fn_setDate();
}
function subToolbarOnClick(id){
   if(id == "btn3"){//저장
	   fn_saveGridDtl();
	}
   if(id == "btn4"){//삭제
	   fn_removeGridDtl();
	}
   if(id == "btn5"){//한줄삽입
	   fn_addGridDtl();
	}
   if(id == "btn6"){//한줄삭제
	   fn_deleteGridDtl();
	}
}
/*아래 그리드 저장*/
function fn_saveGridDtl(){
	var jsonStr = gridDtl.getJsonUpdated2();
    $("#jsonData").val(jsonStr);
    var frmParam = $("#frmServer").serialize();
    if (jsonStr == null || jsonStr.length <= 0) return;
     $.ajax({
        url: "/erp/rndt/stan/bomS/prcsGridDtl",
        type: "POST",
        data: frmParam,
        async: true,
        success: function(data) {
            fn_gridDtlSaveCallbckFunc();
			MsgManager.alertMsg("INF001"); 
        }
    });
}
/*아래 그리드 저장 콜백*/
function fn_gridDtlSaveCallbckFunc(){
	obj= {};
	obj.itemCode = $("#itemCode").val();
	obj.revNo = gridDtl.setCells2(0,0).getValue();
	fn_loadGridDtl(obj);
}
/*아래그리드 한줄 삽입*/
function fn_addGridDtl(){
	if($("#gjCode").val()==""){
		   dhtmlx.alert("개정번호를 선택하세요");
	}else{
	   	fn_setBomEle();
	}	
}
/*아래 그리드 한줄 삭제*/
function fn_deleteGridDtl(){
    var selectedId = gridDtl.getSelectedRowId();
	if(selectedId == "" || selectedId == null){
		dhtmlx.alert("삭제할 행을 선택하세요");	
	}else{
   		gridDtl.cs_deleteRow(selectedId);
	}	
}
/*아래 그리드 전체삭제*/
function fn_removeGridDtl(){
    var selectedId = gridDtl.getSelectedRowId();
  	var totalRowNum = gridDtl.getRowsNum();
    for(var i=1; i<=totalRowNum; i++){
		 gridDtl.cs_deleteRow(i);
	}
}
/*right form 저장*/
function fn_frmMainSave(){
	if($("#itemCode").val() == ""){
		dhtmlx.alert("제품코드를 선택해주세요")
		return;
	}
	fn_setDefVal();
	 f_dxRules = {
			 	gjCode : ["개정번호",r_notEmpty],
			 	empName : ["작성자",r_notEmpty],
			 	appvEmpName : ["승인자",r_notEmpty]
			  };
	 fn_callAjaxFrmMain();
}
function fn_callAjaxFrmMain(){
	if(gfn_formValidation('frmMain')){
		var params = gfn_getFormElemntsData('frmMain');
		  $.ajax({
			type:'POST',
			url:"/erp/rndt/stan/bomS/prcsFrmMainSave",
			data:params,
			success:function(data){
				MsgManager.alertMsg("INF001"); 
				fn_frmMainSaveCallBck();
				if($("#cudKey").val()=='DELETE'){
					fn_Insert();
				}else{
					fn_Update();
				}
				fn_setDateKeyUp();
		    }
		});
   }
}
/*폼 저장 후 콜백 (왼쪽 그리드 조회 함)*/
function fn_frmMainSaveCallBck(){
	obj={};
	obj.itemCode = $("#itemCode").val();
	fn_loadGridMst(obj);
}
/*gridMst 선택 시 우측폼, 아래 그리드 조회*/
function fn_gridMstSelect(id,ind){
	if($("#itemCode").val() == "" || $("#itemCode").val()==null){
		dhtmlx.alert("제품코드를 선택해주세요")
		return;
	}
	  $("input[name=btnGjCh]").attr("disabled",false);
	var obj = {};
	obj.revNo = gridMst.setCells(id,0).getValue();
	obj.itemCode = $("#itemCode").val();
	fn_loadFrmMain(obj);
	fn_Update();
	fn_loadGridDtl(obj);
}
/*아래 그리드 조회*/
function fn_loadGridDtl(obj){
    gfn_callAjaxForGrid(gridDtl,obj,"gridDtlSel",subLayout.cells("c"));
}
/*폼 조회*/
function fn_loadFrmMain(obj){
	gfn_callAjaxForForm("frmMain",obj,"frmMain",fn_loadFrmMainCB);
}
/*폼 콜백*/
function fn_loadFrmMainCB(data){
	
}
/*gridItem 선택 시*/
function fn_gridItemSelect(id, ind){
	var v = gridItem.setCells(id,0).getValue();
	var obj={};
	obj.itemCode= gridItem.setCells(id,0).getValue();
	console.log(v);
	byId("itemCode").value = v;
	$("#itemCode").val(v);
	$("input[name=itemCode]").val(v);
	fn_disInput();
    $("input[name=btnGjCh]").attr("disabled",true);
	fn_setNew();
	fn_loadGridMst(obj);	
}
/*gridMst 조회*/
function fn_loadGridMst(obj){
    gfn_callAjaxForGrid(gridMst,obj,"gridMstSel",subLayoutLeftGrid,fn_loadGridMstCallBck);
}
/*gridMst 조회 콜백*/
function fn_loadGridMstCallBck(data){
	//console.log("data = ",data[0]);
	fn_setDateKeyUp();
}
/*제품 그리드 조회*/
function fn_loadGridItem(){
	fn_Insert();
	if($("#pCode").val() == ""){
		$("#pCode").val("%");
	}
	if($("#pName").val() == ""){
		$("#pName").val("%");
	}
	var obj= gfn_getFormElemntsData('frmSearch');
    gfn_callAjaxForGrid(gridItem,obj,"gridItemSel",subLayout.cells("a"), fn_gridItemCB);
    byId("frmSearch").reset();
}
/*제품 그리드 조회 콜백*/
function fn_gridItemCB(data){
	var obj = {}
	obj.itemCode = data[0].pCode;
	//$("#itemCode").val(data[0].pCode);
	fn_disInput("disable");
	fn_loadGridMst(obj)
}
/*제품코드 선택전 폼은 disabled*/
function fn_disInput(flag){
	if(flag == "disable"){
	  $("input[name=gjCode]").attr("disabled",true);
	  $("input[name=gjDate]").attr("disabled",true);
	  $("input[name=empName]").attr("disabled",true);
	  $("input[name=gjCause]").attr("disabled",true);
	  $("input[name=appvEmpName]").attr("disabled",true);
	  $("input[name=appvlDate]").attr("disabled",true);
	  $("input[name=btnGjCh]").attr("disabled",true);
	  $("input[name=rpWeight]").attr("disabled",true);
	  $("input[name=adjQty]").attr("disabled",true);
	  $("input[name=edDate]").attr("disabled",true);
	}else{
		$("input[name=gjCode]").attr("disabled",false);
		  $("input[name=gjDate]").attr("disabled",false);
		  $("input[name=empName]").attr("disabled",false);
		  $("input[name=gjCause]").attr("disabled",false);
		  $("input[name=appvEmpName]").attr("disabled",false);
		  $("input[name=appvlDate]").attr("disabled",false);
		  $("input[name=rpWeight]").attr("disabled",false);
		  $("input[name=adjQty]").attr("disabled",false);
		  $("input[name=edDate]").attr("disabled",false);
	}
}
/*팝업 닫을 때 */
function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if (pName == "matrCode") {
        for (i = 0; i < data.length; i++) {
            obj.matrCode = data[i].matrCode;
            obj.matrName = data[i].matrName;
            var selRowIdx = gridDtl.getSelectedRowIndex();
            var matrCodeIdx = gridDtl.getColIndexById('matrCode');
            var matrNameIdx = gridDtl.getColIndexById('matrName');
            gridDtl.setCells2(selRowIdx, matrCodeIdx).setValue(obj.matrCode);
            gridDtl.setCells2(selRowIdx, matrNameIdx).setValue(obj.matrName);
        }
    }
	
	if (pName=="empNo"&& popFlag == 1) {
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            $('#empName').val(obj.korName);
            $('#empNo').val(obj.empNo);
        }
    }
	if (pName=="empNo"&& popFlag == 2) {
        for (i = 0; i < data.length; i++) {
            obj.korName = data[i].korName;
            obj.empNo = data[i].empNo;
            $('#appvEmpName').val(obj.korName);
            $('#appvEmpNo').val(obj.empNo);
        }
    }
 };
/*숫자 인풋 마스킹*/
function fn_setDblMask(){
	$('.double').mask('000,000.00', {reverse: true,placeholder: "0.00"});
}
/*실수로 파싱*/
function fn_setDefVal(){
	if($("#rpWeight").val() == ""){
		$("#rpWeight").val(parseFloat(0));
	}else{
		$("#rpWeight").val(parseFloat($("#rpWeight").val()));
	}
	if($("#adjQty").val() == ""){
		$("#adjQty").val(parseFloat(0));
	}else{
		$("#adjQty").val(parseFloat($("#adjQty").val()));
	}
}
function fn_Insert(){
	byId("cudKey").value = "INSERT";
}
function fn_Update(){
	byId("cudKey").value = "UPDATE";
}
function fn_Delete(){
	byId("cudKey").value = "DELETE";
}
/*데이트 키업*/
function fn_setDateKeyUp(){
	$("#gjDate").keyup();
	$("#appvlDate").keyup();
	$("#edDate").keyup();
}
/*콤보박스*/
function fn_comboLoad(comboId, inputName, params, colIndx) {
    comboId.setTemplate({
	    input: "#interCode#",
	    input: "#interName#",
	    columns: [
	       {header: "공정코드", width: 100,  option: "#interCode#"},
		   {header: "공정명",   width: 100,  option: "#interName#"}
	    ]
	});
    comboId.enableFilteringMode(true);
    comboId.enableAutocomplete(true);
    comboId.allowFreeText(true);
    var obj = {};
    obj.compId = '100';
    obj.code = params;
    doOnOpen(comboId, obj, colIndx);
}

function doOnOpen(comboId, params, colIndx) {
    $.ajax({
        "url": "/erp/cmm/InterCodeR",
        "type": "post",
        "data": params,
        "success": function(data) {
            var list = data;
            for (var i = 0; i < list.length; i++) {
   			 comboId.addOption([
   			   			  {value: list[i].interCode, text:
   			   			  {interCode: list[i].interCode,
   			   			   interName: list[i].interName}}   
   			   			   ]);
            }
        }
    });
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<form id="frmServer">
   <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="bootContainer">
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
<div id="bootContainer2">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
    <input type="hidden" id="cudKey" name="cudKey" />
	<!-- <input name="itemCode" id="itemCode" type="hidden"/> -->
	<input name="empNo" id="empNo" type="hidden"/>
	<input name="appvEmpNo" id="appvEmpNo" type="hidden"/>
	<input name="rmk" id="rmk" type="hidden"/>
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-md-8">
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 개정번호 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="gjCode" id="gjCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-offset-2 col-md-offset-2 col-sm-2 col-md-2">
                            <input name="btnGjCh" id="btnGjCh" type="button" value="개정복사" placeholder="" class="form-control btn btn-default btn-xs">
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 작성자 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
						<label class="col-sm-2 col-md-2 control-label" for="textinput"> 개정일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="gjDate" id="gjDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 개정사유 </label>
                        <div class="col-sm-6 col-md-6">
                            <input name="gjCause" id="gjCause" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 승인자 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="appvEmpName" id="appvEmpName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 승인일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="appvlDate" id="appvlDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker2" class="calicon form-control">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 기준중량 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="rpWeight" id="rpWeight" type="text" value="" placeholder="0.00" class="form-control input-xs double" style="text-align:right">
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 가감기준량 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="adjQty" id="adjQty" type="text" value="" placeholder="0.00" class="form-control input-xs double" style="text-align:right">
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 종료일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-10 col-md-10">
                                <input name="edDate" id="edDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker3" class="calicon form-control">
                            </div>
                        </div>
                        <div class="col-sm-2 col-md-2">
<input name="itemCode" id="itemCode" type="text"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>