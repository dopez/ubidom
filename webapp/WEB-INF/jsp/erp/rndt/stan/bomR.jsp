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
	gridMain.addHeader({name:"개정번호",colId:"revNo",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"품목코드",colId:"itemCode",width:"150",align:"center",type:"ro"})
	gridMain.addHeader({name:"품명",colId:"itemName",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"규격",colId:"itemSpec",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"단위",colId:"itemUnit",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"수량",colId:"wet",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"Loss율",colId:"loss",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"공정",colId:"prog",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"승인일자",colId:"apprDate",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"종료일자",colId:"endDate",width:"100",align:"center",type:"ro"})
	gridMain.addHeader({name:"비고",colId:"rmk ",width:"100",align:"center",type:"ro"})
	gridMain.dxObj.setUserData("","@apprDate","format_date");
	gridMain.dxObj.setUserData("","@endDate","format_date");
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","revNo");
	gridMain.init();
	
	$("#itemCode, #btnSearch").click(function(e){
		if(e.target.id == "itemCode" || e.target.id == "btnSearch"){
			gfn_load_pop('w1','common/itemPOP',true,{"itemCode":$(this).val()});
		  }
	})
	fn_search();
})
function fn_search(){
		var obj = {};
		obj.itemCode = $("#itemCode").val();
		gfn_callAjaxForGrid(gridMain,obj,"selGridMain",subLayout.cells("a"),fn_test);
		byId("frmSearch").reset();
}
function fn_test(){
	//gridMain.dxObj.groupBy(1);
}
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
//print
function  fn_print(){
	gridMain.printView();
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
    }
	fn_search();
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
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 품목코드 </label>
                        <div class="col-sm-3 col-md-3">
                            <div class="col-sm-9 col-md-9">
                                <input name="itemName" id="itemName" type="hidden" value="" placeholder="" class="form-control input-xs">
                                <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-3 col-md-3">
                                <button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
