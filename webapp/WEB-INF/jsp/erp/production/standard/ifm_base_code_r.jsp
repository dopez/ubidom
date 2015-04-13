<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	ubi.init(1,[1,8],"1C");
	Ubi.setContainer(1,[1,8],"1C");
	//제코드조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,Code분류,분류명,내부코드,내부코드명,참조변수,비고",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100");
	gridMain.setColAlign("center,center,left,left,left,right,left");
	gridMain.setColTypes("ron,ron,ro,ron,ro,ron,ro");
	gridMain.setColSorting("int,int,str,int,str,int,str");
	gridMain.init();	
	
});
function fn_search(){
	
}
function fn_excel(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-7 col-md-7">
		  <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				코드분류
				</label>
			<div class="col-sm-2 col-md-2">
			    <input type="text" name="codeBranch" id="codeBranch" value="" placeholder="" class="form-control input-xs">		
			</div>
		 </div>
	    </div>
      </div>      
  </form>
 </div> 
</div>