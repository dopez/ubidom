<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[1,2,3,4,5,6],"1C");
	//점검항목
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("항목코드,항목명,주기,최종점검일자",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100");
	gridMain.setColAlign("left,left,left,center");
	gridMain.setColTypes("ro,ro,ro,ro");
	gridMain.setColSorting("str,str,str,date");
	gridMain.init(); 
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	gridMain.addRow(gridMain.getUID(),",,,",1);
	
	function doOnRowDblClicked(rowId,colId){
		if(colId==0){
		gfn_load_popup('항목코드','common/sectionCodePOP');
		}
	}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>