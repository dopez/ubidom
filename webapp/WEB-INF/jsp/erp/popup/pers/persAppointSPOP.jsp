<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var empNo;
var config={
		title:"인사발령등록",
		id:"persCode", 
		width:"950",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(0,[1,3,4,5,6],"1C");
	//인사발령등록 팝업
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"No",         colId:"no",       width:"50",  align:"center", type:"cntr"});
    gridMain.addHeader({name:"발령일",     colId:"balDate",  width:"80", align:"center", type:"dhxCalendarA"});
    gridMain.addHeader({name:"급여구분",   colId:"payGbn",   width:"80",  align:"center", type:"combo"});
    gridMain.addHeader({name:"근무구분",   colId:"serveGbn", width:"80",  align:"center", type:"combo"});
    gridMain.addHeader({name:"발령구분",   colId:"balGbn",   width:"80",  align:"center", type:"combo"});
    gridMain.addHeader({name:"부서코드",   colId:"postCode", width:"80",  align:"center", type:"ro"});
	gridMain.addHeader({name:"발령부서",   colId:"postName", width:"80",  align:"center", type:"ro"});
	gridMain.addHeader({name:"발령직군",   colId:"jikgun",   width:"80",  align:"center", type:"combo"});
	gridMain.addHeader({name:"발령직무",   colId:"jikmu",    width:"80",  align:"center", type:"combo"});
	gridMain.addHeader({name:"발령직위",   colId:"jikwee",   width:"80",  align:"center", type:"combo"});
	gridMain.addHeader({name:"발령직책",   colId:"jikchak",  width:"80",  align:"center", type:"combo"});
	gridMain.addHeader({name:"급여사업장", colId:"compId",   width:"80",  align:"center", type:"combo"});
	gridMain.setUserData("","pk","no");
	gridMain.init(); 
	gridMain.cs_setColumnHidden(["empNo"]);
	
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	fn_startSetCombo();
	fn_search();
});

function fn_startSetCombo(){
	var combo01 = gridMain.getColumnCombo(2);
	fn_comboLoad(combo01,gridMain.getColumnId(2),"P001",2);
	var combo02 = gridMain.getColumnCombo(3);
	fn_comboLoad(combo02,gridMain.getColumnId(3),"P002",3);
	var combo03 = gridMain.getColumnCombo(4);
	fn_comboLoad(combo03,gridMain.getColumnId(4),"P003",4);
	var combo04 = gridMain.getColumnCombo(7);
	fn_comboLoad(combo04,gridMain.getColumnId(7),"P004",7);
	var combo05 = gridMain.getColumnCombo(8);
	fn_comboLoad(combo05,gridMain.getColumnId(8),"P005",8);
	var combo06 = gridMain.getColumnCombo(9);
	fn_comboLoad(combo06,gridMain.getColumnId(9),"004",9);
	var combo07 = gridMain.getColumnCombo(10);
	fn_comboLoad(combo07,gridMain.getColumnId(10),"P006",10);
	var combo08 = gridMain.getColumnCombo(11);
	fn_comboLoad(combo08,gridMain.getColumnId(11),"000",11);
}

function doOnRowSelect(id,ind){
	if(ind==5){
	gfn_load_pop('w1','common/deptCodePOP',true,{"postName":""});
	}
}
function fn_search(){
	var params = parent.fn_onOpenPop(config.id);
		empNo = params.empNo;
		compId = '100';
	 gfn_callAjaxForGrid(gridMain,params,"/erp/pers/pers/persAppointS/gridDtlSearch",subLayout.cells("a"));
}

function fn_save(){
	var jsonStr = gridMain.getJsonUpdated2();
    if (jsonStr == null || jsonStr.length <= 0) return;         		
        $("#jsonData").val(jsonStr);                      
        $.ajax({
           url : "/erp/pers/pers/persAppointS/gridDtlSave",
           type : "POST",
           data : $("#pform").serialize(),
           async : true,
           success : function(data) {
           MsgManager.alertMsg("INF001");
           fn_search();
            }
       }); 
}
function fn_remove(){
	for(var i=0; i<gridMain.getRowsNum();i++){
		gridMain.cs_deleteRow(gridMain.getRowId(i));	 
	 }
}
function fn_add(){
	 var totalColNum = gridMain.getColumnCount();
	    var data = new Array(totalColNum);
	    var balDateColIdx = gridMain.getColIndexById('balDate');
		var empNoColIdx = gridMain.getColIndexById('empNo');    
	        data[balDateColIdx] = dateformat(new Date());
	        data[empNoColIdx] = empNo;
		    gridMain.addRow(data);
}
function fn_delete(){
	 var rodid = gridMain.getSelectedRowId();
	 gridMain.cs_deleteRow(rodid);
}

function fn_comboLoad(comboId,inputName,params,colIndx){
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
		   {header: "구 분",   width: 100,  option: "#interName#"}
	    ]
	});
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
	var obj={};
	obj.compId = '100';
	obj.code = params;
	doOnOpen(comboId,obj,colIndx);
}

function doOnOpen(comboId,params,colIndx){
	$.ajax({
		"url":"/erp/cmm/InterCodeR",
		"type":"post",
		"data":params,
		"success" : function(data){
		  var list = data;
		  for(var i=0;i<list.length;i++){
			  comboId.addOption(list[i].interCode,list[i].interName);
		    }
		}
   });	
};

function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if(pName=="postCode"){
		for(i=0;i<data.length;i++){
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
		    gridMain.setCells2(gridMain.getSelectedRowIndex(),5).setValue(obj.postCode);
			gridMain.setCells2(gridMain.getSelectedRowIndex(),6).setValue(obj.postName);
		}		  
	}	  
 };
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>