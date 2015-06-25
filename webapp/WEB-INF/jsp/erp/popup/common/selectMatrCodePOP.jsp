<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var config={
		title:"자재코드",
		id:"selMatrCode",
		width:"580",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(2,[1],"1C");
	//자재코드
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"품목코드",   colId:"matrCode", 	width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"품목명", colId:"matrName", width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"규격", colId:"matrSpec", width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"단위", colId:"matrUnit", width:"140", align:"center", type:"ro"});
	gridMain.setUserData("","pk","matrCode");
	gridMain.init();
	fn_search();
});
 function fn_search(){
	 var obj={};
	 obj.matrName = $("#matrName").val();
	 obj.matrGubn = $(':radio[name="matrGubn"]:checked').val();
	  gfn_callAjaxForGrid(gridMain,obj,"/erp/rndt/stan/bomS/selectMatrCodePop",subLayout.cells("a"),fn_loadGridListCodeCB);
}
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB() {
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
};

function doOnRowDblClicked(rId,cInd){
	  var row = rId-1;
	  var cell = cInd;
	  var matrCode = gridMain.setCells2(row,0).getValue();
	  var matrName = gridMain.setCells2(row,1).getValue();
	  var matrSpec = gridMain.setCells2(row,2).getValue();
	  var matrUnit = gridMain.setCells2(row,3).getValue();
	  var arr = [{"matrCode":matrCode,"matrName":matrName,"matrSpec":matrSpec,"matrUnit":matrUnit}];
	  parent.fn_onClosePop(config.id,arr);
	  parent.dhxWins.window("w1").close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label"  id="poplabel"for="textinput">
			 품목명
			</label>
			<div class="col-xs-6">
			  <input name="matrName" id="matrName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div> 
		<div class="form-group form-group-sm" style="width: 400px;">
		   <label class="col-xs-2 control-label"  id="poplabel"for="textinput">
			 구분
			</label>
			<div class="col-xs-2">
			  <input name="matrGubn" id="matrGubn" type="radio" value="%" checked="checked">전체
			</div>
			<div class="col-xs-2">
			  <input name="matrGubn" id="matrGubn" type="radio" value="1">자재
			</div>
			<div class="col-xs-2">
			  <input name="matrGubn" id="matrGubn" type="radio" value="2">모재
			</div>
			<div class="col-xs-2">
			  <input name="matrGubn" id="matrGubn" type="radio" value="3">포장
			</div>
		</div>  
  </form>
</div>