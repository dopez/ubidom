<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var config={
		title:"코드검색",
		id:"codeLen2",
		width:"300",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"코드",   colId:"innerCode", 	width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"코드명", colId:"innerName", width:"140", align:"center", type:"ro"});
	gridMain.setUserData("","pk","empNo");
	gridMain.init();
	init_search();
});
function init_search(){
	var params = parent.fn_onOpenPop(config.id);
	$('#innerName').val(params.innerName);
	$('#kind').val(params.kind);
	loadGridMain(params);
}
 function fn_search(){
	 var obj = {}; 
	 obj.innerName =  $('#innerName').val();
	 obj.kind =  $('#kind').val();
	 loadGridMain(obj);
}
 function loadGridMain(params){
	 gfn_callAjaxForGrid(gridMain,params,"/erp/pop/len2",subLayout.cells("a"),fn_loadGridListCodeCB);
 }
 
function fn_loadGridListCodeCB(data) {
	if(data.length<1){
		parent.MsgManager.alertMsg("WRN011");
		parent.dhxWins.window("w1").close();
	}else if(data.length==1){
		  var innerCode = data[0].innerCode;
		  var innerName = data[0].innerName;
		  var arr = [{"innerCode":innerCode,"innerName":innerName}];
		  parent.fn_onClosePop(config.id,arr);
		  parent.dhxWins.window("w1").close();
	}else{
	   gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);	
	}
	
};

function doOnRowDblClicked(rId,cInd){
	  var row = rId-1;
	  var cell = cInd;
	  var innerCode = gridMain.setCells2(row,0).getValue();
	  var innerName = gridMain.setCells2(row,1).getValue();
	  var arr = [{"innerCode":innerCode,"innerName":innerName}];
	  parent.fn_onClosePop(config.id,arr);
	  parent.dhxWins.window("w1").close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		 <input type="hidden" id="kind" name="kind">
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label"  id="poplabel"for="textinput">
			 코드명
			</label>
			<div class="col-xs-6">
			  <input name="innerName" id="innerName" type="text" class="form-control input-xs">
			</div>
		</div>  
  </form>
</div>