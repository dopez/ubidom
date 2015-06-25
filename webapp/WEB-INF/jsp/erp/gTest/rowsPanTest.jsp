<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var combo01, combo02, combo03, combo04;
$(document).ready(function(){
	Ubi.setContainer(0,[1,8],"1C");
	//지급공제항목설정
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
    gridMain = new dxGrid(subLayout.cells("a"),false);
	gridMain.addHeader({name:"NO",           colId:"no", 	      width:"50",  align:"center", type:"cntr"});
    gridMain.addHeader({name:"지급/공제",    colId:"subjectKind", width:"80",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"평균임금",     colId:"avgKind", 	  width:"80",  align:"center", type:"ro"});
    gridMain.addHeader({name:"계산구분",     colId:"calcKind", 	  width:"80",  align:"left",   type:"ro"});
   
    gridMain.addHeader({name:"코드",         colId:"subjectCode", width:"80",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"항목명",       colId:"subjectName", width:"100", align:"left",   type:"ro"});
    gridMain.addHeader({name:"출력순서",     colId:"useOrder", 	  width:"60",  align:"right",  type:"ro"});
   
   
    gridMain.addHeader({name:"과세(사무)",   colId:"taxYnO", 	  width:"90",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"과세(생산)",   colId:"taxYnM", 	  width:"90",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"비과세한도액", colId:"nonTaxAmt",   width:"90",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"비고",         colId:"remarks", 	  width:"150", align:"left",   type:"ro"});
    gridMain.setColSort("str");
    gridMain.setUserData("","pk","no");
 	gridMain.init();	
 	gridMain.cs_setColumnHidden(["compId"]);

	fn_search();
});

function fn_search(){
	gfn_callAjaxForGrid(gridMain,{},"/erp/pers/wage/provDeductSetS/gridMainSearch",subLayout.cells("a"),gridMainCB); 
}

function gridMainCB(data){
	var preRowArr = cs_grid_rowspan_Init(gridMain,1);
	for(var i=0;i<preRowArr.length-1;i++){
		cs_grid_rowspan_next(gridMain,3,preRowArr[i],preRowArr[i+1]);
	} 
}

function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };

</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>