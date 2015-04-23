<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[1,2,3,4,5,6],"1C");
	//시험공유자 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    
    
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("성명,부서");
	gridMain.setInitWidths("100,100");
	gridMain.setColAlign("left,left");
	gridMain.setColTypes("ed,ed");
	gridMain.setColSorting("str,str");
	gridMain.init(); 
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
