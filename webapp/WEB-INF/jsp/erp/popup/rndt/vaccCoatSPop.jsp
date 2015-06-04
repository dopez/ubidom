<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var empNo;
var kindParam = parent.kindParam;
var config={
		title:"자재코드조회",
		id:"matrCode", 
		width:"500",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(2,[1],"1C");
	//인사발령등록 팝업
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
    layout.cells("b").attachObject("bootContainer");
    if(kindParam == "P"){
    	$("#matrKindinput").val("약품");
    }else{
    	$("#matrKindinput").val("모재");
    }
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"자재코드",colId:"matrCode",width:"15",align:"center",type:"ro"});
	gridMain.addHeader({name:"자재명",colId:"matrName",width:"17",align:"center",type:"ro"});
	gridMain.addHeader({name:"자재규격",colId:"matrSpec",width:"15",align:"center",type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","");
	gridMain.init();
	gridMain.cs_setColumnHidden(["matrKind"]);
	
	fn_search();
});

function fn_search(){
	var param = {};
 	param.matrCode = $("#matrCode").val();
	param.matrName = $("#matrName").val();
	param.matrSpec = $("#matrSpec").val();
	param.matrKind = kindParam;
	if(param.matrName == null || param.matrName == ''){
		param.matrName = '%';
	}if(param.matrCode == null || param.matrCode == ''){
		param.matrCode = '%';
	}if(param.matrSpec == null || param.matrSpec == ''){
		param.matrSpec = '%';
	}
	gfn_callAjaxForGrid(gridMain,param,"/erp/rndt/stan/vaccCoatS/popMainSel",subLayout.cells("a"),fn_loadGridListCodeCB);
	
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
	  parent.fn_onClosePop(parent.kindParam,arr);
	  parent.dhxWins.window("w1").close();
} 
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 400px;">
		   <label class="col-xs-3 control-label" id="poplabel" for="textinput">
			 자재코드
			</label>
			<div class="col-xs-3">
			  <input name="matrCode" id="matrCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<label class="col-xs-3 control-label" id="poplabel" for="textinput">
			 자재명
			</label>
			<div class="col-xs-3">
			  <input name="matrName" id="matrName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>  
		<div class="form-group form-group-sm" style="width: 400px;">
		   <label class="col-xs-3 control-label" id="poplabel" for="textinput">
			 규격
			</label>
			<div class="col-xs-3">
			  <input name="matrSpec" id="matrSpec" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		   <label class="col-xs-3 control-label" id="poplabel" for="textinput">
			 구분
			</label>
			<div class="col-xs-3">
			  <input name="matrKindinput" id="matrKindinput" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
			</div>
		</div>  
  </form>
</div>
