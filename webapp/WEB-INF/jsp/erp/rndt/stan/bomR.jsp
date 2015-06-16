<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$( document ).ready(function() {
	
	Ubi.setContainer(1,[1,8,9],"1C"); //Bom정전개
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");

	//grid	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"제품코드",colId:"itemCode",width:"125",align:"center",type:"ro"})
	gridMain.addHeader({name:"품명",colId:"itemName",width:"100",align:"left",type:"ro"})
	gridMain.addHeader({name:"규격",colId:"itemSpec",width:"100",align:"left",type:"ro"})
	gridMain.addHeader({name:"단위",colId:"itemUnit",width:"70",align:"center",type:"ro"})
	gridMain.addHeader({name:"개정번호",colId:"revNo",width:"70",align:"center",type:"ro"})
	gridMain.addHeader({name:"개정일자",colId:"revDate",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"개정사유",colId:"revCause",width:"200",align:"left",type:"ro"})
	gridMain.addHeader({name:"기준중량",colId:"rpWeight",width:"100",align:"right",type:"ron"})
	gridMain.addHeader({name:"가감기준량",colId:"adjQty",width:"100",align:"right",type:"ron"})
	gridMain.addHeader({name:"자재코드",colId:"matrCode",width:"120",align:"center",type:"ro"})
	gridMain.addHeader({name:"자재명",colId:"matrName",width:"100",align:"left",type:"ro"})
	gridMain.addHeader({name:"공정",colId:"prog",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"소요량",colId:"wet",width:"100",align:"right",type:"ron"})
	gridMain.addHeader({name:"Loss율",colId:"loss",width:"100",align:"right",type:"ron"})
	gridMain.addHeader({name:"승인일자",colId:"apprDate",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"종료일자",colId:"endDate",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"비고",colId:"rmk ",width:"100",align:"center",type:"ro"})
	gridMain.dxObj.setUserData("","@revDate","format_date");
	gridMain.dxObj.setUserData("","@apprDate","format_date");
	gridMain.dxObj.setUserData("","@endDate","format_date");
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","revNo");
	gridMain.init();
	gridMain.cs_setNumberFormat(["rpWeight","adjQty","wet","loss"],"0,000.00");
    gridMain.enableSmartRendering(false);

	$("#itemName").click(function(){
			gfn_load_pop('w1','common/itemPOP',true,{"itemName":$(this).val()});
	})
	//fn_search();
})
function fn_search(){
		if($("#itemName").val()=="" || $("#itemName").val()==null){
			dhtmlx.alert("제품명을 입력해주세요");
		}else{
		var obj = {};
		obj.itemCode = $("#itemCode").val();
		obj.itemName = $("#itemName").val();
		obj.revNo = $("#revNo").val();
		gfn_callAjaxForGrid(gridMain,obj,"selGridMain",subLayout.cells("a"),fn_test);
		}
}
function fn_test(data){
	gridMain.dxObj.groupBy(1,["#title","#cspan","#cspan"]);
}
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
//print
function  fn_print(){
	gridMain.cs_printView("BOM");
 }
function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if (pName == "itemCode") {
        for (i = 0; i < data.length; i++) {
            obj.itemCode = data[i].itemCode;
            obj.itemName = data[i].itemName;
            $("#itemCode").val(obj.itemCode);
           	$("#itemName").val(obj.itemName);
        }
	fn_search();
    }
};
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="bootContainer2">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
        <div class="container">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제품명 </label>
                        <div class="col-sm-2 col-md-2">
                           <input name="itemName" id="itemName" type="text" value="" placeholder="" class="form-control input-xs">
                           <input name="itemCode" id="itemCode" type="hidden" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 개정번호 </label>
                        <div class="col-sm-1 col-md-1">
                        	<input name="revNo" id="revNo" type="text" value="" placeholder="0000" class="form-control input-xs" style="text-align: right">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
