<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"1C");
	//모재별생산실적
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain =subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,모재코드,모재명,포장,단위,수량",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,right");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ron");
	gridMain.setColSorting("int,str,str,str,str,int");
	gridMain.attachFooter(",합계,,,,0");
	gridMain.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
function fn_popupBaseMatrCode(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">  
      <div class="row">  
		 <div class="form-group form-group-sm">
			<div class="col-sm-7 col-md-7">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				 기간 
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <span>
                               <input type="button" id="calpicker1" class="calicon" onclick="setSens(1,'edDate', 'max')">
							</span>
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                              <span> 
                                <input type="button" id="calpicker2" class="calicon" onclick="setSens(1,'stDate', 'min')">
							  </span>
                          </div>
                       </div> 
                 </div>              
			</div>
		</div>
	  </div>  
	  <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-7 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 모재코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="baseMatrCode" id="baseMatrCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-7 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 구분
			 </label>
			<div class="col-sm-4 col-md-4">
			    <div class="col-sm-3 col-md-3">
					<input type="radio" name="pudcdept" id="pudcdept" value="주간" checked="checked">주간
			    </div>
			    <div class="col-sm-3 col-md-3">
					<input type="radio" name="pudcdept" id="pudcdept" value="월간">월간
			    </div>
			    <div class="col-sm-3 col-md-3">
					<input type="radio" name="pudcdept" id="pudcdept" value="분기">분기
				</div>
				<div class="col-sm-3 col-md-3">
					<input type="radio" name="pudcdept" id="pudcdept" value="연간">연간
				</div>
			</div>
		  </div>
	  </div>
	</div>   
  </form>
 </div> 
</div>