<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;     
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4],"2U"); 
	//Buyer등록 
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("코드,Buyer명",null,
			          ["text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();	
	subLayout.cells("a").setWidth(203);
	
	subLayout.cells("b").attachObject("bootContainer2");
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 Buyer코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="buyerCode" id="buyerCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 Buyer명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="buyerName" id="buyerName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>
	  </div>
	</div>         
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     Buyer코드
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="customCode" id="customCode" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     Buyer명
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="customName" id="customName" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	   </div>
	 </div>
	 <div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     국가
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <select id="country" name="country" class="form-control input-xs">
			    <option value="한국">한국</option>
			  </select>
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     주소
		   </label>
		   <div class="col-sm-6 col-md-6">
			  <input name="addrName" id="addrName" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     담당자
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     전화번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="phone" id="phone" type="email" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     팩스번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="fax" id="fax" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     이메일
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="email" id="email" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     홈페이지
		   </label>
		   <div class="col-sm-6 col-md-6">
			  <input name="fax" id="fax" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     계산서발행
		   </label>
		   <div class="col-sm-2 col-md-2">
			 <div class="col-sm-5 col-md-5">
			    <input type="radio" name="bill" id="bill" value="월합산" checked="checked">월합산
			  </div>
			  <div class="col-sm-5 col-md-5">
			    <input type="radio" name="bill" id="bill" value="건별">건별
			  </div>
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     사용유무
		   </label>
		   <div class="col-sm-2 col-md-2">
			 <div class="col-sm-5 col-md-5">
			    <input type="radio" name="use" id="use" value="사용"  checked="checked">사용
			  </div>
			  <div class="col-sm-5 col-md-5">
			    <input type="radio" name="use" id="use" value="중지">중지
			  </div>
		   </div>
	  </div>
	</div>
	<div class="row">
		<div class="form-group form-group-sm">
			<label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
			구분 
			</label>
			<div class="col-sm-10 col-md-10">
				<div class="col-sm-1 col-md-1">
					<input type="checkbox" name="empGbn_group1" value="1" checked="checked">매출
				</div>
				<div class="col-sm-1 col-md-1">
					  <input type="checkbox" name="empGbn_group1" value="2">매입
				</div>
				<div class="col-sm-1 col-md-1">
					<input type="checkbox" name="empGbn_group1" value="3">외주
				</div>
				<div class="col-sm-1 col-md-1">
					<input type="checkbox" name="empGbn_group1" value="4">금융
				</div>
				<div class="col-sm-1 col-md-1">
					<input type="checkbox" name="empGbn_group1" value="5">품질
				</div>
				<div class="col-sm-1 col-md-1">
					<input type="checkbox" name="empGbn_group1" value="6">총무
				</div>
				<div class="col-sm-2 col-md-2">
					<input type="checkbox" name="empGbn_group1" value="7">Buyer
				</div>
			</div>
		</div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     보안구분
		   </label>
		   <div class="col-sm-2 col-md-2">
			 <div class="col-sm-5 col-md-5">
			    <input type="radio" name="safeGubn" id="safeGubn" value="필요"  checked="checked">필요
			  </div>
			  <div class="col-sm-5 col-md-5">
			    <input type="radio" name="safeGubn" id="safeGubn" value="불필요">불필요
			  </div>
		   </div>
	  </div>
	</div>
  </form>
 </div> 
</div>