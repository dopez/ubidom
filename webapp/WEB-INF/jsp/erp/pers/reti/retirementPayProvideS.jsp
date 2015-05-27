<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(0,[1,3,5,6,8],"1C");
	//퇴직금지급표등록
	layout = Ubi.getLayout(); 
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,근속년수,지급월수",null,
			          ["text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100");
	gridMain.setColAlign("center,center,center");
	gridMain.setColTypes("ron,ron,ron");
	gridMain.setColSorting("int,int,int");
	gridMain.init();	
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>