<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;  
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,3,6,8],"3E");
	//월근태
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,부서,직위,사번,성명,근무일수,근무시간,연장시간,야근시간,특근시간,"+
			          "특근연장시간,특근야근(심야),주휴일수,지각시간,조퇴시간,외출시간,결근,무단결근,연차휴가",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,70,70,70,70,70,"+
			              "100,100,70,70,70,70,70,70,70");
	gridMst.setColAlign("center,left,left,left,left,right,right,right,right,right,"+
			            "right,right,right,right,right,right,right,right,right");
	gridMst.setColTypes("ron,ed,ed,ed,ed,edn,edn,edn,edn,edn,"+
			            "edn,edn,edn,edn,edn,edn,edn,edn,edn");
	gridMst.setColSorting("int,str,str,int,str,int,int,int,int,int,"+
			              "int,int,int,int,int,int,int,int,int");
	gridMst.init();	
	
	subLayout.cells("b").attachObject("bootContainer2");
	subLayout.cells("b").setHeight(50);

	gridDtl = subLayout.cells("c").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,근무일자,근태구분,출근,퇴근,정상,연장,야근,외출,조퇴,"+
			          "지각,총근무,휴일구분",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100,100,100");
	gridDtl.setColAlign("center,center,center,center,center,right,right,right,right,right,"+
			            "right,right,right");
	gridDtl.setColTypes("ron,dhxCalendarA,coro,dhxCalendarA,dhxCalendarA,edn,edn,edn,edn,edn,"+
			            "edn,edn,coro");
	gridDtl.setColSorting("int,date,str,date,date,int,int,int,int,int,"+
			              "int,int,str");
	gridDtl.attachFooter("합계,,,,,0,0,0,0,0,"+
			             "0,0,");
	gridDtl.init();	
	
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
		  </div>
	  </div>
	</div> 
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 성명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<div class="col-sm-2 col-md-2">
			  <input type="button" name="month" id="month" value="월근태생성" class="form-control btn btn-default btn-xs">
			</div>
		  </div>
	  </div>
	</div>  
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-10 col-md-10">
			<label class="col-sm-4 col-md-4" for="textinput">
			 *해당사원의 1개월치 일일근태입니다.
			</label>
			<label class="col-sm-6 col-md-6" for="textinput">
			 1. 해당항목 수정 후 반드시 데이터 값 확인후 저장하시기 바랍니다.<br>
			 2. 일근태 저장 후 월근태를 재생성 하시기 바랍니다.
			</label>
			<div class="col-sm-2 col-md-2">
			  <input type="button" name="dilisave" id="dilisave" value="일근태저장" class="form-control btn btn-default btn-xs">
			</div>
		 </div>
	    </div>
      </div>       
  </form>
 </div> 
</div>