<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(0,[1,3,5,6],"2U");
	//시스템 메뉴 등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

	
	//좌측 그리드 config
	subLayout.cells("a").setWidth(403);

	//우측 그리드 config
	gridMain = new dxGrid(subLayout.cells("b"), false);
	/* gridDtl.addHeader({name:"No", colId:"rowNo", width:"10", type:"ro"}); */
	gridMain.addHeader({name:"순서", colId:"innerCode", width:"5", type:"ed"});
	gridMain.addHeader({name:"구분", colId:"innerCodeName", width:"7", type:"ed"});
	gridMain.addHeader({name:"메뉴명", colId:"addVar", width:"10", type:"ed"});
	gridMain.addHeader({name:"URI", colId:"descRmk", width:"25", type:"ed"});
	gridMain.addHeader({name:"사용", colId:"descRmk", width:"5", type:"ed"});
	gridMain.setColSort("str");
	gridMain.setUserData("","pk","innerCode");
	gridMain.init();	
	
});

</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="jsonData2" name="jsonData2" />
    <input type="hidden" id="gridMstCode" name="gridMstCode" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>