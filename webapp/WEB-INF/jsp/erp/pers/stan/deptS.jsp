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
	fn_search();
	
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
   
	$("#postName").dblclick(function(){
		gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
		
	});

  	combo.attachEvent("onClose", function() {
		gridDtl.setCells2(gridDtl.getSelectedRowIndex(gridDtl.getSelectedRowId()),5).setValue(combo.getSelectedText().costKind);
	});
		



});

function fn_add(){
    var totalColNum = gridDtl.getColumnCount();
    var data = new Array(totalColNum);
    var noColIdx = gridDtl.getColIndexById("no");
    var stDateColIdx = gridDtl.getColIndexById('stDate');
    var endDateColIdx = gridDtl.getColIndexById('endDate');
	 var data = new Array(totalColNum);
	    data[noColIdx] = gridDtl.getRowsNum()+1;
		data[stDateColIdx] = dateformat2(new Date());
		data[endDateColIdx] = "9999/12/31";
       gridDtl.addRow(data);
}
function fn_delete(){
      var rodIdx = gridDtl.getSelectedRowId();
      var rodid = gridDtl.getSelectedRowIndex();
      if(gridDtl.isDelRows(rodIdx)) {
         if(MsgManager.confirmMsg("INF002")) {
       	  if(gridDtl.chkUnsavedRow()) {
       		  var jsonStr = gridDtl.getJsonRowDel(rodIdx);
                 if (jsonStr == null || jsonStr.length <= 0) return;
                 $("#jsonData").val(jsonStr);
                     $.ajax({
                      url : "/erp/deptS/prcsDept",
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

function fn_save(){
	  var jsonStr = gridDtl.getJsonUpdated2();
	    if (jsonStr == null || jsonStr.length <= 0) return;        		
	        $("#jsonData").val(jsonStr);                      
	        $.ajax({
	           url : "/erp/deptS/prcsDept",
	           type : "POST",
	           data : $("#pform").serialize(),
	           async : true,
	           success : function(data) {
	           MsgManager.alertMsg("INF001");
	           fn_loadGridListCode();
	            }
	       });
}
function doOnRowSelect(id,ind){
	var obj = {};
	obj.postCode= gridMst.setCells(id,0).getValue();
	obj.postName= gridMst.setCells(id,1).getValue();
	
	fn_loadGridList(obj);
}
function fn_comboReadOnly(combo){
	combo.attachEvent("onChange", function(){
	combo.allowFreeText(false);
	combo.readonly(true);
	combo.enableFilteringMode(false);
	combo.enableAutocomplete(false);
	});
};	
function fn_search(){
	fn_loadGridListCode();
}
// dept 조회로직
function fn_loadGridList(params) {
	    gfn_callAjaxForGrid(gridDtl,params,"/erp/deptS",subLayout.cells("b"),fn_loadGridListCB);
};

//get방식 deptCode 조회로직
function fn_loadGridListCode() {
	var params ="postName=" + $("#postName").val();
	gfn_callAjaxForGrid(gridMst,params,"/erp/deptS/selDeptCode",subLayout.cells("a"),fn_loadGridListCodeCB); 
};

 // fn_loadGridList callback 함수
function fn_loadGridListCB() {

};
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB(data) {
	var obj={};
	obj.postName=data[0].postName;
	obj.postCode=data[0].postCode;
	fn_loadGridList(obj);
};

function fn_onOpenPop(){
	var value =  $("#postName").val();
	return value;
};

function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		var i;
		for(i=0;i<data.length;i++){
			var params =  "postName=" + data[i].postName;
			gfn_callAjaxForGrid(gridMst,params,"/erp/deptS/selDeptCode",subLayout.cells("a"),"INF004");
			fn_loadGridList(data[i].postCode,data[i].postName);
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