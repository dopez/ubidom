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
    gridMain.addHeader({name:"코드",         colId:"subjectCode", width:"80",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"항목명",       colId:"subjectName", width:"100", align:"left",   type:"ro"});
    gridMain.addHeader({name:"출력순서",     colId:"useOrder", 	  width:"60",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"계산구분",     colId:"calcKind", 	  width:"80",  align:"left",   type:"ro"});
    gridMain.addHeader({name:"평균임금",     colId:"avgKind", 	  width:"80",  align:"center", type:"ro"});
    gridMain.addHeader({name:"과세(사무)",   colId:"taxYnO", 	  width:"90",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"과세(생산)",   colId:"taxYnM", 	  width:"90",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"비과세한도액", colId:"nonTaxAmt",   width:"90",  align:"right",  type:"ro"});
    gridMain.addHeader({name:"비고",         colId:"remarks", 	  width:"150", align:"left",   type:"ro"});
    gridMain.setColSort("str");
    gridMain.setUserData("","pk","no");
 	gridMain.init();	
 	gridMain.cs_setColumnHidden(["compId"]);

 	combo01 =gridMain.getColumnCombo(1);
	combo02 =gridMain.getColumnCombo(5);
	combo03 =gridMain.getColumnCombo(7);
	combo04 =gridMain.getColumnCombo(8);
	gfn_single_comboLoad(combo01,["1","2"],["지급","공제"],2);
	gfn_single_comboLoad(combo02,["C","F","N","P"],["계산식","고정수당","변동수당","변동(가지급)"],4);
	gfn_single_comboLoad(combo03,["T","N","O"],["과세","비과세","연장비과세"],3);
	gfn_single_comboLoad(combo04,["T","N","O"],["과세","비과세","연장비과세"],3);

	fn_search();
});

function fn_search(){
	gfn_callAjaxForGrid(gridMain,{},"/erp/pers/wage/provDeductSetS/gridMainSearch",subLayout.cells("a"),gridMainCB); 
}

function gridMainCB(data){
	var endRow = 1;
	var rowIdx = 0;
	var endRowArr =[];
	var rowId = [];
	var preVal = gridMain.setCells2(0,1).getValue();
	 var nowVal = "";
	 for(var i = 1; i < gridMain.getRowsNum(); i++) {
	   rowId[rowIdx] = gridMain.getRowId(i);
	   nowVal = gridMain.setCells2(i,1).getValue();
	  if (preVal == nowVal) {
		  endRow++;
	  }else{
		  endRowArr[rowIdx] = endRow;
		  rowIdx++;
		  rowId[rowIdx] = gridMain.getRowId(i);
		  endRow = 0;  
	   }
	  preVal = nowVal; 
	 }
	 console.log(endRow);
	 for(var j=0;j<rowId.length;j++){
		if(j==0){
		   var rowId = gridMain.getRowId(0);
		    gridMain.dxObj.setRowspan(rowId,1,endRowArr[j]);
		}else if(j == (rowId.length-1)){
			gridMain.dxObj.setRowspan(rowId[j],1,2);
		}else{
			gridMain.dxObj.setRowspan("10",1,2);	
		}	
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