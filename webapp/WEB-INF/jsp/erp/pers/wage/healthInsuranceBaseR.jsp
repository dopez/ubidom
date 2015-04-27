<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,3,8],"1C");
	//건강보험 기초자료
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,부서,직위,사번,성명,취득일자,증번호,보수월액(현),보험료율(현),산정보험료(현),"+
			           "보수월액(전),보험료율(전),산정보험료(전),금액차",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			               "100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,center,left,right,right,right,"+
			             "right,right,right,right");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ron,ron,ron,"+
			             "ron,ron,ron,ron");
	gridMain.setColSorting("int,str,str,str,str,date,str,int,int,int,"+
			               "int,int,int,int");
	gridMain.init();	
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
			 보험료율
			 </label>
			<div class="col-sm-1 col-md-1">
			  <input type="text" name="rate" id="rate" value="" class="form-control input-xs" disabled="disabled">
			</div>
			<div class="col-sm-2 col-md-2" style="margin-left: 5px;">
			  <input type="button" name="status" id="status" value="현내역->전내역" class="form-control btn btn-default btn-xs">
			</div>
		  </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>