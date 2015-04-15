<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[],"1C");
	//설비이력조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    uClayout = layout.cells("b").attachLayout("1C");
    subLayout.cells("a").setHeight(1);
    
    uClayout.cells("a").hideHeader();
	gridMain = uClayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("포장코드,포장명",null,
			["text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();	

});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
