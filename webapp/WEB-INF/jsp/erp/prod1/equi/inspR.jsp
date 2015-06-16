<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"1C");
	//설비점검조회
	
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",           colId:"no",            width:"50",  align:"center", type:"cntr"});
	gridMain.addHeader({name:"설비코드",     colId:"equiCode",      width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"설비명",       colId:"equiName",      width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"항목코드",     colId:"checkItem",     width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"항목명",       colId:"checkItemName", width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"주기단위",     colId:"cycleKindName", width:"80",  align:"center", type:"ro"});
	gridMain.addHeader({name:"점검주기",     colId:"cycle",         width:"60",  align:"right",  type:"ro"});
	gridMain.addHeader({name:"최종점검일자", colId:"preFinalDate",  width:"90",  align:"center", type:"ro"});
	gridMain.addHeader({name:"점검예정일자", colId:"chkPlanDate",   width:"90",  align:"center", type:"ro"});
	gridMain.addHeader({name:"점검일자",     colId:"checkDate",     width:"80",  align:"center", type:"ro"});
	gridMain.addHeader({name:"점검결과",     colId:"result",        width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"점검자",       colId:"korName",       width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"비고",         colId:"rmk",           width:"180", align:"left",   type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.dxObj.setUserData("","@finalDate","format_date");
	gridMain.dxObj.setUserData("","@finalPreDate","format_date");
	gridMain.dxObj.setUserData("","@checkDate","format_date");
	gridMain.init(); 

	calMain = new dhtmlXCalendarObject([{input:"pfDate",button:"calpicker1"},{input:"ptDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("pfDate").value = t;
	byId("ptDate").value = t;
	
	$("#equiCode").dblclick(function(e){
		if(e.target.id == "equiCode"){
			gfn_load_pop('w1','common/equiCodePOP',true,{"equiCode":$(this).val()});
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
	var params = gfn_getFormElemntsData('frmSearch');
	 gfn_callAjaxForGrid(gridMain,params,"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
};
function fn_loadGridMainCB(data){
	$('#pfDate').keyup();
	$('#ptDate').keyup();
}
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
}
function fn_print(){
	gridMain.printView();
}

function fn_onClosePop(pName,data){
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
				     점검기간 
				    </label>
				    <div class="col-sm-6 col-md-6">
                        <div class="col-sm-4 col-md-4">
                           <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="pfDate" id="pfDate" value="">
                           </div>
                           <div class="col-sm-2 col-md-2">
                               <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'ptDate', 'max')">
                           </div>
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="ptDate" id="ptDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                                 <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'pfDate', 'min')">
                          </div>
                       </div> 
                   </div>              
			   </div>
		    </div>
	     </div>     
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
	     <div class="row">
	        <div class="form-group form-group-sm">
		       <div class="col-sm-8 col-md-8">
		     	 <label class="col-sm-2 col-md-2 control-label" for="textinput">
			      구분
			     </label>
			     <div class="col-sm-3 col-md-3">
			         <div class="col-sm-4 col-md-4">
					    <input type="radio" name="resultGbn" id="resultGbn" value="%" checked="checked">전체
			         </div>
			         <div class="col-sm-4 col-md-4">
					    <input type="radio" name="resultGbn" id="resultGbn" value="1">양호
			         </div>
			         <div class="col-sm-4 col-md-4">
					    <input type="radio" name="resultGbn" id="resultGbn" value="2">이상
				     </div>
			     </div>
		      </div>
	       </div>
	     </div>
      </form>
  </div>    
</div>