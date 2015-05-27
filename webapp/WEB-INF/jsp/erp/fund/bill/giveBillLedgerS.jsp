<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(0,[1,2,3,4],"2U");
	//지급어음원장등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,인수일,은행,결제계좌번호,시작번호,종료번호,매수",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100");
	gridMst.setColAlign("center,center,left,left,right,right,right");
	gridMst.setColTypes("ron,dhxCalendarA,ed,ed,edn,edn,edn");
	gridMst.setColSorting("int,date,str,str,int,int,int");
	gridMst.init();	
	subLayout.cells("a").setWidth(703);
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,어음/수표번호,사용유무",null,
			["text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100");
	gridDtl.setColAlign("center,right,center");
	gridDtl.setColTypes("ron,edn,ed");
	gridDtl.setColSorting("int,int,int");
	gridDtl.init();	

});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>