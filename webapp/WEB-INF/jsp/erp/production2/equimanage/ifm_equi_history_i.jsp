<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.calicon{
width: 27px;
height: 27px;
margin-top : 1px;
}
</style>
<script type="text/javascript">
var o;
var gridMain;
var calMain;
$(document).ready(function(){
	ubi.init(1,[1,2,3,4,5,6],"2U");
	o = ubi.getDataSet(); 
	//설비이력등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,설비코드,설비명,사용공정",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100");
	gridMain.setColAlign("center,left,left,left");
	gridMain.setColTypes("ron,ro,ro,ro");
	gridMain.setColSorting("int,str,str,str");
	gridMain.init();	
	
	o.slayout.cells("a").setWidth(400);
	
	o.slayout.cells("b").attachObject("bootContainer2");
	
	calMain = new dhtmlXCalendarObject([{input:"buyDate",button:"calpicker1"},{input:"regDate",button:"calpicker2"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	    var t = dateformat(new Date());
		byId("buyDate").value = t;
		byId("regDate").value = t;

});
function fn_new(){
	
}
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-7 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 설비코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="code" id="code" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 거래처
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="customer" id="customer" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
		  <div class="col-sm-5 col-md-5">
		     <div class="col-sm-6 col-md-6 col-sm-offset-4 col-md-offset-6">
		    <button type="button"  class="btn btn-default form-control" name="btnImage" id="btnImage">설비 이미지정보
		    </button>
		    </div>
		  </div>
	  </div>
	</div>
  </form>
</div>
<div id="bootContainer2" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" enctype="multipart/form-data" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     설비코드
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     설비명
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="equiName" id="equiName" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>

<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     규격
		   </label>
		   <div class="col-sm-6 col-md-6">
			  <input name="standard" id="standard" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     이미지첨부
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="imageFile" id="imageFile" type="file" value="" placeholder="" >
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     전화번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="phone" id="phone" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     용량
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="capacity" id="capacity" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     HP번호
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="handPhone" id="handPhone" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     구입금액
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="buyMoney" id="buyMoney" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     담당자
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     사용공정
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="useProcess" id="useProcess" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     구입일자
		   </label>
		    <div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="buyDate" id="buyDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                       <span>
						 <img id="calpicker1" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
					   </span>
                  </div>              
             </div> 
	   </div>
	</div>
	
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     공급업체
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="supplyCom" id="supplyCom" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     등록일자
		   </label>
		   <div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="regDate" id="regDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                       <span>
						 <img id="calpicker2" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
					   </span>
                  </div>              
             </div> 
	  </div>
	</div>
	
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     제작업체
		   </label>
		   <div class="col-sm-2 col-md-2">
			  <input name="makeCom" id="makeCom" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     사용유무
		   </label>
		   <div class="col-sm-2 col-md-2">
		      <select name="useCheck" id="useCheck" class="form-control input-xs">
		        <option value="Y">Y</option>
		        <option value="N">N</option>
		      </select>
		   </div>
	  </div>
	</div>
	
	<div class="row">
	   <div class="form-group form-group-sm">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		     사용중지사유
		   </label>
		   <div class="col-sm-6 col-md-6">
			  <input name="useStop" id="useStop" type="text" value="" placeholder="" class="form-control input-xs">
		   </div>
	  </div>
	</div>
	
  </form>
</div>