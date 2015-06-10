<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var config={
		title:"부품코드",
		id:"partCode",
		width:"380",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//부품코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"부품코드", colId:"partCode", width:"100", align:"center", type:"ro"});
	gridMain.addHeader({name:"부품명",   colId:"partName", width:"100", align:"center", type:"ro"});
	gridMain.addHeader({name:"규격",     colId:"partSpec", width:"160", align:"center", type:"ro"});
	gridMain.setUserData("","pk","partCode");
	gridMain.setColSort("str");
	gridMain.init();
	gridMain.cs_setColumnHidden(["partUnit"]);
	fn_search();
});
function fn_search(){
	if($('#partName').val() == ''){
		$('#partName').val('%');
	}
	 var params = gfn_getFormElemntsData('frmSearch');
	  gfn_callAjaxForGrid(gridMain,params,"/erp/prod1/equi/historyS/partCodeSearch",subLayout.cells("a"),fn_loadGridListCodeCB);
}
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB() {
	$('#partName').val('');
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
};

function doOnRowDblClicked(rId,cInd){
	  var row = gridMain.getSelectedRowIndex();
	  var partCode = gridMain.setCells2(row,0).getValue();
	  var partName = gridMain.setCells2(row,1).getValue();
	  var partSpec = gridMain.setCells2(row,2).getValue();
	  var partUnit = gridMain.setCells2(row,3).getValue();
	  var arr = [{"partCode":partCode,"partName":partName,"partSpec":partSpec,"partUnit":partUnit}];
	  parent.fn_onClosePop(config.id,arr);
	  parent.dhxWins.window("w1").close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label" id="poplabel" for="textinput">
			 부품명
			</label>
			<div class="col-xs-6">
			  <input name="partName" id="partName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>  
  </form>
</div>
