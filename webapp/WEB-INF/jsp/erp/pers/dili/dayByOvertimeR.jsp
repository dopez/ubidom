<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;  
var calMain;
var workSum = 0,overSum = 0,nightSum = 0,holiSum = 0;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8],"1C");
	//일일잔업일보
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"50", align:"center", type:"cntr"});
	gridMain.addHeader({name:"부서",     colId:"postName",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"직위",     colId:"jikweeName", width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",    width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"근무시간", colId:"workTime",   width:"70", align:"right",  type:"ro"});
	gridMain.addHeader({name:"연장시간", colId:"overTime",   width:"70", align:"right",  type:"ro"});
	gridMain.addHeader({name:"야근시간", colId:"nightTime",  width:"70", align:"right",  type:"ro"});
	gridMain.addHeader({name:"특근",     colId:"holiTime",   width:"70", align:"right",  type:"ro"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMainAttachFooter();
	gridMain.init();
	calMain = new dhtmlXCalendarObject([{input:"workDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("workDate").value = t;
	
	fn_search();
	
	$("#postName").keyup(function(e) {
    	if(e.target.id == "postName"){
    		gridMain.filterBy(1,byId("postName").value);
		}
	 }); 
});
function fn_search(){
	gridMain.clearAll();
	fn_loadGridMain();
};
function gridMainAttachFooter(){
  gridMain.atchFooter();
  gridMain.addAtchFooter({atchFooterName:""});
  gridMain.addAtchFooter({atchFooterName:"총 계"});
  gridMain.addAtchFooter({atchFooterName:""});
  gridMain.addAtchFooter({atchFooterName:""});
  gridMain.addAtchFooter({atchFooterName:workSum});
  gridMain.addAtchFooter({atchFooterName:overSum});
  gridMain.addAtchFooter({atchFooterName:nightSum});
  gridMain.addAtchFooter({atchFooterName:holiSum});
  gridMain.atchFooterInit();
}
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
 function fn_loadGridMain(){
	 var obj = gfn_getFormElemntsData("frmSearch");
		gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
};
 
function fn_loadGridMainCB(data){
	   workSum = 0,overSum = 0,nightSum = 0,holiSum = 0;
		for(var i=0; i<data.length;i++){
			workSum += data[i].workTime*1;   overSum += data[i].overTime*1;
			nightSum += data[i].nightTime*1; holiSum += data[i].holiTime*1;
		}
		 gridMain.detachFooter(0);
		 gridMainAttachFooter();
		 
		 gridMain.dxObj.customGroupFormat=function(name,count){
		      return name+" :부서계 "+count+"명";
		}
		gridMain.dxObj.groupBy(1,["","#title","#cspan","#cspan","#stat_total","#stat_total","#stat_total","#stat_total"]);
		$('#workDate').keyup();
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
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="workDate" id="workDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
		 </div>
	    </div>
      </div>      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>  
  </form>
 </div> 
</div>