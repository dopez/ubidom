<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var empNo;
var compId;
var config={
		title:"인사발령등록",
		id:"persCode",
		width:"980",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(0,[1,3,4,5,6],"1C");
	//인사발령등록 팝업
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"No",         colId:"no",       width:"5",  align:"center", type:"cntr"});
    gridMain.addHeader({name:"발령일",     colId:"balDate",  width:"10", align:"center", type:"dhxCalendarA"});
    gridMain.addHeader({name:"급여구분",   colId:"payGbn",   width:"7",  align:"center", type:"combo"});
    gridMain.addHeader({name:"근무구분",   colId:"serveGbn", width:"7",  align:"center", type:"combo"});
    gridMain.addHeader({name:"발령구분",   colId:"balGbn",   width:"7",  align:"center", type:"combo"});
    gridMain.addHeader({name:"부서코드",   colId:"postCode", width:"7",  align:"center", type:"ro"});
	gridMain.addHeader({name:"발령부서",   colId:"postName", width:"7",  align:"center", type:"ro"});
	gridMain.addHeader({name:"발령직군",   colId:"jikgun",   width:"7",  align:"center", type:"combo"});
	gridMain.addHeader({name:"발령직무",   colId:"jikmu",    width:"7",  align:"center", type:"combo"});
	gridMain.addHeader({name:"발령직위",   colId:"jikwee",   width:"7",  align:"center", type:"combo"});
	gridMain.addHeader({name:"발령직책",   colId:"jikchak",  width:"7",  align:"center", type:"combo"});
	gridMain.addHeader({name:"급여사업장", colId:"compId",   width:"7",  align:"center", type:"combo"});
	//가 저장될 gridColumns
	gridMain.addHeader({name:"사원번호",       colId:"empNo",      width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"급여구분코드",   colId:"payGbnNm",   width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"근무구분코드",   colId:"serveGbnNm", width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"발령구분코드",   colId:"balGbnNm",   width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"발령직군코드",   colId:"jikgunNm",   width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"발령직무코드",   colId:"jikmuNm",    width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"발령직위코드",   colId:"jikweeNm",   width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"발령직책코드",   colId:"jikchakNm",  width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"급여사업장코드", colId:"compIdNm",   width:"10", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","empNo");
	gridMain.init(); 
	gridMain.setColumnHidden(12,true);
	gridMain.setColumnHidden(13,true);
	gridMain.setColumnHidden(14,true);
	gridMain.setColumnHidden(15,true);
	gridMain.setColumnHidden(16,true);
	gridMain.setColumnHidden(17,true);
	gridMain.setColumnHidden(18,true);
	gridMain.setColumnHidden(19,true);
	gridMain.setColumnHidden(20,true);
	fn_search();
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	fn_startSetCombo();

});
function doOnRowSelect(id,ind){
	if(ind==5){
	gfn_load_pop('w1','common/deptCodePOP',true,{"postName":""});
	}
	gridMain.editCell();
}
function fn_search(){
	var params = parent.fn_onOpenPop(config.id);
		empNo = params.empNo;
		compId = params.compId;
	 gfn_callAjaxForGrid(gridMain,params,"/erp/pers/pers/persAppointS/selRight",subLayout.cells("a"),fn_loadGridListCB);
}
function fn_loadGridListCB(data){
	if(data == ''){
		return false;
	}else{
		for(var i = 0; i<data.length;i++){
			if(data[i].payGbn != null){
				   gridMain.setCells2(i,2).setValue(data[i].payGbnNm);
				   gridMain.setCells2(i,13).setValue(data[i].payGbn);
				}
				if(data[i].serveGbn  != null){
					gridMain.setCells2(i,3).setValue(data[i].serveGbnNm);
					gridMain.setCells2(i,14).setValue(data[i].serveGbn);
				}
				if(data[i].balGbn  != null){
					gridMain.setCells2(i,4).setValue(data[i].balGbnNm);
					gridMain.setCells2(i,15).setValue(data[i].balGbn);
			    }
				if(data[i].jikgun  != null){
					gridMain.setCells2(i,7).setValue(data[i].jikgunNm);
					gridMain.setCells2(i,16).setValue(data[i].jikgun);
			    }
				if(data[i].jikmu  != null){
					gridMain.setCells2(i,8).setValue(data[i].jikmuNm);
					gridMain.setCells2(i,17).setValue(data[i].jikmu);
				}
				if(data[i].jikchak != null){
					gridMain.setCells2(i,10).setValue(data[i].jikchakNm);
					gridMain.setCells2(i,19).setValue(data[i].jikchak);
				}
				if(data[i].compId  != null){
					gridMain.setCells2(i,11).setValue(data[i].compIdNm);
					gridMain.setCells2(i,20).setValue(data[i].compId);
				}
				if(data[i].jikwee  != null){
					gridMain.setCells2(i,9).setValue(data[i].jikweeNm);
					gridMain.setCells2(i,18).setValue(data[i].jikwee); 
				}
		}	
	}
}
function fn_save(){
	var jsonStr = gridMain.getJsonUpdated2();
    if (jsonStr == null || jsonStr.length <= 0) return;         		
        $("#jsonData").val(jsonStr);                      
        $.ajax({
           url : "/erp/pers/pers/persAppointS/prcsPersAppoint",
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
	if(MsgManager.confirmMsg("INF002")) { //삭제하시겠습니까?	
   	 var jsonStr = gridMain.getJsonMultiRowDelete();

        if (jsonStr == null || jsonStr.length <= 0) return;
         $("#jsonData").val(jsonStr);
           $.ajax({
             url : "/erp/pers/pers/persAppointS/prcsPersAppoint",
             type : "POST",
             data : $("#pform").serialize(),
             async : true,
             success : function(data) {
             MsgManager.alertMsg("INF003");
             fn_search();
              }
          });
   		
   }else{
   	MsgManager.alertMsg("WRN004");
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
	    var rodIdx = gridMain.getSelectedRowIndex();
	    if(gridMain.isDelRows(rodid)) {
	       if(MsgManager.confirmMsg("INF002")) {
	     	  if(gridMain.chkUnsavedRow(rodIdx,rodid)) {
	     		  return
	     	  }else{
	     		 var jsonStr = gridMain.getJsonRowDel(rodid);
	           if (jsonStr == null || jsonStr.length <= 0) return;
	            $("#jsonData").val(jsonStr);
	                $.ajax({
	                 url : "/erp/pers/pers/persAppointS/prcsPersAppoint",
	                 type : "POST",
	                 data : $("#pform").serialize(),
	                 async : true,
	                 success : function(data) {
	                 MsgManager.alertMsg("INF003");
	                 fn_search();
	                }
	            });
	     	   }   	 
	        } else {
	         	 MsgManager.alertMsg("WRN004");
	          } 
	     }else {
	         MsgManager.alertMsg("WRN002");
	      }
}
function fn_startSetCombo(){
	id = gridMain.getSelectedRowIndex();
	var combo01 = gridMain.getColumnCombo(2);
	fn_comboLoad(combo01,gridMain.getColumnId(2),id,"P001",2,13);
	var combo02 = gridMain.getColumnCombo(3);
	fn_comboLoad(combo02,gridMain.getColumnId(3),id,"P002",3,14);
	var combo03 = gridMain.getColumnCombo(4);
	fn_comboLoad(combo03,gridMain.getColumnId(4),id,"P003",4,15);
	var combo04 = gridMain.getColumnCombo(7);
	fn_comboLoad(combo04,gridMain.getColumnId(7),id,"P004",7,16);
	var combo05 = gridMain.getColumnCombo(8);
	fn_comboLoad(combo05,gridMain.getColumnId(8),id,"P005",8,17);
	var combo06 = gridMain.getColumnCombo(9);
	fn_comboLoad(combo06,gridMain.getColumnId(9),id,"004",9,18);
	var combo07 = gridMain.getColumnCombo(10);
	fn_comboLoad(combo07,gridMain.getColumnId(10),id,"P006",10,19);
	var combo08 = gridMain.getColumnCombo(11);
	fn_comboLoad(combo08,gridMain.getColumnId(11),id,"000",11,20);
}
function fn_comboLoad(comboId,inputName,rowId,params,colIndx,mockIndx){
	comboId.setTemplate({
	    input: "#interCode#",
	    input: "#interName#",
	    columns: [
	       {header: "내부코드", width: 100,  option: "#interCode#"},
		   {header: "코드명",   width: 100,  option: "#interName#"}
	    ]
	});
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
	var obj={};
	obj.compId = compId;
	obj.code = params;
	doOnOpen(comboId,obj,colIndx,mockIndx);
}
function doOnOpen(comboId,params,colIndx,mockIndx){
		$.ajax({
			"url":"/erp/cmm/InterCodeR",
			"type":"post",
			"data":params,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
				comboId.addOption([
				  {value: i, text:
				  {interCode: list[i].interCode,
				   interName: list[i].interName}}   
				   ]);	
			    }
			}
	  });
 	comboId.attachEvent("onClose", function() {
	gridMain.setCells2(gridMain.getSelectedRowIndex(),colIndx).setValue(comboId.getSelectedText().interName);
	gridMain.setCells2(gridMain.getSelectedRowIndex(),mockIndx).setValue(comboId.getSelectedText().interCode);
	});	
};
function fn_onOpenPop(pName){
	var value;
	if(pName=="postCode"){
		value =  '';
	 }
	return value;
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