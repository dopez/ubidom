<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;  
var calMain;
var workSum = 0,overSum = 0,nightSum = 0,holiSum = 0;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8],"1C");
	//일일잔업일보
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"3", align:"center", type:"cntr"});
	gridMain.addHeader({name:"부서",     colId:"postName",   width:"8", align:"center", type:"ro"});
	gridMain.addHeader({name:"직위",     colId:"jikweeName", width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",    width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"근무시간", colId:"workTime",   width:"4", align:"center", type:"ro"});
	gridMain.addHeader({name:"연장시간", colId:"overTime",   width:"4", align:"center", type:"ro"});
	gridMain.addHeader({name:"야근시간", colId:"nightTime",  width:"4", align:"center", type:"ro"});
	gridMain.addHeader({name:"특근",     colId:"holiTime",   width:"4", align:"center", type:"ro"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMainAttachFooter();
	gridMain.init();
	calMain = new dhtmlXCalendarObject([{input:"workDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("workDate").value = t;
	
	$("#postName").click(function(e){
		  gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
	});
});
function fn_search(){
	gridMain.clearAll();
	fn_loadGridList();
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
 function fn_loadGridList(){
	 var obj = gfn_getFormElemntsData("frmSearch");
		gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridListCB);
	}
	function fn_loadGridListCB(data){
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
		gridMain.dxObj.groupBy(1,["","#title","#cspan","","#stat_total","#stat_total","#stat_total","#stat_total"]);
		$('#workDate').keyup();
		$('#postCode').val('%');
		$('#postName').val('');
	};
	function fn_onClosePop(pName,data){
		var i;
		var obj={};
		if(pName=="postCode"){
			for(i=0;i<data.length;i++){
				obj.postName=data[i].postName;
				obj.postCode=data[i].postCode;
				$('#postName').val(obj.postName);
				$('#postCode').val(obj.postCode);
			}		  
		}
	 };
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <input type="hidden" id="postCode" name="postCode" value="%">
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