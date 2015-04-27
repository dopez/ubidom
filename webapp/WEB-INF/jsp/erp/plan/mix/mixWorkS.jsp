<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(3,[2,3,4,5,6],"2E"); //배합작업등록
	
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");      //7 col
	gridMst.setHeader("No,제품코드,제품명,배합수량,배합중량,Batch,선택", null, 
					["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.attachFooter("합계,#cspan,#cspan,0,0,", 
					["text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;"]);
	
	gridMst.setInitWidths("50,100,150,100,100,100,50");       
	gridMst.setColAlign("center,left,left,right,right,right,center");     
	gridMst.setColTypes("ro,ro,ro,ed,ed,ed,ra"); 
	gridMst.setColSorting("str,str,str,str,str,str,str");
	gridMst.init();
	
	//down
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");      //6col
	gridDtl.setHeader("No,원료코드,원료명,단위소요량,배합수량,투입중량", null,
						["text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;"]);
	gridDtl.attachFooter("합계,#cspan,#cspan,#cspan,0,0",
			["text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;"]);
	gridDtl.setInitWidths("50,100,150,100,100,100");       
	gridDtl.setColAlign("center,left,left,right,right,right");     
	gridDtl.setColTypes("ro,ed,ed,ed,ed,ed"); 
	gridDtl.setColSorting("str,str,str,str,str,str");
	gridDtl.init();

	calMain = new dhtmlXCalendarObject([{
        input: "stDate",
        button: "calpicker1"
    }]);
    calMain.loadUserLanguage("ko");
    calMain.hideTime();
    var t = dateformat(new Date());
    byId("stDate").value = t;
    //항목삽입
    toolbar.attachEvent("onClick", function(id) {
        if (id == "btn2") {
            fn_insert();
        }

    });

    //edit cell
    gridDtl.attachEvent("onRowSelect", function(id, ind) {
        gridDtl.editCell();
    });
    gridMst.attachEvent("onRowSelect", function(id, ind) {
        gridMst.editCell();
    });
    
    gridMst.attachEvent("onCheck", doOnCheck);
    function doOnCheck(rowId, colId) {
        if (colId == 6) {
            gridDtl.addRow(gridDtl.getUID(), "TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST", 1);
        }
    }
})

function fn_insert() {
    gridMst.addRow(gridMst.getUID(), "TEST,TEST,TEST,TEST,TEST,TEST,", 1);

}

</script>
<style>

</style>
<div id="container"
	style="position: relative; width: 100%; height: 100%;">
	</div>
<div id="bootContainer2">
<div class="container">
	<form class="form-horizontal"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;"
		id="frmMain">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 일자 </label>
					<div class="col-sm-2 col-md-2">
						
							<div class="col-sm-10 col-md-10">
								<input name="stDate" id="stDate" type="text"
									value="" placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-2 col-md-2">
								<input type="button" id="calpicker1" class="calicon form-control">
							</div>
						
					</div>
					<div class="col-sm-1 col-md-1">
						<div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
						<input name="seqNo" id="seqNo" type="text"
									value="" placeholder="" class="form-control input-xs" disabled="disabled"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 등록자 </label>
					<div class="col-sm-2 col-md-2">
						<input name="regEmpName" id="regEmpName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 제품군 </label>
					<div class="col-sm-4 col-md-4">
					  <input type="radio"
						name="productStringGbn" value="1" checked="checked">1군
					  <input type="radio"
						name="productStringGbn" value="2">2군
					  <input type="radio"
						name="productStringGbn" value="3">3군
					</div>
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 제품군 </label>
					<div class="col-sm-2 col-md-2">
					<select class="form-control input-sm">
						<option>1군</option>
						<option>2군</option>
						<option>3군</option>
					</select>
					</div>
					</div>
			</div>
		</div>
	</form>
	</div>
</div>