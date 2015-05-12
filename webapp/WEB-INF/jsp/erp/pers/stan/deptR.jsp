<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8,9],"1C");
	//부서조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no", width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"부서코드", colId:"postCode", width:"15", align:"center", type:"ro"});
	gridMain.addHeader({name:"부서명",   colId:"postName", width:"15", align:"center", type:"ro"});
	gridMain.addHeader({name:"시작일",   colId:"stDate", width:"15", align:"center", type:"ro"});
	gridMain.addHeader({name:"종료일", 	 colId:"endDate", width:"15", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","postCode");
	gridMain.init();
	
	//조회
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	    	  fn_loadGridList();
	      }
	});

	//엑셀
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn8") {
	    	  gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
	      }
	});
	
	//엑셀
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn9") {
	    	  gridMain.getDxObj().printView();
	      }
	});
});

function fn_loadGridList() {
	 var params = "postName=" + $("#postName").val();
	 gfn_callAjaxForGrid(gridMain,params,"/erp/deptR",subLayout.cells("a"),"INF004");
};

function fn_onOpenPop(){
	var value =  $("#postName").val();
	return value;
};

  function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		var i;
		for(i=0;i<data.length;i++){
			 gridMst.setCells2(gridMst.getSelectedRowIndex(),0).setValue(data[i].postCode);
			 gridMst.setCells2(gridMst.getSelectedRowIndex(),1).setValue(data[i].postName);
		}		  
	}	  
 };
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_pop('w1','common/deptCodePOP',true)">
			</div>
		  </div>
	  </div>
	</div>   
	<div class="row">
	   <div class="form-group form-group-sm">
		   <div class="col-sm-8 col-md-8">
			   <label class="col-sm-2 col-md-2 control-label" for="textinput">
				기준 
			   </label>
			   <div class="col-sm-3 col-md-3">
				   <div class="col-sm-4 col-md-4">
					  <input type="radio" name="gubn" id="gubn" value="현재" checked="checked">현재
				   </div>
				   <div class="col-sm-6 col-md-6">
						<input type="radio" name="gubn" id="gubn" value="HISTORY">HISTORY
					 </div>
			   </div>
		   </div>
	    </div>
	 </div>        
  </form>
 </div> 
</div>