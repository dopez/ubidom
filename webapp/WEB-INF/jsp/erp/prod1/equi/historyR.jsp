<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8,9],"1C");
	//설비이력조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",           colId:"no",             width:"3", align:"center", type:"cntr"});
	gridMain.addHeader({name:"설비코드",     colId:"equiCode",       width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"설비명",       colId:"equiName",       width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"규격",         colId:"standard",       width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"용량",         colId:"capacity",       width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"사용공정",     colId:"useProcess",     width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"거래처",       colId:"supplyComp",     width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"담당자",       colId:"korName",        width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"제작처",       colId:"makeComp",       width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"금액",         colId:"buyMoney",       width:"5", align:"right",  type:"ro"});
	gridMain.addHeader({name:"구입일자",     colId:"buyDate",        width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"사용유무",     colId:"useYn",          width:"5", align:"left",   type:"ro"});
	gridMain.addHeader({name:"사용중지사유", colId:"useStopRemarks", width:"5", align:"left",   type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.dxObj.setUserData("","@buyDate","format_date");
	gridMain.init(); 
	
	$("#equiCode").keyup(function(e) {
    	if(e.target.id == "equiCode"){
    		 gridMain.filterBy(1,byId("equiCode").value);
		}
	 });

});
function fn_search(){
    fn_loadGridMain();
}
function fn_loadGridMain() {
	 gfn_callAjaxForGrid(gridMain,{},"gridMainSearch",subLayout.cells("a"));
};

function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
}
function fn_print(){
	gridMain.printView();
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
		        	설비코드
			       </label>
			       <div class="col-sm-2 col-md-2">
			         <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
		        </div>
	        </div>
	     </div>
      </form>
  </div>     
</div>