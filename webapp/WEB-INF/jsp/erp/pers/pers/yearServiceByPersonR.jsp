<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8],"2E");
	//연령별인원현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,부서명,1년미만,1~2,2~3,3~4,4~5,5~6,6~7,7~8,"+
			          "8~9,9~10,10~15,15~20,20~25,25~30,30년이상,전체계,평균",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,80,80,80,80,80,80,80,80,"+
			              "80,80,80,80,80,80,80,80,80");
	gridMst.setColAlign("center,left,right,right,right,right,right,right,right,right,"+
			            "right,right,right,right,right,right,right,right,right");
	gridMst.setColTypes("ron,ro,ron,ron,ron,ron,ron,ron,ron,ron,"+
			            "ron,ron,ron,ron,ron,ron,ron,ron,ron");
	gridMst.setColSorting("int,str,int,int,int,int,int,int,int,int,"+
			              "int,int,int,int,int,int,int,int,int");
	gridMst.attachFooter(",년수별계,,,,,,,,"+
			             ",,,,,,,,,");
	gridMst.init();	
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("근속년수별인원현황");
	
	gridMst = subLayout.cells("b").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,사원코드,사원명,발령일자,사업장구분,부서명,직위,근속일자",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100");
	gridMst.setColAlign("center,left,left,center,left,left,left,center");
	gridMst.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro");
	gridMst.setColSorting("int,str,str,date,str,str,str,date");
	gridMst.init();	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("직급근속현황");
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
			 사업장
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jobgubn" id="jobgubn" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="관리직">본점</option>
			  </select>
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
			 부서
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="work" id="work" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="영업부">영업부</option>
			   <option value="총괄">총괄</option>
			   <option value="생산부">생산부</option>
			   <option value="경영지원실">경영지원실</option>
			   <option value="기술연구소">기술연구소</option>
			   <option value="품질관리부">품질관리부</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
         <div class="form-group form-group-sm">
             <div class="col-sm-8 col-md-8">
                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
                   사원 
                </label>
                <div class="col-sm-1 col-md-1">
                    <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                </div>
                <div class="col-sm-2 col-md-2">
                     <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                         <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('사원','common/seqNoPOP')">
                     </div>
                </div>
              </div>
           </div>
      </div> 
  </form>
 </div> 
</div>