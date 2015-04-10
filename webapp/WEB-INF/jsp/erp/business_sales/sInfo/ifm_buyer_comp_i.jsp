<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var o; 
var gridMain;
$( document ).ready(function() {
	
	ubi.init(1,[1,2,3,4,5,6],"2U"); 
	o = ubi.getDataSet();
	//바이어등록
	
	o.layout.cells("b").attachObject("bootContainer");
	gridMain = o.slayout.cells("a").attachGrid(); 
	gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");      
	gridMain.setHeader("Buyer코드, Buyer명, 사업자번호", null, 
					["text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,");       
	gridMain.setColAlign("left,left,left");     
	gridMain.setColTypes("ro,ro,ro"); 
	gridMain.setColSorting("str,str,str");
	gridMain.init();   
	
	o.slayout.cells("a").setWidth("300");
	
	o.slayout.cells("b").attachObject("bootContainer2");
})
function fn_search(){
	
}
</script>
<style>
.forPadding{
	padding-left: 5px;
}
</style>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;"></div>
<div id="bootContainer" style="position: relative; width: 100%; height: 100%;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
					Buyer코드
					 </label>
					<div class="col-sm-2 col-md-2">
					    <input name="supplycomcode" id="supplycomcode" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
					Buyer명 
					</label>
					<div class="col-sm-4 col-md-4">
						<input name="supplycomname" id="supplycomname" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<div id="bootContainer2" style="position: relative; width: 100%; height: 100%; overflow: auto;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">
		<div class="row">
			<div class="form-group form-group-sm">
			    <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				  Buyer코드 
				</label>
				<div class="col-sm-2 col-md-2">
				    <input name="supplCompCode" id="supplCompCode" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				Buyer명 
				</label>
				<div class="col-sm-4 col-md-4">
					<input name="supplCompName" id="supplCompName" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				  국가 
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="nation" id="nation" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				주소
				</label>
				<div class="col-sm-8 col-md-8">
					<input name="addrNew" id="addrNew" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group form-group-sm">
			<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				담당자
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				전화번호 
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="phoneNo" id="phoneNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				팩스번호
				</label>
				<div class="col-sm-2 col-md-2">
					<input name="faxNo" id="faxNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput">
				 이메일
				 </label>
				<div class="col-sm-4 col-md-4">
					<input name="email" id="email" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				홈페이지
				</label>
				<div class="col-sm-8 col-md-8">
					<input name="homePage" id="homePage" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				 계산서 발행
				</label>
				<div class="col-sm-3 col-md-2">
					<div class="col-sm-6 col-md-6">
					  <input type="radio" name="dealGbn" id="dealGbn" value="거래">월합산
					</div>
				    <div class="col-sm-6 col-md-6">
					   <input type="radio" name="dealGbn" id="dealGbn" value="거래중지">건별
					</div>
				</div>
				<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				 사용유무
				</label>
				<div class="col-sm-3 col-md-2">
					<div class="col-sm-6 col-md-6">
					  <input type="radio" name="useGbn" id="dealGbn" value="거래">사용
					</div>
				    <div class="col-sm-6 col-md-6">
					   <input type="radio" name="useGbn" id="dealGbn" value="거래중지">중지
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
				<label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				구분 
				</label>
				<div class="col-sm-10 col-md-10">
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="1" checked="checked">Buyer
					</div>
					<div class="col-sm-1 col-md-1">
					    <input type="checkbox" name="empGbn_group1" value="2">매출
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="3">매입
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="4">외주
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="5">금융
					</div>
					<div class="col-sm-1 col-md-1">
						<input type="checkbox" name="empGbn_group1" value="6">품질
					</div>
					<div class="col-sm-2 col-md-2">
						<input type="checkbox" name="empGbn_group1" value="7">총무
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
