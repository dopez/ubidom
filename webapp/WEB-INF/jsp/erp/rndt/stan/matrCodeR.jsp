<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function() {
	
	Ubi.setContainer(1, [1,8,9], "1C"); 

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

    //form//
    layout.cells("b").attachObject("bootContainer");
    
    //grid
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"자재구분",colId:"matrGubn",width:"100",align:"center",type:"ron"});
	gridMain.addHeader({name:"자재코드",colId:"matrCode",width:"100",align:"center",type:"ro"});
	gridMain.addHeader({name:"자재명",colId:"matrName",width:"150",align:"center",type:"ro"});
	gridMain.addHeader({name:"자재규격",colId:"matrSpec",width:"100",align:"center",type:"ro"});
    gridMain.addHeader({name:"포장단위",	colId:"packUnit", width:"100", align:"right", type:"ron"});
    gridMain.addHeader({name:"발주단위",	colId:"morderUnit", width:"100", align:"right", type:"ron"});
    gridMain.addHeader({name:"입고단위",	colId:"inputUnit", width:"100", align:"right", type:"ron"});
    gridMain.setColSort("str");
    gridMain.setUserData("","pk","matrCode");
    gridMain.init();
    fn_loadGridMain();

})
function fn_search(){
	fn_loadGridMain();
}
function fn_loadGridMain(flag){
	var inputParams={}
	inputParams.matrCode = $("#mCode").val();
	inputParams.matrName = $("#mName").val();
	inputParams.matrGubn = $("#matrGubn").val();
	if(inputParams.matrName==null ||inputParams.matrName==""){
		inputParams.matrName = "%";
	}
	if(inputParams.matrCode==null ||inputParams.matrCode==""){
		inputParams.matrCode = "%";
	}
	gfn_callAjaxForGrid(gridMain,inputParams,"gridMainSearch",subLayout.cells("a"),fn_LoadGridMainCallback);
}
function fn_LoadGridMainCallback(data){
    var totalRowNum = gridMain.getRowsNum();
	 for(var i=0;i<totalRowNum;i++){
		if(gridMain.setCells2(i,0).getValue()==1){
			gridMain.setCells2(i,0).setValue("자재");
		}
	 }
}
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
}
function fn_print(){
	gridMain.printView("<div style='font-size:20px;text-align:center; margin-bottom:20px;'>자재 코드 목록</div>");
}

</script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="bootContainer">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
        <div class="container">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 자재코드 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="mCode" id="mCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 자재명 </label>
                        <div class="col-sm-3 col-md-3">
                            <input name="mName" id="mName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select id="matrGubn" name="matrGubn" class="form-control input-xs">
	                            <option value="%" selected="selected">전체</option>
	                            <option value="1">자재</option>
                       		</select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>