<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8,9],"1C");
	//모재코드조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,모재코드,모재명,규격,재질,단위,공급업체,사용구분,사용중지일자",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,left,left,left,left,left,center,center");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ro");
	gridMain.setColSorting("int,str,str,str,str,str,str,str,date");
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
		    공급업체
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="supplyComp" id="supplyComp" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('공급업체코드','common/supplyCompPOP')">
			</div>
		  </div>
	    </div>
      </div>     
  </form>
 </div>
</div>