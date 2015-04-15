<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(3,[1,2,3,4,5,6],"1C"); //배합수량계산
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");      //10 col
	gridMain.setHeader("No,제품코드,제품명,제품재고,재공재고,적정재고,미출하수량,과부족수량,배합중량,생산예정수량", null, 
					["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",]);
	gridMain.attachFooter("합계,#cspan,#cspan,0,0,0,0,0,0,0", 
					["text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;","text-align:right;"]);
	
	gridMain.setInitWidths("50,100,150,100,100,100,100,100,100,100");       
	gridMain.setColAlign("center,left,left,right,right,right,right,right,right,right,");     
	gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ed,ro"); 
	gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str");
	gridMain.init();
	
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;

})

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
		id="frmSearch">
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
						<div class="col-xs-4 col-sm-4 col-md-4">
						  <input type="radio"
							name="productStringGbn" value="1" checked="checked">1군
						</div>
						<div class="col-xs-4 col-sm-4 col-md-4">
						  <input type="radio"
							name="productStringGbn" value="2">2군
						</div>
						<div class="col-xs-4 col-sm-4 col-md-4">
						  <input type="radio"
							name="productStringGbn" value="3">3군
						</div>
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