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
	gridMain.addHeader({name:"NO",           colId:"no",          width:"4", align:"center", type:"cntr"});
	gridMain.addHeader({name:"설비코드",     colId:"equiCode",    width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"설비명",       colId:"equiName",    width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"항목코드",     colId:"checkItem",   width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"항목명",       colId:"checkItemNm", width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"주기단위",     colId:"cycleKind",   width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"점검주기",     colId:"cycle",       width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"최종점검일자", colId:"finalDate",   width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"점검예정일자", colId:"finalPreDate",width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"점검일자",     colId:"checkDate",   width:"6", align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"점검결과",     colId:"checkReq",    width:"6", align:"center", type:"combo"});
	gridMain.addHeader({name:"점검자",       colId:"korName",     width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"비고",         colId:"rmk",         width:"8", align:"center", type:"ed"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.dxObj.setUserData("","@finalDate","format_date");
	gridMain.dxObj.setUserData("","@finalPreDate","format_date");
	gridMain.dxObj.setUserData("","@checkDate","format_date");
	gridMain.init(); 

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
	
});
function fn_search(){
    fn_loadGridMain();
}
function fn_loadGridMain() {
	var params = gfn_getFormElemntsData('frmSearch');
	 gfn_callAjaxForGrid(gridMain,params,"gridMainSearch",subLayout.cells("a"));
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
				     점검기간 
				    </label>
				    <div class="col-sm-6 col-md-6">
                        <div class="col-sm-4 col-md-4">
                           <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="stDate" id="stDate" value="">
                           </div>
                           <div class="col-sm-2 col-md-2">
                               <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                           </div>
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="edDate" id="edDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                                 <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
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
					    <input type="radio" name="gubn" id="gubn" value="전체" checked="checked">전체
			         </div>
			         <div class="col-sm-4 col-md-4">
					    <input type="radio" name="gubn" id="gubn" value="이상">이상
			         </div>
			         <div class="col-sm-4 col-md-4">
					    <input type="radio" name="gubn" id="gubn" value="양호">양호
				     </div>
			     </div>
		      </div>
	       </div>
	     </div>
      </form>
  </div>    
</div>