<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var config={
		title:"설비코드",
		id:"equiCode",
		width:"300",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//설비코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"설비코드", colId:"equiCode", width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"설비명",   colId:"equiName", width:"140", align:"center", type:"ro"});
	gridMain.setUserData("","pk","equiCode");
	gridMain.setColSort("str");
	gridMain.init();
	fn_search();
});
function fn_search(){
	if($('#equiName').val() == ''){
		$('#equiName').val('%');
	}
	 var params = gfn_getFormElemntsData('frmSearch');
	  gfn_callAjaxForGrid(gridMain,params,"/erp/prod1/equi/historyS/equiCodeSearch",subLayout.cells("a"),fn_loadGridListCodeCB);
}
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB() {
	$('#equiName').val('');
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
};

function doOnRowDblClicked(rId,cInd){
	  var row = rId-1;
	  var cell = cInd;
	  var equiCode = gridMain.setCells2(row,0).getValue();
	  var arr = [{"equiCode":equiCode}];
	  parent.fn_onClosePop(config.id,arr);
	  parent.dhxWins.window("w1").close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label" id="poplabel" for="textinput">
			 설비명
			</label>
			<div class="col-xs-6">
			  <input name="equiName" id="equiName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>  
  </form>
</div>