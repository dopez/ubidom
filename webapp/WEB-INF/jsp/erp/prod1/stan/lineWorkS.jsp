<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var rowSelVal;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,5,6],"2U");
	//라인작업등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
	
    subLayout.cells("a").setWidth(253);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"라인코드", colId:"lineCode",  width:"100", align:"left",   type:"ro"});
	gridMst.addHeader({name:"라인명",   colId:"lineName",  width:"150", align:"left",   type:"ro"});
	gridMst.setUserData("","pk","no");
	gridMst.setColSort("str");
	gridMst.init(); 
	gridMst.attachEvent("onRowSelect",doOnMstRowSelect);
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"NO",         colId:"no",        width:"50", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"라인코드",   colId:"lineCode",  width:"70", align:"left",   type:"ed"});
	gridDtl.addHeader({name:"라인명",     colId:"lineName",  width:"90", align:"left",   type:"ed"});
	gridDtl.addHeader({name:"주생산제품", colId:"matrCode",  width:"90", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"인원",       colId:"person",    width:"90", align:"right",  type:"edn"});
	gridDtl.addHeader({name:"일생산수량", colId:"dayAmount", width:"90", align:"right",  type:"edn"});
	gridDtl.addHeader({name:"적용날짜",   colId:"regDate",   width:"90", align:"center", type:"dhxCalendarA"});
	gridDtl.setUserData("","pk","no");
	gridDtl.dxObj.setUserData("","@regDate","format_date");
	gridDtl.setColSort("str");
	gridDtl.init(); 
	gridDtl.cs_setNumberFormat(["person","dayAmount"]);

	$("#lineCode,#lineName").keyup(function(e) {
    	if(e.target.id == "lineCode"){
    		gridMst.filterBy(0,byId("lineCode").value);
		}
    	if(e.target.id == "lineName"){
    		gridMst.filterBy(1,byId("lineName").value);
		}
	 });
	
	fn_search();
	
	cs_tab_close(gridDtl,7);
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
	var lineCodeValue = null;
	var lineCodeIdx = gridDtl.getColIndexById('lineCode');
	var RowsNum =  gridDtl.getRowsNum();
	if(RowsNum == 0){
		lineCodeValue = '';
	}else{
		lineCodeValue = gridDtl.setCells2(0,lineCodeIdx).getValue();
	}
	var totalColNum = gridDtl.getColumnCount();
    var data = new Array(totalColNum);
    var lineCodeIdx = gridDtl.getColIndexById("lineCode");
    var regDateColIdx = gridDtl.getColIndexById('regDate');
	    data[lineCodeIdx] = lineCodeValue;
		data[regDateColIdx] = dateformat(new Date());
        gridDtl.addRow(data);
}

function fn_delete(){
	var rodid = gridDtl.getSelectedRowId();
    gridDtl.cs_deleteRow(rodid);
}

 function fn_save(){
	var rowIdx = gridDtl.getSelectedRowIndex();
	var colIdx = gridDtl.getColIndexById('lineCode');
	rowSelVal=gridDtl.setCells2(rowIdx, colIdx).getValue();
	
	 var jsonStr = gridDtl.getJsonUpdated2();
	 if (jsonStr == null || jsonStr.length <= 0) return;         		
	    $("#jsonData").val(jsonStr);                      
	    $.ajax({
	         url : "/erp/prod1/stan/lineWorkS/gridDtlSave",
	         type : "POST",
	         data : $("#pform").serialize(),
	         async : true,
	         success : function(data) {
	        	 MsgManager.alertMsg("INF001");
		         fn_search(); 
		         rowSelVal = null;
	         }
	  });
 } 

function doOnMstRowSelect(id,ind){
	var lineCodeIdx = gridMst.getColIndexById('lineCode');
	var obj = {};
	obj.lineCode= gridMst.setCells(id,lineCodeIdx).getValue();
	fn_loadGridDtl(obj);
	fn_cellChange(2);
}

function fn_search(){
	 gridDtl.clearAll();
	 gridDtl.parse("","js");
	fn_loadGridMst();
}

function fn_loadGridMst() {
	gfn_callAjaxForGrid(gridMst,{},"gridMstSearch",subLayout.cells("a"),fn_loadGridMstCB); 
};

function fn_loadGridMstCB(data) {
	 fn_cellChange(2);
	 if(data != ''){ 
	var rowIdx = cs_selectRow_check(gridMst,"lineCode",rowSelVal)
		gridMst.selectRow(rowIdx,true,true,true);
	 }
};

// dept 조회로직
function fn_loadGridDtl(params) {
  gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"));  
};

</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">	
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
		   <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
		    부서코드
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="lineCode" id="lineCode" value="" placeholder="" class="form-control input-xs">
			</div>
           <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
		    부서명
		   </label>
			<div class="col-sm-2 col-md-2">
			 <input type="text" name="lineName" id="lineName" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	    </div>
      </div>     
  </form>
 </div> 
</div>