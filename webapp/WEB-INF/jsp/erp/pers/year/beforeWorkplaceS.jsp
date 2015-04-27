<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,8],"2U");
	//전근무지입력
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
	gridDtl.setHeader("사업자등록번호,사업장명,급여총액,상여총액,국민연금,국외근로,건강보험,기타비과세,고용보험,야간근로,"+
			          "소득세,주민세,농특세,퇴직연금,연구기관 연구비,기업연구소 연구비,시작일,종료일",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                      "100,100,100,100,100,120,100,100");
	gridDtl.setColAlign("left,left,right,right,right,right,right,right,right,right,"+
	                    "right,right,right,right,right,right,right,right");
	gridDtl.setColTypes("ro,ro,ron,ron,ron,ron,ron,ron,ron,ron,"+
	                    "ron,ron,ron,ron,ron,ron,ro,ro");
	gridDtl.setColSorting("str,str,int,int,int,int,int,int,int,int,"+
	                      "int,int,int,int,int,int,date,date");
	gridDtl.init();	
 
    var t = new Date().getFullYear();
	byId("stDate").value = t;
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
			  정산년도 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-12 col-md-12">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
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
			   <option value="복직">복직</option>
			   <option value="재직">재직</option>
			   <option value="퇴직">퇴직</option>
			   <option value="휴직">휴직</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div>  
  </form>
 </div> 
</div>