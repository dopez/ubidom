<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,3,4],"1C");
	//성과급적용률
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,직군,부서,직위,사번,성명,입사일,기준금액,적용금액(원)",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,left,center,right,right");
	gridMain.setColTypes("ron,ed,ed,ed,ed,ed,ed,edn,edn");
	gridMain.setColSorting("int,str,Str,str,str,str,date,int,int");
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
function fn_monthLen(month){
	 var initMonth;
		if(month < 10){		
			initMonth = "0"+month;
		}else{
			initMonth = month;
		}
		return initMonth;
}
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  년월 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-3 col-md-3 col-sm-offset-1 col-md-offset-1">
                  <div class="col-sm-4 col-md-4">
                      <input name="sagubn" id="sagubn" type="radio" value="상여" checked="checked">상여
                  </div>
                  <div class="col-sm-8 col-md-8">
                     <input name="sagubn" id="sagubn" type="radio" value="성과급" >성과급
                  </div>              
             </div>
		 </div>
	    </div>
      </div> 
	 <div class="row">
	    <div class="form-group form-group-sm">
		   <div class="col-sm-8 col-md-8">
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
			    부서
			   </label>
			   <div class="col-sm-2 col-md-2">
			     <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			   </div>
			 <label class="col-sm-1 col-md-1 control-label" for="textinput">
			  성명
			 </label>
			 <div class="col-sm-2 col-md-2">
			   <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
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
			 근무
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="work" id="work" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="재직">재직</option>
			   <option value="휴직">휴직</option>
			   <option value="퇴직">퇴직</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 적용금액
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jwage" id="jwage" class="form-control input-xs">
			   <option value="적용금액">적용금액</option>
			   <option value="적용률">적용률</option>
			  </select>
			</div>
			<div class="col-sm-2 col-md-2">
			  <input type="text" value="" name="jmy" id="jmy" placeholder="" class="form-control input-xs">
			</div>
			<div class="col-sm-2 col-md-2" style="margin-left: 5px;">
			  <input type="button" name="cmapjt" id="cmapjt" value="일괄적용" class="form-control btn btn-default btn-xs">
			</div>
		  </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>