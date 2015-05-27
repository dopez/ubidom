<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8],"1C");
	//사원대장(개인신상)
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,부서명,사번,성명,직책,학력,결혼구분,주민번호,입사일,우편번호,"+
			           "주소",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			               "100");
	gridMain.setColAlign("center,left,right,left,left,left,left,left,center,left,"+
			             "left");
	gridMain.setColTypes("ron,ro,ron,ro,ro,ro,ro,ro,ro,ro,"+
			             "ro");
	gridMain.setColSorting("int,str,int,str,str,str,str,str,date,str,"+
			               "str");
	gridMain.init();	
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
			 사번
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('사번','common/seqNoPOP')">
			</div>
		  </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>