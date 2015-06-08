<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,5,6],"2U");
	//부서등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	subLayout.cells("a").setWidth(250);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"부서코드", colId:"postCode", width:"49", align:"center", type:"ro"});
	gridMst.addHeader({name:"부서명", 	colId:"postName", width:"49", align:"center", type:"ro"});
	gridMst.setUserData("","pk","postCode");
	gridMst.setColSort("str");
	gridMst.init(); 
	gridMst.attachEvent("onRowSelect",doOnRowSelect);
	fn_loadGridListCode(1);
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"NO",       colId:"no",       width:"5",  align:"center", type:"cntr"});
	gridDtl.addHeader({name:"부서코드", colId:"postCode", width:"10", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"시작일",   colId:"stDate",   width:"10", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"종료일", 	colId:"endDate",  width:"10", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"부서명",   colId:"postName", width:"10", align:"left",   type:"ed"});
	gridDtl.addHeader({name:"원가구분", colId:"costKind", width:"10", align:"left",   type:"combo"});
	gridDtl.setUserData("","pk","postCode");
	gridDtl.dxObj.setUserData("","@stDate","format_date");
	gridDtl.dxObj.setUserData("","@endDate","format_date"); 
	gridDtl.setColSort("str");
	gridDtl.init();
	
	g_dxRules = {
			postCode : [r_notEmpty, r_len + "|5"],
			stDate : [r_notEmpty],
			endDate : [r_notEmpty],
			postName : [r_notEmpty],
			costKind : [r_notEmpty]
		};
	
	gridDtl.attachEvent("onEmptyClick",doOnEmptyClick);

	var combo=gridDtl.getColumnCombo(5);
	combo.setTemplate({
		    input: "#costKind#",
		    columns: [
		        {header: "원가구분", width: 100,  option: "#costKind#"}
		    ]
	}); 
	combo.addOption("판관","판관");
	combo.addOption("제조","제조");

   combo.enableFilteringMode(true);
   combo.enableAutocomplete(true);
   combo.allowFreeText(true);
   
	$("#postName").dblclick(function(){
		gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$("#postName").val()});
	});
  	
});
function fn_cellChange(flag){
	if(flag==1){
		gridDtl.setColumnExcellType(1,"ed");
	  }else{
		gridDtl.setColumnExcellType(1,"ro");
	  }
 }

function fn_new(){
	 gridDtl.clearAll();
	 fn_addRow(1);
     fn_cellChange(1);       
}
function fn_add(){
	fn_addRow(2);
}

function fn_addRow(flag){
	var postCodeValue;
	 if(flag ==1){
		postCodeValue = "";
	}else{
		postCodeValue = gridDtl.setCells2(0,1).getValue();
	}
	 var totalColNum = gridDtl.getColumnCount();
	    var data = new Array(totalColNum);
	    var postCodeIdx = gridDtl.getColIndexById("postCode");
	    var stDateColIdx = gridDtl.getColIndexById('stDate');
	    var endDateColIdx = gridDtl.getColIndexById('endDate');
		    data[postCodeIdx] = postCodeValue;
			data[stDateColIdx] = dateformat(new Date());
			data[endDateColIdx] = "9999/12/31";
	        gridDtl.addRow(data);
}

function fn_delete(){
      var rodid = gridDtl.getSelectedRowId();
      gridDtl.cs_deleteRow(rodid);
}

 function fn_save(){
	 var jsonStr = gridDtl.getJsonUpdated2();
	 if (jsonStr == null || jsonStr.length <= 0) return;         		
	    $("#jsonData").val(jsonStr);                      
	    $.ajax({
	         url : "/erp/pers/stan/deptS/gridDtlSave",
	         type : "POST",
	         data : $("#pform").serialize(),
	         async : true,
	         success : function(data) {
	         MsgManager.alertMsg("INF001");
	         fn_search();
	         }
	  });
 } 
 
function doOnRowSelect(id,ind){
	var obj = {};
	obj.postCode= gridMst.setCells(id,0).getValue();
	obj.postName= gridMst.setCells(id,1).getValue();
	fn_loadGridList(obj,2);
	fn_cellChange(2);
}

function doOnEmptyClick(ev){
	gridDtl.clearSelection();
}

function fn_search(){
	fn_loadGridListCode(1);
	fn_cellChange(2); 
}
// dept 조회로직
function fn_loadGridList(params,flag) {
		var callbackFn;
		if(flag == 1){
			gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"),fn_loadGridListCB);
		}else{
			gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"));
		}
	    
};

// deptCode 조회로직
function fn_loadGridListCode(flag) {
	var params ="postName=" + $("#postName").val();
	var callbackFn;
	if(flag == 1){
		gfn_callAjaxForGrid(gridMst,params,"gridMstSearch",subLayout.cells("a"),fn_loadGridListCodeCB); 
	}else{
		gfn_callAjaxForGrid(gridMst,params,"gridMstSearch",subLayout.cells("a")); 
	}
};

 // fn_loadGridList callback 함수
function fn_loadGridListCB(data) {
	var obj={};
	obj.postName=data[0].postName;
	obj.postCode=data[0].postCode;
	fn_loadGridListCode(obj,2);
};
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB(data) {
	var obj={};
	obj.postName=data[0].postName;
	obj.postCode=data[0].postCode;
	fn_loadGridList(obj,2);
};

function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		var i;
		var obj={};
		for(i=0;i<data.length;i++){
			var params =  "postName=" + data[i].postName;
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			fn_loadGridListCode(obj,1);
			$("#postName").val(obj.postName);
		}		  
	}	  
 };

</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>           
  </form>
 </div> 
</div>