<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var o;
var gridMst;
var gridDtl;
$(document).ready(function(){
	ubi.init(1,[1,2,3,4,5,6],"2U");
	o = ubi.getDataSet(); 
	//검사기준등록
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("품목코드,품명,규격,단위",null,["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100");
	gridMst.setColAlign("left,left,left,left");
	gridMst.setColTypes("ro,ro,ed,ro");
	gridMst.setColSorting("str,str,str,str");
	gridMst.init();	
	o.slayout.cells("a").showHeader();
	o.slayout.cells("a").setText("품목정보");	
	
	gridDtl = o.slayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("검사항목코드,검사항목,검사기준,허용오차,#cspan",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100");
	gridDtl.setColAlign("left,left,left,right,right");
	gridDtl.setColTypes("ro,ro,ro,edn,edn");
	gridDtl.setColSorting("str,str,str,int,int");
	gridDtl.init();	
	o.slayout.cells("b").showHeader();
	o.slayout.cells("b").setText("검사항목별 기준");	
});
function fn_new(){
	
}
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
