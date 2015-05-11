<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(1,[1,3,5,6],"2U");
	//부서등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	subLayout.cells("a").setWidth(400);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"부서코드", colId:"postCode", width:"50", align:"center", type:"ro"});
	gridMst.addHeader({name:"부서명", 	colId:"postName", width:"50", align:"center", type:"ro"});
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","postCode");
	gridMst.init(); 
	gridMst.attachEvent("onRowSelect",doOnRowSelect);
	
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"NO", colId:"no", width:"5", align:"center", type:"ro"});
	gridDtl.addHeader({name:"부서코드", colId:"postCode", width:"15", align:"center", type:"ed"});
	gridDtl.addHeader({name:"시작일", colId:"stDate", width:"15", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"종료일", 	colId:"endDate", width:"15", align:"center", type:"ro"});
	gridDtl.addHeader({name:"부서명", colId:"postName", width:"20", align:"center", type:"ed"});
	gridDtl.addHeader({name:"원가구분", colId:"costKind", width:"10", align:"center", type:"combo"});
	gridDtl.setColSort("str");
	gridDtl.setUserData("","pk","postCode");
	gridDtl.init();
	fn_loadGridListCode();
	
	function doOnRowSelect(id,ind){
		var postCode = gridMst.setCells2(gridMst.getSelectedRowIndex(gridMst.getSelectedRowId()),0).getValue();
		var postName = gridMst.setCells2(gridMst.getSelectedRowIndex(gridMst.getSelectedRowId()),1).getValue();
		fn_loadGridList(postCode,postName);
	}
	
	var combo=gridDtl.getColumnCombo(5);
	combo.load({
		template: {
		    input: "#costKind#",
		    columns: [
		        {header: "원가구분", width: 100,  option: "#costKind#"}
		    ]
		},
		options: [
          {value: 1, text:{costKind: "판관"}},
          {value: 2, text:{costKind: "제조"}}
		]
	}); 
   combo.enableFilteringMode(true);
   combo.enableAutocomplete(true);
   combo.allowFreeText(true);
   
   function fn_comboReadOnly(combo){
		combo.attachEvent("onChange", function(){
		combo.allowFreeText(false);
		combo.readonly(true);
		combo.enableFilteringMode(false);
		combo.enableAutocomplete(false);
	});
  };	
  combo.attachEvent("onClose", function() {
		gridDtl.setCells2(gridDtl.getSelectedRowIndex(gridDtl.getSelectedRowId()),5).setValue(combo.getSelectedText().costKind);
	});
		
	//조회
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	    	  fn_loadGridListCode();
	      }
	});
	
	//저장 - 수정
	toolbar.attachEvent("onClick", function(id) {
	  if (id == "btn3") {
	  var jsonStr = gridDtl.getJsonUpdated2();
	    if (jsonStr == null || jsonStr.length <= 0) return;        		
	        $("#jsonData").val(jsonStr);                      
	        $.ajax({
	           url : "/erp/dept/prcsDept",
	           type : "POST",
	           data : $("#pform").serialize(),
	           async : true,
	           success : function(data) {
	           MsgManager.alertMsg("INF001");
	           fn_loadGridListCode();
	            }
	       });
	      }
	 });
	
	//한줄추가
	 toolbar.attachEvent("onClick", function(id) {
	   if (id == "btn5") {
	     var totalColNum = gridDtl.getColumnCount();
	     var data = new Array(totalColNum);
	     var noColIdx = gridDtl.getColIndexById("no");
	     var stDateColIdx = gridDtl.getColIndexById('stDate');
	     var endDateColIdx = gridDtl.getColIndexById('endDate');
		 var data = new Array(totalColNum);
		    data[noColIdx] = gridDtl.getRowsNum()+1;
			data[stDateColIdx] = dateformat2(new Date());
			data[endDateColIdx] = "99991231";
	        gridDtl.addRow(data, gridDtl.getRowsNum()+1, 5);
	       }
	   });
	
	//한줄삭제
	   toolbar.attachEvent("onClick", function(id) {
	    if (id == "btn6") {
	       var rodIdx = gridDtl.getSelectedRowId();
	       var rodid = gridDtl.getSelectedRowIndex();
	       if(gridDtl.isDelRows(rodIdx)) {
	          if(MsgManager.confirmMsg("INF002")) {
	        	  if(gridDtl.chkUnsavedRow()) {
	        		  var jsonStr = gridDtl.getJsonRowDel(rodIdx);
	                  if (jsonStr == null || jsonStr.length <= 0) return;
	                  $("#jsonData").val(jsonStr);
	                      $.ajax({
	                       url : "/erp/dept/prcsDept",
	                       type : "POST",
	                       data : $("#pform").serialize(),
	                       async : true,
	                       success : function(data) {
	                       MsgManager.alertMsg("INF003");
	                       fn_loadGridList();
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
	  });

});
//get방식 dept 조회로직
function fn_loadGridList(code,name) {
	var params =  "postCode=" + code;
		params += "&postName=" + name;
	    gfn_callAjaxForGrid(gridDtl,params,"/erp/dept",subLayout.cells("b"),"INF004");
};

//get방식 deptCode 조회로직
function fn_loadGridListCode() {
	    gfn_gridLoad("/erp/dept/selDeptCode",[], gridMst, fn_loadGridListCodeCB);
};

 // fn_loadGridList callback 함수
function fn_loadGridListCB() {

};
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB() {
	fn_loadGridList('11100','임원');
};

function fn_onOpenPop(){
	var value =  $("#postName").val();
	return value;
};

  function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		var i;
		for(i=0;i<data.length;i++){
			 gridMst.setCells2(gridMst.getSelectedRowIndex(),0).setValue(data[i].postCode);
			 gridMst.setCells2(gridMst.getSelectedRowIndex(),1).setValue(data[i].postName);
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
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_pop('w1','common/deptCodePOP',true)">
			</div>
		  </div>
	  </div>
	</div>           
  </form>
 </div> 
</div>