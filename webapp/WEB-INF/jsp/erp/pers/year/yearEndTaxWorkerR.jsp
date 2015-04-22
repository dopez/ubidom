<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,9],"1C");
	//연말정산재직자총합
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

    var t = new Date().getFullYear();
	byId("stDate").value = t;
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
			  정산년월 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-12 col-md-12">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>         
             </div>
		 </div>
	    </div>
      </div>
  </form>
 </div> 
</div>