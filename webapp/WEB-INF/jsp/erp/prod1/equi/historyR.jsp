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
	gridMain.addHeader({name:"NO",           colId:"no",             width:"50",  align:"center", type:"cntr"});
	gridMain.addHeader({name:"설비코드",     colId:"equiCode",       width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"설비명",       colId:"equiName",       width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"규격",         colId:"standard",       width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"용량",         colId:"capacity",       width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"사용공정",     colId:"useProcess",     width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"거래처",       colId:"supplyComp",     width:"100", align:"left",   type:"ro"});
	gridMain.addHeader({name:"담당자",       colId:"korName",        width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"제작처",       colId:"makeComp",       width:"100", align:"left",   type:"ro"});
	gridMain.addHeader({name:"금액",         colId:"buyMoney",       width:"80",  align:"right",  type:"ro"});
	gridMain.addHeader({name:"구입일자",     colId:"buyDate",        width:"80",  align:"center", type:"ro"});
	gridMain.addHeader({name:"사용유무",     colId:"useYn",          width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"사용중지사유", colId:"useStopRemarks", width:"180", align:"left",   type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.dxObj.setUserData("","@buyDate","format_date");
	gridMain.init(); 
	
	$("#equiCode,#partCode").dblclick(function(e){
		if(e.target.id == "equiCode"){
			gfn_load_pop('w1','common/equiCodePOP',true,{"supplyComp":$(this).val()});
		}
    });
	
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
	var params = gfn_getFormElemntsData("frmSearch");
	 gfn_callAjaxForGrid(gridMain,params,"gridMainSearch",subLayout.cells("a"));
};

function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
}
function fn_print(){
	gridMain.printView();
}

function fn_onClosePop(pName,data){
	var i;
	var obj={};
	 if(pName == "equiCode"){
		 $('#equiCode').val(data[0].equiCode);
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