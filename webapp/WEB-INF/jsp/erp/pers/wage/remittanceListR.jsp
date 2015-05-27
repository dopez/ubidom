<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8],"1C");
	//송금리스트
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,은행명,사번,사원명,계좌번호,예금주명,실지급액,지급일자",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,left,right,center");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ron,ro");
	gridMain.setColSorting("int,str,str,str,str,str,int,date");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y/%m");
	calMain.hideTime();	   
    var t1 = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t1+"/"+m;
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
			  급여년월 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <label class="col-sm-1 col-md-1 control-label" for="textinput">
			 구분
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="sdgubn" id="jsdgubn" class="form-control input-xs">
			   <option value="급여">급여</option>
			   <option value="상여">상여</option>
			   <option value="성과급">성과급</option>
			   <option value="급여외기타수당">급여외기타수당</option>
			  </select>
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
			 은행별
			 </label>
			<div class="col-sm-1 col-md-1">
			   <input type="text" name="bnaknm" id="banknm" class="form-control input-xs" value="">
			</div>
			<div class="col-sm-4 col-md-4">
			   <div class="col-sm-10 col-md-10">
					<input name="bankNum" id="bankNum" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<button type="button" class="form-control btn btn-default btn-xs" name="btnSearch" id="btnSearch" onclick="gfn_load_popup('은행','common/bankPOP')">
					  <span class="glyphicon glyphicon-search"></span>
					</button>
				 </div>
			</div>
			 <label class="col-sm-2 col-md-2 control-label" for="textinput">
			    미표시자여부
			 </label>
			 <div class="col-sm-1 col-md-1">
			    <input name="mpy" id="mpy" type="checkbox" value="Y" >
			 </div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>