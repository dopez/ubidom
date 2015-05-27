<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[1,2,3,4,5,6],"1C");
	//소모성부품이력등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("부품코드,부품명,규격,교환주기,적정재고",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100");
	gridMain.setColAlign("left,left,left,right,right");
	gridMain.setColTypes("ro,ro,ro,ron,ron");
	gridMain.setColSorting("str,str,str");
	gridMain.init(); 
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	gridMain.addRow(gridMain.getUID(),",,,,",1);
	
	function doOnRowDblClicked(rowId,colId){
		if(colId==0){
		gfn_load_popup('부품코드','common/componentCodePOP');
		}
	}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
