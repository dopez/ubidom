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
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"부서코드", colId:"postCode", width:"15", align:"center", type:"ed"});
	gridDtl.addHeader({name:"시작일", colId:"stDate", width:"15", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"종료일", 	colId:"endDate", width:"15", align:"center", type:"ro"});
	gridDtl.addHeader({name:"부서명", colId:"postName", width:"20", align:"center", type:"ed"});
	gridDtl.addHeader({name:"원가구분", colId:"costKind", width:"10", align:"center", type:"combo"});
	gridDtl.setColSort("str");
	gridDtl.init();
	
	fn_loadGridList();
	
	var combo=gridDtl.getColumnCombo(5);
	combo.load({
		template: {
		    input: "#costKind#",
		    columns: [
		        {header: "원가구분", width: 110,  option: "#costKind#"}
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
	    	  fn_loadGridList2();
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
	           fn_loadGridList();
	            }
	       });
	      }
	 });
	
	//한줄추가
	 toolbar.attachEvent("onClick", function(id) {
	   if (id == "btn5") {
	     var totalColNum = gridDtl.getColumnCount();
	     var data = new Array(totalColNum);
	     var stDateColIdx = gridDtl.getColIndexById('stDate');
	     var endDateColIdx = gridDtl.getColIndexById('endDate');
		 var data = new Array(totalColNum);
			data[stDateColIdx] = dateformat2(new Date());
			data[endDateColIdx] = "99991231";
	        gridDtl.addRow(data, 0, 5);
	       }
	   });

});
//get방식 조회로직
function fn_loadGridList() {
	 var params = "postName=" + $("#postName").val();
	    gfn_gridLoad("/erp/dept",params, gridMst, fn_deptCallBack);
	    gfn_gridLoad("/erp/dept",params, gridDtl, fn_deptCallBack);
};
function fn_loadGridList2() {
	 var params = "postName=" + $("#postName").val();
	 gfn_callAjaxForGrid(gridDtl,params,"/erp/dept/prsSelDept",subLayout.cells("b"),"INF004");
};
 //callback 함수
function fn_deptCallBack() {

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
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			</div>
		  </div>
	  </div>
	</div>           
  </form>
 </div> 
</div>