<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
var orinGrid;
var config={
		title:"인사발령등록",
		id:"persCode",
		width:"1000",
		height:"500"
	}
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//인사발령등록 팝업
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
    layout.cells("b").attachObject("bootContainer2");

    gridMain = new dxGrid(subLayout.cells("a"), false);
    gridMain.addHeader({name:"No",         colId:"no",       width:"5", align:"center", type:"ro"});
    gridMain.addHeader({name:"발령일",     colId:"empNo",    width:"10", align:"center", type:"ro"});
    gridMain.addHeader({name:"급여구분",   colId:"empName",  width:"5", align:"center", type:"ro"});
    gridMain.addHeader({name:"근무구분",   colId:"deptName", width:"5", align:"center", type:"ro"});
    gridMain.addHeader({name:"발령구분",   colId:"no",       width:"5", align:"center", type:"ro"});
    gridMain.addHeader({name:"부서코드",   colId:"empNo",    width:"10", align:"center", type:"ro"});
    gridMain.addHeader({name:"발령부서",   colId:"empName",  width:"10", align:"center", type:"ro"});
    gridMain.addHeader({name:"발령직군",   colId:"deptName", width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"근무형태",   colId:"no",       width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"발령직위",   colId:"empNo",    width:"10", align:"center", type:"ro"});
	gridMain.addHeader({name:"발령직책",   colId:"empName",  width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"급여사업장", colId:"deptName", width:"10", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.init(); 
	
	/* var params = "postName=" + parent.fn_onOpenPop();
	gfn_callAjaxForGrid(gridMain,params,"/erp/deptS/selDeptCode",subLayout.cells("a"),fn_loadGridListCodeCB);
	
	toolbar.attachEvent("onClick", function(id) {
	      fn_search();
	}); */
});
/* function fn_search(){
	 var params = "postName=" + $("#postName").val();
	  gfn_callAjaxForGrid(gridMain,params,"/erp/deptS/selDeptCode",subLayout.cells("a"),fn_loadGridListCodeCB);
}
//fn_loadGridListCode callback 함수
function fn_loadGridListCodeCB() {
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
};

function doOnRowDblClicked(rId,cInd){
	  var row = rId-1;
	  var cell = cInd;
	  var postCode = gridMain.setCells2(row,0).getValue();
	  var postName = gridMain.setCells2(row,1).getValue();
	  var arr = [{"postCode":postCode,"postName":postName}];
	  parent.fn_onClosePop(config.id,arr);
	  parent.dhxWins.window("w1").close();
}  */
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer2" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;"> 
	   <div class="row">
		  <div class="form-group form-group-sm">
		    <div class="col-sm-8 col-md-8">
			   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			    부서명 
			   </label>
			   <div class="col-sm-2 col-md-2">
                   <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">       
               </div>
               <label class="col-sm-1 col-md-1 control-label" for="textinput">
			     성명
			   </label>
			   <div class="col-sm-2 col-md-2">
                   <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">       
               </div>
		   </div>
	    </div>
      </div>
  </form>
</div>