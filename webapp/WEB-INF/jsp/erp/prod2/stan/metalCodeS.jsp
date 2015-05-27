<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4],"2U");
	//모재코드등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("모재코드,모재명",null,
			         ["text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();	
	subLayout.cells("a").setWidth(203);
	
	subLayout.cells("b").attachObject("bootContainer2");
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"stDate2",button:"calpicker2"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("stDate2").value = t;
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
		    모재코드
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="equiCode" id="equiCode" value="" placeholder="" class="form-control input-xs">
			</div>
           <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
		    모재명
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="equiName" id="equiName" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	    </div>
      </div>     
  </form>
</div>
<div id="bootContainer2" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">         
      <div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 모재코드
		    </label>
			<div class="col-sm-1 col-md-1">
			  <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	      <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 구분
		    </label>
			<div class="col-sm-1 col-md-1">
			  <select name="gubn" id="gubn" class="form-control input-xs">
			    <option value="1">자재</option>
			  </select>
			</div>
	   </div>
     <div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 모재명
		    </label>
			<div class="col-sm-4 col-md-4">
			  <input name="equiName" id="equiName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
    <div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 규격
		    </label>
			<div class="col-sm-4 col-md-4">
			  <input name="guguc" id="guguc" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
	<div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 단위
		    </label>
			<div class="col-sm-2 col-md-2">
			  <input name="dan" id="dan" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
	<div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 재질
		    </label>
			<div class="col-sm-2 col-md-2">
			  <input name="matr" id="matr" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
	<div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 공급업체
		    </label>
			<div class="col-sm-2 col-md-2">
			  <input name="supplyComp" id="supplyComp" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
	    </div>
	</div>
	<div class="row">
	     <div class="form-group form-group-sm">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 회계구분
		    </label>
			<div class="col-sm-1 col-md-1">
			  <select name="hgubn" id="hgubn" class="form-control input-xs">
			    <option value="1">원재료</option>
			  </select>
			</div>
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 사용구분
		    </label>
			<div class="col-sm-1 col-md-1">
			  <select name="hgubn" id="hgubn" class="form-control input-xs">
			    <option value="1">사용</option>
			    <option value="2">미사용</option>
			  </select>
			</div>
	    </div>
	</div>
	<div class="row">
		<div class="form-group form-group-sm">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  등록일자 
			</label>
			<div class="col-sm-1 col-md-1">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker1" class="calicon form-control">
                  </div>              
             </div>
             <label class="col-sm-2 col-md-2 control-label" for="textinput">
			  사용중지일자 
			</label>
			<div class="col-sm-1 col-md-1">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate2" id="stDate2" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker2" class="calicon form-control">
                  </div>              
             </div>
	     </div>
      </div>
  </form>
 </div> 
</div>