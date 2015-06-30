<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var combo;
var postCodeVal;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,5,6,11],"2U");
	//부서등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	subLayout.cells("a").setWidth(253);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"부서코드", colId:"postCode", width:"100", align:"center", type:"ro"});
	gridMst.addHeader({name:"부서명", 	colId:"postName", width:"150", align:"center", type:"ro"});
	gridMst.setUserData("","pk","postCode");
	gridMst.setColSort("str");
	gridMst.init(); 
	gridMst.attachEvent("onRowSelect",doOnRowSelect);
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"NO",       colId:"no",       width:"50", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"부서코드", colId:"postCode", width:"90", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"시작일",   colId:"stDate",   width:"90", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"종료일", 	colId:"endDate",  width:"90", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"부서명",   colId:"postName", width:"90", align:"left",   type:"ed"});
	gridDtl.addHeader({name:"원가구분", colId:"costKind", width:"90", align:"left",   type:"combo"});
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
	
	$("#postName").keyup(function(e) {
    	if(e.target.id == "postName"){
    		gridMst.filterBy(1,byId("postName").value);
		}
	 }); 

   combo =gridDtl.getColumnCombo(5);
   gfn_single_comboLoad(combo,["판관","제조"],["판관","제조"],2);
   
   fn_search();
   
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
	 gridDtl.parse("","js");
     fn_cellChange(1);       
}
function fn_add(){
	var postCodeValue = null;
	var postCodeIdx = gridDtl.getColIndexById('postCode');
	var RowsNum =  gridDtl.getRowsNum();
	if(RowsNum == 0){
		postCodeValue = '';
	}else{
	   postCodeValue = gridDtl.setCells2(0,postCodeIdx).getValue();
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
	var rowIdx = gridDtl.getSelectedRowIndex();
	var colIdx = gridDtl.getColIndexById('postCode');
	    postCodeVal=gridDtl.setCells2(rowIdx, colIdx).getValue();
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
	var postCodeIdx = gridMst.getColIndexById('postCode');
	var postNameIdx = gridMst.getColIndexById('postName');
	var obj = {};
	obj.postCode= gridMst.setCells(id,postCodeIdx).getValue();
	obj.postName= gridMst.setCells(id,postNameIdx).getValue();
	fn_loadGridDtl(obj);
	fn_cellChange(2);
}

function fn_search(){
	fn_loadGridMst();
}

function fn_loadGridMst() {
	var params ="postName=" + $("#postName").val();
	gfn_callAjaxForGrid(gridMst,params,"gridMstSearch",subLayout.cells("a"),fn_loadGridMstCB); 
};

function fn_loadGridMstCB(data) {
	 fn_cellChange(2);
	var rowIdx = cs_selectRow_check(gridMst,"postCode",postCodeVal)
		gridMst.selectRow(rowIdx,true,true,true);
};

// dept 조회로직
function fn_loadGridDtl(params) {
  gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"));  
};

function fn_exit(){
	var exitVal = cs_close_event([gridDtl]);
	if(exitVal){
		mainTabbar.tabs(ActTabId).close();	
	}else{
		if(MsgManager.confirmMsg("WRN012")){
			mainTabbar.tabs(ActTabId).close();	
		}else{
			return true;
		}
	} 
}
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