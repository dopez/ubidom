<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[0],"1C");
	//공급업체코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

    gridMain = subLayout.cells("a").attachGrid();
    gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9
    gridMain.setHeader("방문,유선,불량분석,견적가격조정,Test진행,"+
    					"기술지원,자료작성,컴프레인,계");
    gridMain.setInitWidths("100,100,100,100,100,100,100,100,100");
    gridMain.setColAlign("center,center,center,center,center,center,center,center,center");
    gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
    gridMain.setColSorting("str,str,str,str,str,str,str,str,str");
    gridMain.init();
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>