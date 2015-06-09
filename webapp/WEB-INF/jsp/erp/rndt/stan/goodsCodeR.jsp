<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
var gridMain, layout, toolbar, subLayout;
$(document).ready(function() {

            Ubi.setContainer(1, [1, 8, 9], "1C"); //제품코드조회

            layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();

            //form//
            layout.cells("b").attachObject("bootContainer2");

    		gridMain = new dxGrid(subLayout.cells("a"), false);
    		gridMain.addHeader({name:"구분",colId:"itemGubn",width:"100",align:"center",type:"ro"});
    		gridMain.addHeader({name:"대분류",colId:"itemKind1",width:"100",align:"center",type:"ro"});
    		gridMain.addHeader({name:"중분류",colId:"itemKind2",width:"100",align:"center",type:"ro"});
    		gridMain.addHeader({name:"소분류",colId:"itemKind3",width:"100",align:"center",type:"ro"});
    		gridMain.addHeader({name:"제품코드",colId:"itemCode",width:"150",align:"center",type:"ro"});
    		gridMain.addHeader({name:"제품명",colId:"itemName",width:"100",align:"left",type:"ro"});
    		gridMain.addHeader({name:"규격",colId:"itemSpec",width:"100",align:"center",type:"ro"});
    		gridMain.addHeader({name:"단위",colId:"itemUnit",width:"100",align:"center",type:"ro"});
    		gridMain.addHeader({name:"포장단위",colId:"packUnit",width:"100",align:"right",type:"ro"});
    		gridMain.setColSort("str");	
    		gridMain.setUserData("","pk","pCode");
    		gridMain.init(); 
    		fn_search();
		})

function fn_search() {
    var obj = {};
    obj.pCode = $("#pCode").val();
    obj.pName = $("#pName").val();
    obj.pGubn = $("#pGubn").val();
    if (obj.pCode == "") {
        obj.pCode = "%";
    }
    if (obj.pName == "") {
        obj.pName = "%";
    }
    gfn_callAjaxForGrid(gridMain, obj, "gridMainSel", subLayout.cells("a"));
}

function fn_excel() {
    gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
};
//print
function fn_print() {
    gridMain.printView();
}
      </script>
<div id="container" style="position: relative; width: 100%; height: 100%;">
</div>
<div id="bootContainer2">
    <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
        <div class="container">
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
                        <label class="col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs" id="pGubn">
                                <option value="%" selected="selected">전체</option>
                                <option value="1">제품</option>
                                <option value="2">상품</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>