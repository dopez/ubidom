<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(1,[1,8],"1C");
	//월별입사퇴사현황
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"50",  align:"center", type:"cntr"});
	gridMain.addHeader({name:"입사일",   colId:"enterDate",  width:"80",  align:"center", type:"ro"});
	gridMain.addHeader({name:"부서코드", colId:"postCode",   width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"부서명",   colId:"postName",   width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"직위", 	 colId:"jikweeName", width:"80",  align:"left",   type:"ro"});	
	gridMain.addHeader({name:"사번",     colId:"empNo",      width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",    width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"퇴직일",   colId:"retireDate", width:"80",  align:"center", type:"ro"});
	gridMain.addHeader({name:"주민번호", colId:"regiNumb",   width:"120", align:"left",   type:"ro"});	
	gridMain.setUserData("","pk","postCode");
	gridMain.dxObj.setUserData("","@enterDate","format_date");
	gridMain.dxObj.setUserData("","@retireDate","format_date");
	gridMain.setColSort("str");
	gridMain.init();
	
	calMain = new dhtmlXCalendarObject([{input:"frDate",button:"calpicker1"},{input:"toDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("frDate").value = t;
	byId("toDate").value = t;
});
function fn_search(){
	fn_loadGridMain();
};
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
 function fn_loadGridMain(params) {
	 var params= gfn_getFormElemntsData("frmSearch");
	 $('#frDate').keyup();
	 $('#toDate').keyup();
	 gfn_callAjaxForGrid(gridMain,params,"gridMainSearch",subLayout.cells("a"));
};

function fn_exit(){
	mainTabbar.tabs(ActTabId).close();	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
				<div class="col-sm-2 col-md-2 col-sm-offset-1 col-md-offset-1">
			       <select name="kind" id="kind" class="form-control input-xs">
			         <option value="0">입사일</option>
			         <option value="1">퇴사일</option>
			       </select>
			    </div>  
				<label class="col-sm-1 col-md-1 control-label" for="textinput">
				 기간 
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="frDate" id="frDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'toDate', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="toDate" id="toDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'frDate', 'min')">
                          </div>
                       </div> 
                 </div>       
			</div>
		</div>
	  </div> 
  </form>
 </div> 
</div>