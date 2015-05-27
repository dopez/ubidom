<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,9],"1C");
	//출고의뢰조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	layout.cells("b").setHeight(160);
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,의뢰일자,담당,유무상,고객,구분,품목코드,품명,포장,단위,"+
			           "수량,단가,금액,납기일자,출하일자",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			               "100,100,100,100,100");
	gridMain.setColAlign("center,center,left,left,left,left,left,left,left,left,"+
			             "right,right,right,center,center");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ro,ro,"+
			             "ron,ron,ron,ro,ro");
	gridMain.setColSorting("int,date,str,str,str,str,str,str,str,str,"+
			               "int,int,int,date,date");
	gridMain.attachFooter(",소계,,,,,,,,,"+
			              ",,,,");
	gridMain.attachFooter(",합계,,,,,,,,,"+
			              ",,,,");
	gridMain.init();		

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">  
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				 기간 
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                          </div>
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
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn" id="gubn" value="전체">전체
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
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="gubn1" id="gubn1" value="전체">전체
			  </div>
		   </div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>