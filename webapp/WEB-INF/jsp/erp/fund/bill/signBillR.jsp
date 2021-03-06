<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,10],"1C");
	//수탁어음현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,어음번호,수금번호,어음종류,발행일,금액,발행은행,발행인,만기일,수탁은행,"+
			           "수탁계좌번호,수금거래처명",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                       "100,100");
	gridMain.setColAlign("center,left,left,left,center,right,left,left,center,left,"+
	                     "left,left");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ron,ro,ro,ro,ro,"+
	                     "ro,ro");
	gridMain.setColSorting("int,str,str,str,date,int,str,str,date,str,"+
	                       "str,str");
	gridMain.attachFooter(",,합계,,,0,,,,,"+
	                      ",");
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
				 구분
				 </label>
				<div class="col-sm-2 col-md-2">
				  <select name="gubn" id="gubn" class="form-control input-xs">
				  	<option value="1">1.만기일</option>
				  	<option value="2">2.발행일</option>
				  </select>
				</div>
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
			 거래처
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="busiComp" id="busiComp" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
	  <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 어음번호
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="uNum" id="uNum" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 만기전표
			 </label>
			<div class="col-sm-3 col-md-3">
			  <div class="col-sm-4 col-md-4">
			    <input type="radio" name="mgjp" id="mgjp" value="1" checked="checked">발행
			  </div>
			  <div class="col-sm-8 col-md-8">
			    <input type="radio" name="mgjp" id="mgjp" value="2">미발행
			  </div>
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>