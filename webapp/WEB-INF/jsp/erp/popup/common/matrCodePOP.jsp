<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var config={
		title:"자재코드",
		id:"matrCode",
		width:"300",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//자재코드
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"자재코드",   colId:"matrCode", 	width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"자재명", colId:"matrName", width:"140", align:"center", type:"ro"});
	gridMain.setUserData("","pk","matrCode");
	gridMain.init();
	fn_search();
});
 function fn_search(){
	 var params = "matrName=" + $("#matrName").val();
	  gfn_callAjaxForGrid(gridMain,params,"/erp/rndt/stan/bomS/matrCodePop",subLayout.cells("a"),fn_loadGridListCodeCB);
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
	  var arr = [{"matrCode":matrCode,"matrName":matrName}];
	  parent.fn_onClosePop(config.id,arr);
	  parent.dhxWins.window("w1").close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label"  id="poplabel"for="textinput">
			 자재명
			</label>
			<div class="col-xs-6">
			  <input name="matrName" id="matrName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>  
  </form>
</div>