<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,9],"2E");
	//받을어음등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,발행일,수금거래처명,발행인,발행은행,어음번호,어음종류,만기일,금액,어음잔액,"+
			            "배서금액계,할인금액계,만기금액",null,
			           ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
                           "100,100,100");
	gridMst.setColAlign("center,center,left,left,left,left,left,center,right,right,"+
                         "right,right,right");
	gridMst.setColTypes("ron,dhxCalendarA,ed,ed,ed,ed,ed,dhxCalendarA,edn,edn,"+
                         "edn,edn,edn");
	gridMst.setColSorting("int,date,str,str,str,str,str,date,int,int,"+
                           "int,int,int");
	gridMst.init();	

	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,수금번호,어음번호,금액,발행은행,만기일,구분,배서/할인금액계,배서/할인일자,배서/할인처,"+
			          "배서/할인사항",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
                          "100");
	gridDtl.setColAlign("center,left,left,right,left,center,left,right,center,left,"+
                        "left");
	gridDtl.setColTypes("ron,ro,ro,ron,ro,ro,ro,ron,ro,"+
                        "ro");
	gridDtl.setColSorting("int,str,str,int,str,date,str,int,date,str,"+
                          "str");
	gridDtl.init();	
	
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
				   <option value="1">1.발행일</option>
				   <option value="2">2.만기일</option>
				   <option value="3">3.부도일</option>
				   <option value="4">4.할인일</option>
				   <option value="5">5.배서지급일</option>
				   <option value="6">6.수금일자</option>
				   <option value="7">7.보관어음</option>
				   <option value="8">8.분할배서</option>
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
			 수금번호
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="sNum" id="sNum" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<div class="col-sm-2 col-md-2">
			  <input name="sspr" id="sspr" type="button" value="상세내역 인쇄" placeholder="" class="form-control btn btn-default btn-xs">
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>