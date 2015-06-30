<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var config={
		title:"자재/품목코드",
		id:"itemAllCode",
		width:"470",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(2,[1],"1C");
	//제품코드 팝업
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"품목코드", colId:"innerCode", width:"150", align:"center", type:"ro"});
	gridMain.addHeader({name:"품목명",   colId:"innerName", width:"100", align:"center", type:"ro"});
	gridMain.addHeader({name:"규격",     colId:"spec",      width:"100", align:"center", type:"ro"});
	gridMain.addHeader({name:"단위",     colId:"unit",      width:"100", align:"center", type:"ro"});
	gridMain.setUserData("","pk","");
	gridMain.init();
	gridMain.cs_setColumnHidden(["packUnit"]);
	fn_search();
});
 function fn_search(){
	 var obj={};
	   obj.innerName = $("#itemName").val();
	   obj.kind = $(':radio[name="kind"]:checked').val();
	  gfn_callAjaxForGrid(gridMain,obj,"/erp/pop/itemAllCode",subLayout.cells("a"),fn_loadGridListCodeCB);
}

function fn_loadGridListCodeCB(data) {
	if(data.length<1){
		parent.MsgManager.alertMsg("WRN011");
		parent.dhxWins.window("w1").close();
	}else if(data.length==1){
		  var itemCode = data[0].innerCode;
		  var itemName = data[0].innerName;
		  var itemSpec = data[0].spec;
		  var itemUnit = data[0].unit;
		  var itemUnit = data[0].unit;
		  var arr = [{"innerCode":itemCode,"innerName":itemName,"spec":itemSpec,"unit":itemUnit,"packUnit":''}];
		  parent.fn_onClosePop(config.id,arr);
		  parent.dhxWins.window("w1").close();
	}else{
		gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);	
	}
};

function doOnRowDblClicked(rId,cInd){
	  var row = rId-1;
	  var cell = cInd;
	  var itemCode = gridMain.setCells2(row,0).getValue();
	  var itemName = gridMain.setCells2(row,1).getValue();
	  var itemSpec = gridMain.setCells2(row,2).getValue();
	  var itemUnit = gridMain.setCells2(row,3).getValue();
	  var packUnit = gridMain.setCells2(row,4).getValue();
	  var arr = [{"innerCode":itemCode,"innerName":itemName,"spec":itemSpec,"unit":itemUnit,"packUnit":packUnit}];
	  parent.fn_onClosePop(config.id,arr);
	  parent.dhxWins.window("w1").close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label" id="poplabel" for="textinput">
			 품목명
			</label>
			<div class="col-xs-6">
			  <input name="itemName" id="itemName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div> 
		<div class="form-group form-group-sm" style="width: 300px;">
		   <label class="col-xs-2 control-label"  id="poplabel"for="textinput">
			 구분
			</label>
			<div class="col-xs-2">
			  <input name="kind" id="kind" type="radio" value="1" checked="checked">자재
			</div>
			<div class="col-xs-2">
			  <input name="kind" id="kind" type="radio" value="2">품목
			</div>
		</div>  
  </form>
</div>