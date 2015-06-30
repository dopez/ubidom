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
    gridMain.addHeader({name:"품목코드", colId:"innerCode", width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"품목명",   colId:"innerName", width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"규격",     colId:"spec",      width:"140", align:"center", type:"ro"});
	gridMain.addHeader({name:"단위",     colId:"unit",      width:"140", align:"center", type:"ro"});
	gridMain.setUserData("","pk","");
	gridMain.init();
	init_search();
});
function init_search(){
	var params = parent.fn_onOpenPop(config.id);
	$('#innerName').val(params.matrName);
	$('input:radio[name=gubn]:input[value='+params.matrGubn+']').attr("checked", true);
	var obj={};
	obj.innerName = params.matrName;
	 obj.gubn = params.matrGubn;
	loadGridMain(obj);
}

 function fn_search(){
	 var obj={};
	 obj.innerName = $("#innerName").val();
	 obj.gubn = $(':radio[name="gubn"]:checked').val();
	 loadGridMain(obj);
}
 function loadGridMain(params){
	 gfn_callAjaxForGrid(gridMain,params,"/erp/pop/selectMatrCode",subLayout.cells("a"),fn_loadGridListCodeCB);
 }
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB(data) {
	if(data.length<1){
		parent.MsgManager.alertMsg("WRN011");
		parent.dhxWins.window("w1").close();
	}else if(data.length==1){
		  var matrCode = data[0].innerCode;
		  var matrName = data[0].innerName;
		  var matrSpec = data[0].spec;
		  var matrUnit = data[0].unit;
		  var arr = [{"innerCode":matrCode,"innerName":matrName,"spec":matrSpec,"unit":matrUnit}];
		  parent.fn_onClosePop(config.id,arr);
		  parent.dhxWins.window("w1").close();
	}else{
	   gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);	
	}
};

function doOnRowDblClicked(rId,cInd){
	  var row = rId-1;
	  var cell = cInd;
	  var matrCode = gridMain.setCells2(row,0).getValue();
	  var matrName = gridMain.setCells2(row,1).getValue();
	  var matrSpec = gridMain.setCells2(row,2).getValue();
	  var matrUnit = gridMain.setCells2(row,3).getValue();
	  var arr = [{"innerCode":matrCode,"innerName":matrName,"spec":matrSpec,"unit":matrUnit}];
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
			  <input name="innerName" id="innerName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div> 
		<div class="form-group form-group-sm" style="width: 400px;">
		   <label class="col-xs-2 control-label"  id="poplabel"for="textinput">
			 구분
			</label>
			<div class="col-xs-2">
			  <input name="gubn" id="gubn" type="radio" value="%" checked="checked">전체
			</div>
			<div class="col-xs-2">
			  <input name="gubn" id="gubn" type="radio" value="1">자재
			</div>
			<div class="col-xs-2">
			  <input name="gubn" id="gubn" type="radio" value="2">모재
			</div>
			<div class="col-xs-2">
			  <input name="gubn" id="gubn" type="radio" value="3">포장
			</div>
		</div>  
  </form>
</div>