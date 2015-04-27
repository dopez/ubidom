<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[0],"2E");
	//전표상세현황조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    gridMst = subLayout.cells("a").attachGrid();
    gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //9
    gridMst.setHeader("No,계정,세목,귀속부서,차변금액,대변금액,거래처,적요,번호(어음·계좌·L/C)");
    gridMst.attachFooter(",전표합계,#cspan,#cspan,0,0,(차액)");
    gridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
    gridMst.setColAlign("center,center,center,center,right,right,left,left,left");
    gridMst.setColTypes("ron,ro,ro,ro,ron,ron,ro,ro,ro");
    gridMst.setColSorting("int,str,str,str,int,int,str,str,str");
    gridMst.init();
	
	gridDtl = subLayout.cells("b").attachGrid();//11
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("시작일,종료일,과표,수량단위,수량,화폐단위,환율,이율,원가구분,매입구분,매출구분");
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
	gridDtl.setColAlign("center");
	gridDtl.setColTypes("ro");
	gridDtl.setColSorting("str");
	gridDtl.init(); 
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>