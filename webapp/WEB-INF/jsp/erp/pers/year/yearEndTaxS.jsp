<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(3,[1,3,4,8],"2U");
	//연말정산
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,사번,성명,부서,직위",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100");
	gridMst.setColAlign("center,left,left,left,left");
	gridMst.setColTypes("ron,ro,ro,ro,ro");
	gridMst.setColSorting("int,str,str,str,str");
	gridMst.init();	
	subLayout.cells("a").setWidth(503);

	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,항목분류2,항목명,선택,금액,입력방법,공제대상금액,공제액,기초,자료,"+
			          "변경체크",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100");
	gridDtl.setColAlign("center,left,left,center,right,left,right,right,center,right,"+
			            "center");
	gridDtl.setColTypes("ron,ro,ro,ro,ron,ro,ron,ron,ron,ron,"+
			            "ro");
	gridDtl.setColSorting("int,str,str,str,int,str,int,int,int,int,"+
			              "int");
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
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  중도퇴사
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
			 전체선택
			 </label>
			<div class="col-sm-1 col-md-1">
			  <input name="choice" id="choice" type="checkbox" value="y" placeholder="">
			</div>
			<div class="col-sm-2 col-md-2">
			  <input name="standa" id="standa" type="button" value="기초자료가져오기" placeholder="" class="form-control btn btn-default btn-xs">
			</div>
			<div class="col-sm-2 col-md-2">
			  <input name="calc" id="calc" type="button" value="전체(선택)계산" placeholder="" class="form-control btn btn-default btn-xs">
			</div>
			<div class="col-sm-2 col-md-2">
			  <input name="disk" id="disk" type="button" value="연말정산디스켓작업" placeholder="" class="form-control btn btn-default btn-xs">
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>