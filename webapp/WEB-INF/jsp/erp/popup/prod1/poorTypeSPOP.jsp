<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[1],"1C");
	//불량유형 등록창
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("불량유형코드,불량명,수량",null,
			["text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100");
	gridMain.setColAlign("left,left,right");
	gridMain.setColTypes("coro,ro,ron");
	gridMain.setColSorting("str,str,str");
	gridMain.init(); 
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>