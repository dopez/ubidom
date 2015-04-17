<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(0,[1],"1C");
	//설비가동 등록창
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("설비코드,설비명,구분,시작,종료",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100");
	gridMain.setColAlign("left,left,center,center,center");
	gridMain.setColTypes("ro,ro,coro,dhxCalendarA,dhxCalendarA");
	gridMain.setColSorting("str,str,na,date,date");
	gridMain.init(); 
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	gridMain.addRow(gridMain.getUID(),",,,,",1);
	function doOnRowDblClicked(rowId,colId){
		if(colId==0){
		gfn_load_popup('설비코드','common/equiCodePOP');
		}
	}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>