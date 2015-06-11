<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout
var gridMain;
$( document ).ready(function() {

	Ubi.setContainer(2,[1,8,9],"1C"); //매출단가조회

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

	layout.cells("b").attachObject("bootContainer");

	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"고객코드", colId:"custCode", width:"80", align:"left", type:"ro"});
	gridMain.addHeader({name:"고객명", 	colId:"custName", width:"80", align:"left", type:"ro"});
	gridMain.addHeader({name:"품목코드", 	colId:"itemCode", width:"80", align:"left", type:"ro"});
	gridMain.addHeader({name:"품명", 	colId:"itemName", width:"80", align:"left", type:"ro"});
	gridMain.addHeader({name:"규격", 	colId:"itemSpec", width:"80", align:"left", type:"ro"});
	gridMain.addHeader({name:"단위", 	colId:"", width:"80", align:"center", type:"ro"});
	gridMain.addHeader({name:"통화단위", 	colId:"mnyEa", width:"80", align:"center", type:"ro"});
	gridMain.addHeader({name:"단가", 	colId:"prc", width:"80", align:"right", type:"ron"});
	gridMain.addHeader({name:"적용일자", 	colId:"pstDate", width:"80", align:"center", type:"ro"});
	gridMain.setUserData("","pk","itemCode");
	gridMain.setColSort("str");
	gridMain.init();
});
function fn_search(){
	function fn_search(){
		$("input[name='itemName'], #frmSearch ").val($.trim($("input[name='itemName2'], #frmSearch ").val()+"%"));
		$("input[name='CustCode'], #frmSearch ").val($.trim($("input[name='CustCode2'], #frmSearch ").val()+"%"));
		gfn_callAjaxForGrid(gridMain,$("#frmSearch").serialize(),"searchA",subLayout.cells("a"));
		gridMain.dxObj.selectRow(0,true,true,true);
	}
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" >
<div class="container">
        <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            구분
                        </label>
                        <div class="col-sm-3 col-md-3">
                            <div class="col-sm-6 col-md-6">
                                <input type="radio" name="itemDiv" id="itemDiv1" value="M" checked>제상품
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <input type="radio" name="itemDiv" id="itemDiv2" value="P">자제
                            </div>
                        </div>
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            구분
                        </label>
                        <div class="col-sm-3 col-md-3">
                            <div class="col-sm-6 col-md-6">
                                <input type="radio" name="ioChk" id="ioChk1" value="1" checked="checked">매입</div>
                            <div class="col-sm-6 0col-md-6">
                                <input type="radio" name="ioChk" id="ioChk2" value="2">매출
                            </div>
                        </div>
                	</div>
            	</div>
            </div>
            <div class="row">
                <div class="form-group form-group-sm">
                    <div class="col-sm-8 col-md-8">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                           고객명
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-12 col-md-12">
                                <input name="custName2" type="text" value="" placeholder="" class="form-control input-xs">
                                <input type="hidden" name="custName">
                            </div>
                        </div>
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            품목명
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-12 col-md-12">
                                <input name="itemName2" type="text" value="" placeholder="" class="form-control input-xs">
                                <input type="hidden" name="itemName">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
	</div>
</div>