<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout, toolbar, subLayout;
var gridMain;
var calStDate;
$(document).ready(function() {

	 Ubi.setContainer(0,[1,2,3,4,5,6],"1C"); //유해물질이력등록

	  	layout = Ubi.getLayout();
	    toolbar = Ubi.getToolbar();
	    subLayout = Ubi.getSubLayout();

	//grid	
	/* layout.cells("b").setHeight(900); */
	gridMain = layout.cells("b").attachGrid();
    gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //6
    gridMain.setHeader("No,시험종류,시료코드,시료명,시험주기,최종시험일자");
    gridMain.setInitWidths("100,100,100,100,100,100");
    gridMain.setColAlign("center,center,center,center,center,center");
    gridMain.setColTypes("ron,coro,ro,ed,ed,dhxCalendar");
    gridMain.setColSorting("int,str,str,str,str,date");
    gridMain.init();
    toolbar.attachEvent("onClick", function(id) {
		if(id == "btn2"){
			fn_insert();
		}
	});
    //popUp
    gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
    function doOnRowDblClicked(rowId,colId){
		if(colId==2){
			gfn_load_popup('시료코드','common/sampleCodePOP');
		}
	}
})
    
function fn_insert() {
		gridMain.addRow(gridMain.getUID(),"1,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
}


</script>

<div id="container"
	style="position: relative; width: 100%; height: 100%; ">
</div>