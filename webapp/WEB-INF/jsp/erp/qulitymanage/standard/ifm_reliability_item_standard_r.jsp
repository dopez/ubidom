<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var o;
var gridMain;
$(document).ready(function(){
	ubi.init(1,[1,8,9],"1C");
	o = ubi.getDataSet(); 
	//신뢰성항목기준정보조회
	
	uClayout = o.layout.cells("b").attachLayout("1C");
               o.slayout.cells("a").setHeight(1);
	
    uClayout.cells("a").hideHeader();
	gridMain = uClayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,등록자,종류,항목,#cspan,세부내역,코드",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			"text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.attachHeader("#rspan,#rspan,#rspan,한글,영문,#rspan,#rspan",
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			"text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100");
	gridMain.setColAlign("center,left,center,center,left,center,left");
	gridMain.setColTypes("ron,ro,coro,coro,ed,coro,ro");
	gridMain.setColSorting("int,str,na,na,str,na,str");
	gridMain.init();
	
	
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>