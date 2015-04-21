<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(0,[1,3,5,6],"1C");
	//지급공제항목설정
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,지급/공제,코드,항목명,출력순서,계산구분,평균임금,과세(사무),과세(생산),비과세한도액,비고",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,center,left,left,right,center,center,left,center,right,left");
	gridMain.setColTypes("ron,coro,ed,ed,edn,coro,ch,coro,coro,edn,ed");
	gridMain.setColSorting("int,str,str,str,int,str,na,str,str,int,str");
	gridMain.init();		
});
function fn_search(){
	
}
function fn_save(){
	
}
function fn_row_insert(){
	
}
function fn_row_delete(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>