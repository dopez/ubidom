<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl01, gridDtl02;
$(document).ready(function(){
	Ubi.setContainer(4,[1,3,5,6],"3L");
	//교육훈련사항등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,사번,성명,부서",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100");
	gridMst.setColAlign("center,right,left,left");
	gridMst.setColTypes("ron,ron,ro,ro");
	gridMst.setColSorting("int,int,str,str");
	gridMst.init();	
	subLayout.cells("a").setWidth(403);
	
	gridDtl01 = subLayout.cells("b").attachGrid();
	gridDtl01.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl01.setHeader("No,관계,성명,주민등록번호,직장명,직위,학력,거주지",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl01.setInitWidths("100,100,100,100,100,100,100,100");
	gridDtl01.setColAlign("center,left,left,left,left,left,left,left");
	gridDtl01.setColTypes("ron,ed,ed,ed,ed,ed,ed,ed");
	gridDtl01.setColSorting("int,str,str,str,str,str,str,str");
	gridDtl01.init();
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("신원보증");

	gridDtl02 = subLayout.cells("c").attachGrid();
	gridDtl02.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl02.setHeader("No,시작일,종료일,계약내용,보험료,보험금,보험회사",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;"]);
	gridDtl02.setInitWidths("100,100,100,100,100,100,100");
	gridDtl02.setColAlign("center,center,center,left,right,right,left");
	gridDtl02.setColTypes("ron,dhxCalendarA,dhxCalendarA,ed,edn,edn,ed");
	gridDtl02.setColSorting("int,date,date,str,int,int,str");
	gridDtl02.init();
	subLayout.cells("c").showHeader();
	subLayout.cells("c").setText("보증보험");

});
function fn_search(){
	
}
function fn_save(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
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
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
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
  </form>
 </div> 
</div>