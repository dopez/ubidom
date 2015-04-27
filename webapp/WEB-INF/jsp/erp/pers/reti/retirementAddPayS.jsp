<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,9],"1C");
	//퇴직금추계액 
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("부서명,성명,입사일,근속년수,1월,2월,3월,4월,5월,6월,"+
			           "7월,8월,9월,10월,11월,12월,급여총계(3개월),상여총계,급여평균,상여평균,"+
			           "전체계,추계액",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                       "100,100,100,100,100,100,100,100,100,100,"+
	                       "100,100");
	gridMain.setColAlign("left,left,center,right,right,right,right,right,right,right,"+
	                     "right,right,right,right,right,right,right,right,right,right,"+
	                     "right,right");
	gridMain.setColTypes("ro,ro,ro,ron,ron,ron,ron,ron,ron,ron,"+
	                     "ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,"+
	                     "ron,ron");
	gridMain.setColSorting("str,str,date,int,int,int,int,int,int,int,"+
	                       "int,int,int,int,int,int,int,int,int,int,"+
	                       "int,int");
	gridMain.attachFooter(",전체계,,,0,0,0,0,0,0,"+
	                      "0,0,0,0,0,0,0,0,0,0,"+
	                      "0,0");
	gridMain.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y/%m");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t+"/"+m;
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
			    구분
			   </label>
			   <div class="col-sm-2 col-md-2">
			     <select name="jobgubn" id="jobgubn" class="form-control input-xs">
			       <option value="본사">본사</option>
			       <option value="지점">지점</option>
			     </select>
			   </div>
		    </div>
	     </div>
	 </div>
	 <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  기준년월 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
		 </div>
	    </div>
      </div>
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 직군
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jobgubn" id="jobgubn" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="관리직">관리직</option>
			   <option value="생산직">생산직</option>
			   <option value="용역">용역</option>
			   <option value="외국인">외국인</option>
			   <option value="기술직">기술직</option>
			  </select>
			</div>
			<label class="col-sm-1 col-md-1 control-label" for="textinput">
			    부서
			 </label>
			 <div class="col-sm-2 col-md-2">
			    <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			 </div>
		  </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>