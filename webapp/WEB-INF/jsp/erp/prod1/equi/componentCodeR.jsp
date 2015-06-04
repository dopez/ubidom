<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8,9],"1C");
	//부품코드조회
	
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
	layout.cells("b").attachObject("bootContainer");
	
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"5",  align:"center", type:"cntr"});
	gridMain.addHeader({name:"부품코드", colId:"partCode",   width:"7",  align:"center", type:"ro"});
	gridMain.addHeader({name:"부품명",   colId:"partName",   width:"7",  align:"center", type:"ro"});
	gridMain.addHeader({name:"규격",     colId:"partSpec",   width:"7",  align:"center", type:"ro"});
	gridMain.addHeader({name:"단위",     colId:"partUnit",   width:"7",  align:"center", type:"ro"});
	gridMain.addHeader({name:"비고",     colId:"rmk",        width:"15", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.init(); 
	
	$("#partCode").keyup(function(e) {
    	if(e.target.id == "partCode"){
    		 gridMain.filterBy(1,byId("partCode").value);
		}
	 });

});
function fn_search(){
    fn_loadGridMain();
}
function fn_loadGridMain(params) {
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
			       부품코드
			      </label>
			    <div class="col-sm-2 col-md-2">
			      <input name="partCode" id="partCode" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
		       </div>
	        </div>
	     </div>
       </form>
    </div>  
</div>