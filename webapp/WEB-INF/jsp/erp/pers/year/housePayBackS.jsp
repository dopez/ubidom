<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl01, gridDtl02, gridDtl03;
$(document).ready(function(){
	Ubi.setContainer(3,[1,3],"4C");
	//연금 저축등 소득공제 명세서등록
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

	gridDtl01 = subLayout.cells("b").attachGrid();
	gridDtl01.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl01.setHeader("No,임대인(대주),임대인사업자번호(주민번호),주택유형,주택면적(m2),임대인(주소),계약기간 시작,계약기간 종료,연간월세액,세액공제액",null,
			           ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl01.setInitWidths("100,100,100,100,100,100,100,100,100,100");
	gridDtl01.setColAlign("center,left,left,left,right,left,center,center,right,right");
	gridDtl01.setColTypes("ron,ro,ro,ro,ron,ro,ro,ro,ron,ron");
	gridDtl01.setColSorting("int,str,str,str,int,str,date,date,int,int");
	gridDtl01.init();	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("1.월세액 세액공제 명세");
	var tbrlayout = subLayout.cells("b");
	subToolbar("toolbar",tbrlayout,[5,6]);
	
	gridDtl02 = subLayout.cells("c").attachGrid();
	gridDtl02.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl02.setHeader("No,임대인(대주),임대인사업자번호(주민번호),계약기간 시작,계약기간 종료,차입금이자율,차입금상환액계,원금,이자,공제금액",null,
			           ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl02.setInitWidths("100,100,100,100,100,100,100,100,100,100");
	gridDtl02.setColAlign("center,left,left,center,center,right,right,right,right,right");
	gridDtl02.setColTypes("ron,ro,ro,ro,ro,ron,ron,ron,ron,ron");
	gridDtl02.setColSorting("int,str,str,date,date,int,int,int,int,int");
	gridDtl02.init();	
	subLayout.cells("c").showHeader();
	subLayout.cells("c").setText("2.금전소비대차 계약내용");
	var tbrlayout2 = subLayout.cells("c");
	subToolbar("toolbar2",tbrlayout2,[5,6]);
	
	gridDtl03 = subLayout.cells("d").attachGrid();
	gridDtl03.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl03.setHeader("No,임대인(대주),임대인사업자번호(주민번호),주택유형,주택면적(m2),임대인(주소),계약기간 시작,계약기간 종료,전세보증금",null,
			           ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			            "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl03.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridDtl03.setColAlign("center,left,left,left,right,left,center,center,right");
	gridDtl03.setColTypes("ron,ro,ro,ro,ron,ro,ro,ro,ron");
	gridDtl03.setColSorting("int,str,str,str,int,str,date,date,int");
	gridDtl03.init();	
	subLayout.cells("d").showHeader();
	subLayout.cells("d").setText("3.임대차 계약내용");
	var tbrlayout3 = subLayout.cells("d");
	subToolbar("toolbar3",tbrlayout3,[5,6]);
	
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