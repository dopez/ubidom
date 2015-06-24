<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;   
var mainMenu = parent.mainMenu;
var mainTabbar = parent.mainTabbar;
var tabId = null;
var uri = null;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8,9],"1C");
	//연간생산계획조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"40",  align:"center", type:"cntr"});
	gridMain.addHeader({name:"연도",     colId:"planYear",   width:"80",  align:"center", type:"ro"});
	gridMain.addHeader({name:"품목코드", colId:"itemCode",   width:"120", align:"left",   type:"ro"});
	gridMain.addHeader({name:"품목명",   colId:"itemName",   width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"포장",     colId:"packUnit",   width:"80",  align:"left",   type:"ron"});
	gridMain.addHeader({name:"단위",     colId:"itemUnit",   width:"80",  align:"left",   type:"ro"});
	gridMain.addHeader({name:"1월",      colId:"planQty1",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"2월",      colId:"planQty2",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"3월",      colId:"planQty3",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"4월",      colId:"planQty4",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"5월",      colId:"planQty5",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"6월",      colId:"planQty6",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"7월",      colId:"planQty7",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"8월",      colId:"planQty8",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"9월",      colId:"planQty9",   width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"10월",     colId:"planQty10",  width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"11월",     colId:"planQty11",  width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"12월",     colId:"planQty12",  width:"60",  align:"right",  type:"ron"});
	gridMain.addHeader({name:"합계",     colId:"planQtySum", width:"60",  align:"right",  type:"ron"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMainAttachFooter();
	gridMain.init(); 
	gridMain.cs_setColumnHidden(["setNumb","prodKind","equiCode"]);	
	gridMain.attachEvent("onRowDblClicked",doOnRowDbClicked);
	
	calMain = new dhtmlXCalendarObject([{input:"frYear",button:"calpicker1"},{input:"toYear",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y");
	calMain.hideTime();
	var t = new Date().getFullYear();
	byId("frYear").value = t;
	byId("toYear").value = t;
});
function doOnRowDbClicked(rId,cInd){
	var cFlag = true;
	var planYearIdx = gridMain.getColIndexById('planYear');
	var setNumbIdx = gridMain.getColIndexById('setNumb');
	var dateValue = gridMain.setCells(rId,planYearIdx).getValue();
	var seqValue = gridMain.setCells(rId,setNumbIdx).getValue();
	var ids = mainTabbar.getAllTabs();
	var preId = "1000000495";
	for(var i=0;i<ids.length;i++){
		if(ids[i] == preId){
			if(MsgManager.confirmMsg("INF006")) { 
				mainTabbar.tabs(preId).close();
				cFlag = true;
			}else{
				cFlag = false;
				return;
			}
		}
	}
	if(cFlag){
		var uri = mainMenu.getUserData(preId, "uri");
		var menuItemText = mainMenu.getDxObj().getItemText(preId);
		mainTabbar.addTab(preId, menuItemText, null, null, true, true);
		mainTabbar.tabs(preId).attachURL("/"+uri+".do",false,{planYear:dateValue,setNumb:seqValue});	
	}
};
function gridMainAttachFooter(){
	gridMain.atchFooter();
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:"월계"});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.addAtchFooter({atchFooterName:"#stat_total"});
	gridMain.atchFooterInit();	
}

function fn_search(){
	fn_loadGridMain();
};
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
 function fn_print(){
	 gridMain.dxObj.printView();
 }
 function fn_loadGridMain(params) {
	 var params= gfn_getFormElemntsData("frmSearch");
	 gfn_callAjaxForGrid(gridMain,params,"gridMainSearch",subLayout.cells("a"));
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
				 연도
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="frYear" id="frYear" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                               <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'toYear', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="toYear" id="toYear" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'frYear', 'min')">
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
				 제품코드
				 </label>
				<div class="col-sm-2 col-md-2">
				  <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			  </div>
		  </div>
		</div>      
	  </form>
	</div>  
</div>