<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var config={
		title : "공급업체코드",
		id:"custCode",
		width:"300",
		height:"500"
}

$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//공급업체코드 도우미
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
	gridMain = new dxGrid(subLayout.cells("a"), true);
	gridMain.addHeader({name:"공급업체코드", colId:"custCode", 	width:"15", align:"center", type:"ro"});
	gridMain.addHeader({name:"공급업체명", colId:"custName", 	width:"15", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","custCode");
	gridMain.init(); 
	
	fn_gridPopLoad();
	
	toolbar.attachEvent("onClick", function(id) {
	      if (id == "btn1") {
	    	  fn_gridPopLoad();
	         }
	});
	function fn_gridPopLoad(){
				var param = "custName=" + parent.popValue;
				alert(param);
		if(param == null || param == ''){
				var param = 'custName="%"';
		}
				gfn_gridLoad("/erp/comboTest/selComp",param,gridMain,fn_toParent);
	}

	function fn_toParent(){
		gridMain.attachEvent("onRowDblClicked",function(rId,cInd){
			var row = rId-1;
			parent.popValue = gridMain.setCells2(row,1).getValue();
		});
	}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label" id="poplabel" for="textinput">
			 업체명
			</label>
			<div class="col-xs-6">
			  <input name="supplyCompName" id="supplyCompName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>  
  </form>
</div>