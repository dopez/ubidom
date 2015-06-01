<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
var combo;
$(document).ready(function(){
	Ubi.setContainer(1,[1,3,4],"1C");
	//회사 달력등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",        colId:"no",       width:"3", align:"center", type:"cntr"});
	gridMain.addHeader({name:"일자",      colId:"dd",       width:"4", align:"center", type:"ro"});
	gridMain.addHeader({name:"요일",      colId:"dayWeek",  width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"평일/휴무", colId:"holyKnd",  width:"7", align:"center", type:"combo"});
	gridMain.addHeader({name:"근무시간",  colId:"workTime", width:"5", align:"center", type:"ed"});
	gridMain.addHeader({name:"내역",      colId:"note",     width:"15", align:"center", type:"ed"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMain.init(); 
	gridMain.cs_setColumnHidden(["compId","empNo"]);
	
	$("#initCalBtn").click(function(e){
		saveCalendar();
	});
	
	combo =gridMain.getColumnCombo(3);
	fn_comboSet(combo);
	
	calMain = new dhtmlXCalendarObject([{input:"searchDate",button:"calpicker"}]);
	calMain.loadUserLanguage("ko");
	calMain.setDateFormat("%Y/%m");
	calMain.hideTime();
	var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("searchDate").value = t+"/"+m;
});
function saveCalendar(){
	var yValue = $('#searchDate').val().substring(0,4);
	var mValue = $('#searchDate').val().substring(5,7);
	var obj={};
	obj.weekKnd = $(':radio[name="weekKnd"]:checked').val();
	obj.yyyy = yValue;
	obj.mm = mValue;
	fn_initCalendar(obj);
}
function fn_comboSet(comboId){
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
	       {header: "평일/휴무", width: 100,  option: "#interName#"}
	    ]
	});
	comboId.addOption("D","평일");
	comboId.addOption("H","공휴");
	comboId.addOption("L","법정");

comboId.enableFilteringMode(true);
comboId.enableAutocomplete(true);
comboId.allowFreeText(true);
}

function fn_search(){
	var yValue = $('#searchDate').val().substring(0,4);
	var mValue = $('#searchDate').val().substring(5,7);
 	var obj={};
	obj.yyyy = yValue;
	obj.mm = mValue;
	fn_loadGridSearch(obj);
}

function fn_save(){
	 var jsonStr = gridMain.getJsonUpdated2();
   if (jsonStr == null || jsonStr.length <= 0) return;         		
       $("#jsonData").val(jsonStr);                      
       $.ajax({
          url : "/erp/comm/stan/factoryCalS/gridMainSave",
          type : "POST",
          data : $("#pform").serialize(),
          async : true,
          success : function(data) {
          MsgManager.alertMsg("INF001");
          fn_search();
           }
      }); 
}

function fn_remove(){
	 for(var i=0; i<gridMain.getRowsNum();i++){
		 gridMain.cs_deleteRow(gridMain.getRowId(i));	 
	 }
	 fn_save();
}

function fn_loadGridSearch(params){
    gfn_callAjaxForGrid(gridMain,params,"gridMainSearch",subLayout.cells("a"),gridSearchCB);
}
function gridSearchCB(data){
	if(data != ''){
	$('#yyyy').val(data[0].yyyy);
	$('#mm').val(data[0].mm);
	$('#weKnd').val(data[0].weekKnd);
	var weekKnd = $(':radio[name="weekKnd"]:checked').val();
	if(data[0].weekKnd != weekKnd){
	 reSaveCalendar();
	}
  }
}
function reSaveCalendar(){
	for(var i=0; i<gridMain.getRowsNum();i++){
		gridMain.setCells2(i,8).setValue('DELETE');
	}
		 var jsonStr = gridMain.getJsonUpdated2();
		   if (jsonStr == null || jsonStr.length <= 0) return;         		
		       $("#jsonData").val(jsonStr);                      
		       $.ajax({
		          url : "/erp/comm/stan/factoryCalS/gridMainSave",
		          type : "POST",
		          data : $("#pform").serialize(),
		          async : true,
		          success : function(data) {
		        	  saveCalendar();
		           }
		      }); 
}
function fn_initCalendar(params){
	gfn_callAjaxForGrid(gridMain,params,"initCalendar",subLayout.cells("a"));
	fn_search();
}
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="yyyy" name="yyyy" />
    <input type="hidden" id="mm" name="mm" />
    <input type="hidden" id="weKnd" name="weKnd" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 년월
			 </label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="searchDate" id="searchDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
            </div>
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 근무구분
			 </label>
			<div class="col-sm-3 col-md-3">
			   <div class="col-sm-5 col-md-5">
			    <input type="radio" name="weekKnd" id="weekKnd" value="5" checked="checked">주5일제
  			   </div>
  			   <div class="col-sm-5 col-md-5">
			    <input type="radio" name="weekKnd" id="weekKnd" value="6">주6일제
  			   </div>
			</div>
			<div class="col-sm-1 col-md-1">
			   <input type="button" name="initCalBtn" id="initCalBtn" value="달력생성" placeholder="" class="form-control btn btn-default btn-xs">
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>