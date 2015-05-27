<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8,9],"1C");
	//제코드조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    //attach search Condition div
	layout.cells("b").attachObject("bootContainer");
	
	//grid init
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"코드분류", colId:"code", width:"10", type:"ro"});
	gridMain.addHeader({name:"코드분류명", colId:"codeName", width:"10", type:"ro"});
	gridMain.addHeader({name:"내부코드", colId:"interCode", width:"10", type:"ro"});
	gridMain.addHeader({name:"내부코드명", colId:"interName", width:"10", type:"ro"});
	gridMain.addHeader({name:"참조변수", colId:"addVar", width:"10", type:"ro"});
	gridMain.addHeader({name:"비고", colId:"descRmk", width:"10", type:"ro"});
	gridMain.setColSort("str");
	gridMain.setUserData("","pk","code");
	gridMain.enableSmartRendering(true,50);
	gridMain.init();	
	fn_loadGridMain();
});
function fn_search(){
	fn_loadGridMain();
}
function fn_loadGridMain(){
	gridMain.clearAll();
	var inputParams={}
	inputParams.baseCode = $("#baseCode").val();
	inputParams.baseName = $("#baseName").val();
	inputParams.interCode = $("#innerCode").val();
	inputParams.interName = $("#innerName").val();
	gfn_callAjaxForGrid(gridMain,inputParams,"/erp/rndt/baseCodeR",subLayout.cells("a"),fn_loadGridMainCallBack);
}
function fn_loadGridMainCallBack(){
	//call back function
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		   <div class="col-sm-8 col-md-8">
			 <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				코드분류
			 </label>
			 <div class="col-sm-2 col-md-2">
			   <input type="text" name="baseCode" id="baseCode" value="" placeholder="" class="form-control input-xs">		
			 </div>
			 <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				코드분류명
			 </label>
			 <div class="col-sm-2 col-md-2">
			   <input type="text" name="baseName" id="baseName" value="" placeholder="" class="form-control input-xs">		
             </div>
		  </div>
	    </div>
		<div class="form-group form-group-sm">
		   <div class="col-sm-8 col-md-8">
			 <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				내부코드
			 </label>
			 <div class="col-sm-2 col-md-2">
			   <input type="text" name="innerCode" id="innerCode" value="" placeholder="" class="form-control input-xs">		
			 </div>
			 <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				내부코드명
			 </label>
			 <div class="col-sm-2 col-md-2">
			   <input type="text" name="innerName" id="innerName" value="" placeholder="" class="form-control input-xs">		
             </div>
		  </div>
	    </div>
      </div>      
  </form>
 </div> 
</div>