<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[0],"1C");
	//의뢰번호 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    
    
    gridMain = subLayout.cells("a").attachGrid();
    gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //6
    gridMain.setHeader("No,항목코드,항목,주기,주기단위,최초점검일");
    
    gridMain.setInitWidths("100,100,100,100,100,100");
    gridMain.setColAlign("center,center,center,center,center,center");
    gridMain.setColTypes("ron,ro,ro,ro,ro,ro");
    gridMain.setColSorting("int,str,str,str,str,str");
    gridMain.init();
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
