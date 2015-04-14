<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8,9],"1C");
	//설비이력조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,설비코드,설비명,규격,용량,사용공정,거래처,담당자,전화번호,CP번호,제작처,금액,구입일자,사용유무,사용중지사유",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,right,left,left,left,left,left,left,right,center,left,left");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ron,ro,ro,ro");
	gridMain.setColSorting("int,str,str,str,int,str,str,str,str,str,str,int,date,str,str");
	gridMain.init();	

});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
function fn_popupComponentCode(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">	
	   <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">       
          <div class="row">
	         <div class="form-group form-group-sm">
		        <div class="col-sm-8 col-md-8">
			       <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        	설비코드
			       </label>
			       <div class="col-sm-2 col-md-2">
			         <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
		        </div>
	        </div>
	     </div>
      </form>
  </div>     
</div>