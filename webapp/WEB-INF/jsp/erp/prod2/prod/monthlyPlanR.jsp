<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;   
var mainMenu = parent.mainMenu;
var mainTabbar = parent.mainTabbar;
var tabId = null;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8,9],"1C"); 
	//월간생산계획조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"40", align:"center", type:"cntr"});
	gridMain.addHeader({name:"년월",     colId:"planMm",     width:"80",  align:"center",  type:"ro"});
	gridMain.addHeader({name:"설비코드", colId:"equiCode",   width:"120", align:"left",  type:"ro"});
	gridMain.addHeader({name:"모재코드", colId:"itemCode",   width:"120", align:"left",  type:"ro"});
	gridMain.addHeader({name:"모재명",   colId:"itemName",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"포장",     colId:"packUnit",   width:"80", align:"left",   type:"ron"});
	gridMain.addHeader({name:"단위",     colId:"itemUnit",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"1일",      colId:"planDay1",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"2일",      colId:"planDay2",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"3일",      colId:"planDay3",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"4일",      colId:"planDay4",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"5일",      colId:"planDay5",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"6일",      colId:"planDay6",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"7일",      colId:"planDay7",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"8일",      colId:"planDay8",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"9일",      colId:"planDay9",   width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"10일",     colId:"planDay10",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"11일",     colId:"planDay11",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"12일",     colId:"planDay12",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"13일",     colId:"planDay13",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"14일",     colId:"planDay14",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"15일",     colId:"planDay15",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"16일",     colId:"planDay16",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"17일",     colId:"planDay17",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"18일",     colId:"planDay18",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"19일",     colId:"planDay19",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"20일",     colId:"planDay20",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"21일",     colId:"planDay21",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"22일",     colId:"planDay22",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"23일",     colId:"planDay23",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"24일",     colId:"planDay24",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"25일",     colId:"planDay25",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"26일",     colId:"planDay26",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"27일",     colId:"planDay27",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"28일",     colId:"planDay28",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"29일",     colId:"planDay29",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"30일",     colId:"planDay30",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"31일",     colId:"planDay31",  width:"60", align:"right",  type:"edn"});
	gridMain.addHeader({name:"합계",     colId:"planDaySum", width:"60", align:"right",  type:"ron"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMainAttachFooter();
	gridMain.init(); 
	gridMain.cs_setColumnHidden(["setNumb","prodKind","equiName"]);
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
		
	
	calMain = new dhtmlXCalendarObject([{input:"frMm",button:"calpicker1"},{input:"toMm",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y/%m");
	calMain.hideTime();
	 var t = new Date().getFullYear();
	 var m = +new Date().getMonth()+1;
	 m = fn_monthLen(m);
	byId("frMm").value = t+"/"+m;
	byId("toMm").value = t+"/"+m;
	
});
function doOnRowDblClicked(rId,cInd){
	var cFlag = true;
	var planMmIdx = gridMain.getColIndexById('planMm');
	var setNumbIdx = gridMain.getColIndexById('setNumb');
	var equiCodeIdx = gridMain.getColIndexById('equiCode');
	var dateValue = gridMain.setCells(rId,planMmIdx).getValue();
	var seqValue = gridMain.setCells(rId,setNumbIdx).getValue();
	var equiCodeVal = gridMain.setCells(rId,equiCodeIdx).getValue();
	var ids = mainTabbar.getAllTabs();
	var preId = "1000000579";
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
		mainTabbar.tabs(preId).attachURL("/"+uri+".do",false,{planMm:dateValue,setNumb:seqValue,equiCode:equiCodeVal});	
	}
};
function gridMainAttachFooter(){
	gridMain.atchFooter();
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:"합계"});
	gridMain.addAtchFooter({atchFooterName:""});
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
	 var obj ={};
	 obj.frMm = searchDate($("#frMm").val());
	 obj.toMm = searchDate($("#toMm").val());
	 obj.equiCode = $("#equiCode").val();
	 gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
};
function fn_loadGridMainCB(data){
	 gridMain.dxObj.customGroupFormat=function(name,count){
		 var yyyy = name.substring(0,4);
		 var mm = name.substring(5,7);
	      return yyyy+"년 "+mm+"월";
	}
	gridMain.dxObj.groupBy(1,["","#title","#cspan","#cspan","#cspan","#cspan","#cspan","#stat_total","#stat_total","#stat_total",
	                          "#stat_total","#stat_total","#stat_total","#stat_total","#stat_total","#stat_total",
	                          "#stat_total","#stat_total","#stat_total","#stat_total","#stat_total","#stat_total",
	                          "#stat_total","#stat_total","#stat_total","#stat_total","#stat_total","#stat_total","#stat_total",
	                          "#stat_total","#stat_total","#stat_total","#stat_total","#stat_total","#stat_total","#stat_total",
	                          "#stat_total","#stat_total","#stat_total"]); 
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
				 연도
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="frMm" id="frMm" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker1" class="calicon form-control"  onclick="setSens(1,'toMm', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="toMm" id="toMm" value="">
                          </div>
                          <div class="col-sm-2 col-md-2"> 
                             <input type="button" id="calpicker2" class="calicon form-control"  onclick="setSens(1,'frMm', 'min')">
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
  </form>
 </div> 
</div>