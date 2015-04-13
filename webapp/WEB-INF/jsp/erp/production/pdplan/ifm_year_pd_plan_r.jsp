<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;   
$(document).ready(function(){
	Ubi.setContainer(2,[1,8,9],"1C");
	//연간생산계획조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("연도,품목코드,품명,포장,단위,1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월,합계",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,right,right,right,right,right,right,right,right,right,right,right,right,right");
	gridMain.setColTypes("ro,ro,ro,ro,ro,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron");
	gridMain.setColSorting("date,str,str,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int");
	gridMain.attachFooter("월계,,,,,0,0,0,0,0,0,0,0,0,0,0,0,0");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y");
	calMain.hideTime();
	var t = new Date().getFullYear();
	byId("stDate").value = t;
	byId("edDate").value = t;
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
function fn_popupGoodsCode(){
	
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
				 연도
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
				 제품코드
				 </label>
				<div class="col-sm-2 col-md-2">
				  <input name="goodsCode" id="goodsCode" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			  </div>
		  </div>
		</div>      
	  </form>
	</div>  
</div>