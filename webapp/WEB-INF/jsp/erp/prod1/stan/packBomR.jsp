<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8,9],"1C");
	//포장BOM조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",        width:"50",  align:"center", type:"cntr"});
	gridMain.addHeader({name:"Level",    colId:"lv",        width:"100", align:"left",   type:"ro"});
	gridMain.addHeader({name:"포장코드", colId:"keyvalue2", width:"100", align:"left",   type:"ro"});
	gridMain.addHeader({name:"포장명",   colId:"itemName",  width:"100", align:"left",   type:"ro"});	
	gridMain.addHeader({name:"규격",     colId:"itemSpec",  width:"80",  align:"left",   type:"ro"});	
	gridMain.addHeader({name:"단위",     colId:"itemUnit",  width:"80",  align:"right",  type:"ro"});	
	gridMain.addHeader({name:"수량",     colId:"ea",        width:"60",  align:"right",  type:"ro"});	
	gridMain.addHeader({name:"사용일자", colId:"useDate",   width:"90",  align:"center", type:"ro"});	
	gridMain.addHeader({name:"사용유무", colId:"useYn",     width:"60",  align:"center", type:"ro"});
	gridMain.addHeader({name:"공정",     colId:"progCode",  width:"60", align:"left",   type:"ro"});
	gridMain.addHeader({name:"순서",     colId:"progSeq",   width:"60", align:"left",   type:"ro"});
	gridMain.addHeader({name:"구분",     colId:"prodKind",  width:"60", align:"left",   type:"ro"});
	gridMain.addHeader({name:"비고",     colId:"rmk",       width:"150", align:"left",   type:"ro"});
	gridMain.setUserData("","pk","");
	gridMain.setColSort("str");
	gridMain.dxObj.setUserData("","@useDate","format_date");
	gridMain.init(); 
	
});
function fn_search(){
	fn_loadGridMain();
}
function fn_loadGridMain() {
	var params = gfn_getFormElemntsData('frmSearch');
	 gfn_callAjaxForGrid(gridMain,params,"MainSearch",subLayout.cells("a"),fn_loadGridMainCB);
};
function fn_loadGridMainCB(data){
	/* gridMain.dxObj.customGroupFormat=function(name,count){
		 var yyyy = name.substring(0,4);
		 var mm = name.substring(5,7);
		 var dd = name.substring(8,10);
	      return yyyy+"년 "+mm+"월 "+dd+"일";
	}
	gridMain.dxObj.groupBy(1,["","#title","#cspan","#cspan","#cspan","#cspan","#cspan",
	                          "#cspan","#cspan","#cspan","#cspan","#cspan","#cspan"]);  */
}
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
};

function fn_print(){
	gridMain.printView();
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
				포장코드
				</label>
			<div class="col-sm-2 col-md-2">
			    <input type="text" name="keyValue" id="keyValue" value="" placeholder="" class="form-control input-xs">		
			</div>
		 </div>
	    </div>
      </div>      
  </form>
 </div> 
</div>