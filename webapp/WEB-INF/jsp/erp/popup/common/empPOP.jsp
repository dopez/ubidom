<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var config={
		title:"사원",
		id:"empNo",
		width:"300",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//사원 도우미
	// 인사발령이 있는 사원만 존재한다.
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer");
    
    gridMain = new dxGrid(subLayout.cells("a"), false);
	
    gridMain.addHeader({name:"코드",   colId:"empNo", 	width:"14", align:"center", type:"ro"});
	gridMain.addHeader({name:"사원명", colId:"korName", width:"14", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","empNo");
	gridMain.init();
	var params = "korName=" + parent.fn_onOpenPop(config.id);
	gfn_callAjaxForGrid(gridMain,params,"/erp/pers/pers/persAppointS/selEmpPop",subLayout.cells("a"),fn_loadGridListCodeCB);
});
 function fn_search(){
	 var params = "korName=" + $("#korName").val();
	  gfn_callAjaxForGrid(gridMain,params,"/erp/pers/pers/persAppointS/selEmpPop",subLayout.cells("a"),fn_loadGridListCodeCB);
}
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB() {
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
};

function doOnRowDblClicked(rId,cInd){
	  var row = rId-1;
	  var cell = cInd;
	  var empNo = gridMain.setCells2(row,0).getValue();
	  var korName = gridMain.setCells2(row,1).getValue();
	  var arr = [{"empNo":empNo,"korName":korName}];
	  parent.fn_onClosePop(config.id,arr);
	  parent.dhxWins.window("w1").close();
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
		<div class="form-group form-group-sm" style="width: 200px;">
		   <label class="col-xs-4 control-label"  id="poplabel"for="textinput">
			 사원명
			</label>
			<div class="col-xs-6">
			  <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		</div>  
  </form>
</div>