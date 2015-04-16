<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[1,8],"1C");
	//포장코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	subLayout.cells("a").setHeight(0);
	
	gridMain = layout.cells("b").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("포장코드,포장명",null,
			["text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ro,ro");
	gridMain.setColSorting("str,str");
	gridMain.init();
	layout.cells("b").setHeight(400); 
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>