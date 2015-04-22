<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,9],"1C");
	//퇴직소득원천징수영수증
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");

	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,사번,성명,부서,직위,총지급액,총급여액,근로소득공제,근로소득금액,중(전)근무지결정세액,"+
			"주(현)근무지기납부세액",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,140,140");
	gridMain.setColAlign("center,left,left,left,left,right,right,right,right,right,right");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ron,ron,ron,ron,ron,ron");
	gridMain.setColSorting("int,str,str,str,str,int,int,int,int,int,int");
	gridMain.init();		
	
});
function fn_search(){
	
}
function fn_print(){
	
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
             <div class="col-sm-6 col-md-6 col-sm-offset-2 col-md-offset-2">
               <div class="col-sm-4 col-md-4">
                  <input type="radio" name="bal" id="bal" value="1" checked="checked">발행자보고용
               </div>
               <div class="col-sm-4 col-md-4">
                  <input type="radio" name="bal" id="bal" value="2">발행자보관용
               </div>
               <div class="col-sm-4 col-md-4">
                  <input type="radio" name="bal" id="bal" value="3">소득자보관용
               </div>
             </div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>