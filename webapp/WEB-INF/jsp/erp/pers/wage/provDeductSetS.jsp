<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var combo01, combo02, combo03, combo04;
$(document).ready(function(){
	Ubi.setContainer(0,[1,3,5,6],"1C");
	//지급공제항목설정
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
    gridMain = new dxGrid(subLayout.cells("a"),false);
	gridMain.addHeader({name:"NO",           colId:"no", 	      width:"3",  align:"center", type:"cntr"});
    gridMain.addHeader({name:"지급/공제",    colId:"subjectKind", width:"5",  align:"center", type:"combo"});
    gridMain.addHeader({name:"코드",         colId:"subjectCode", width:"5",  align:"center", type:"ed"});
    gridMain.addHeader({name:"항목명",       colId:"subjectName", width:"5",  align:"center", type:"ed"});
    gridMain.addHeader({name:"출력순서",     colId:"useOrder", 	  width:"5",  align:"center", type:"ed"});
    gridMain.addHeader({name:"계산구분",     colId:"calcKind", 	  width:"5",  align:"center", type:"combo"});
    gridMain.addHeader({name:"평균임금",     colId:"avgKind", 	  width:"5",  align:"center", type:"ch"});
    gridMain.addHeader({name:"과세(사무)",   colId:"taxYnO", 	  width:"5",  align:"center", type:"combo"});
    gridMain.addHeader({name:"과세(생산)",   colId:"taxYnM", 	  width:"5",  align:"center", type:"combo"});
    gridMain.addHeader({name:"비과세한도액", colId:"nonTaxAmt",   width:"6",  align:"center", type:"edn"});
    gridMain.addHeader({name:"비고",         colId:"remarks", 	  width:"10", align:"left", type:"ed"});
    gridMain.setColSort("str");
    gridMain.setUserData("","pk","no");
 	gridMain.init();	
 	gridMain.cs_setColumnHidden(["compId"]);
    
 	combo01 =gridMain.getColumnCombo(1);
	fn_comboSet(combo01,1);
	combo02 =gridMain.getColumnCombo(5);
	fn_comboSet(combo02,2);
	combo03 =gridMain.getColumnCombo(7);
	fn_comboSet(combo03,3);
	combo04 =gridMain.getColumnCombo(8);
	fn_comboSet(combo04,3);
});
function fn_comboSet(comboId,comboNum){
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
	       {header: "구분", width: 100,  option: "#interName#"}
	    ]
	});
	if(comboNum == 1){
	  comboId.addOption("1","지급");
	  comboId.addOption("2","공제");	
	}else if(comboNum == 2){
	   comboId.addOption("1","계산식");
	   comboId.addOption("2","고정수당");
	   comboId.addOption("3","변동수당");
	   comboId.addOption("4","변동(가지급)");
	}
    else if(comboNum == 3){
       comboId.addOption("1","과세");
 	   comboId.addOption("2","비과세");
 	   comboId.addOption("3","연장비과세");
	}

comboId.enableFilteringMode(true);
comboId.enableAutocomplete(true);
comboId.allowFreeText(true);
}
function fn_search(){
	gfn_callAjaxForGrid(gridMain,{},"gridMainSearch",subLayout.cells("a"));
	gridMain.dxObj.collapseColumns(1); 
}

function fn_save(){
	 var jsonStr = gridMain.getJsonUpdated2();
  if (jsonStr == null || jsonStr.length <= 0) return;         		
      $("#jsonData").val(jsonStr);                      
      $.ajax({
         url : "/erp/pers/wage/provDeductSetS/gridMainSave",
         type : "POST",
         data : $("#pform").serialize(),
         async : true,
         success : function(data) {
         MsgManager.alertMsg("INF001");
         fn_search();
          }
     }); 	
}
function fn_add(){
	 var totalColNum = gridMain.getColumnCount();
	 var data = new Array(totalColNum); 
	     gridMain.addRow(data);	
}
function fn_delete(){
	var rodid = gridMain.getSelectedRowId();
	gridMain.cs_deleteRow(rodid);
}
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>