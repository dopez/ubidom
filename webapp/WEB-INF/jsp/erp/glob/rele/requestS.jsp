<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,2,3,4,5,6],"1C");
	//출고의뢰등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	layout.cells("b").setHeight(160);
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,모재코드,품명,포장,단위,수량,단가,금액,납기일자,납품장소",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,right,right,right,center,left");
	gridMain.setColTypes("ron,ro,ro,ro,ro,edn,edn,ro,dhxCalendarA,ed");
	gridMain.setColSorting("int,str,str,str,str,int,int,int,date,str");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
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
			  일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                    <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
             </div>
		 </div>
	    </div>
      </div> 
	  <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 고객
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="custom" id="custom" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('고객','common/customPOP')">
			</div>
		  </div>
	  </div>
	</div> 
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 담당
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 유무상
			 </label>
			<div class="col-sm-3 col-md-3">
			 <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn" id="gubn" value="유상" checked="checked">유상
			  </div>
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn" id="gubn" value="무상">무상
			  </div>
		   </div>
		  </div>
	  </div>
	</div>  
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			 구분
			 </label>
			<div class="col-sm-3 col-md-3">
			 <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn1" id="gubn1" value="제품" checked="checked">제품
			  </div>
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn1" id="gubn1" value="원료">원료
			  </div>
		   </div>
		  </div>
	  </div>
	</div>         
  </form>
 </div> 
</div>