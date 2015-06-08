<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
var amountSum = 0, moneySum = 0;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"1C");
	//입고조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"),false);
    gridMain.addHeader({name:"No",       colId:"no",         width:"3",align:"center", type:"cntr"});
    gridMain.addHeader({name:"일자",     colId:"regiDate",   width:"5",align:"center", type:"ro"});
    gridMain.addHeader({name:"공급업체", colId:"supplyComp", width:"5",align:"left",   type:"ro"});
    gridMain.addHeader({name:"등록자",   colId:"korName",    width:"5",align:"left",   type:"ro"});
    gridMain.addHeader({name:"부품코드", colId:"partCode",   width:"5",align:"left",   type:"ro"});
    gridMain.addHeader({name:"부품명",   colId:"partName",   width:"5",align:"left",   type:"ro"});
    gridMain.addHeader({name:"규격",     colId:"partSpec",   width:"5",align:"left",   type:"ro"});
    gridMain.addHeader({name:"단위",     colId:"partUnit",   width:"5",align:"left",   type:"ro"});
    gridMain.addHeader({name:"수량",     colId:"amount",     width:"5",align:"right",  type:"ro"});
    gridMain.addHeader({name:"단가",     colId:"unitPrice",  width:"5",align:"right",  type:"ro"});
    gridMain.addHeader({name:"금액",     colId:"money",      width:"5",align:"right",  type:"ro"});
    gridMain.addHeader({name:"납기일자", colId:"nabgiDate",  width:"6",align:"center", type:"ro"});
    gridMain.addHeader({name:"납품장소", colId:"nabgiAddr",  width:"8",align:"left",   type:"ro"});
    gridMain.setUserData("","pk","no");
    gridMain.setColSort("str");
    gridMain.dxObj.setUserData("","@regiDate","format_date");
    gridMain.dxObj.setUserData("","@nabgiDate","format_date");
    gridMainAttachFooter();
    gridMain.init();	
    gridMain.enableSmartRendering(false);

	calMain = new dhtmlXCalendarObject([{input:"pfDate",button:"calpicker1"},{input:"ptDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("pfDate").value = t;
	byId("ptDate").value = t;
	
	$("#partCode,#supplyComp").keyup(function(e) {
    	if(e.target.id == "partCode"){
    		 gridMain.filterBy(4,byId("partCode").value);
		}
    	if(e.target.id == "supplyComp"){
   		 gridMain.filterBy(2,byId("supplyComp").value);
		}
	 });
	
});
function gridMainAttachFooter(){
	gridMain.atchFooter();
	gridMain.addAtchFooter({atchFooterName:"합계"});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:amountSum});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:moneySum});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.addAtchFooter({atchFooterName:""});
	gridMain.atchFooterInit();	
}
function fn_search(){
	 fn_loadGridMain();
};

function fn_loadGridMain() {
	 gfn_callAjaxForGrid(gridMain,{},"gridMainSearch",subLayout.cells("a"),fn_loadGridMainCB);
};

function fn_loadGridMainCB(){
	 gridMain.dxObj.customGroupFormat=function(name,count){
		 var yyyy = name.substring(0,4);
		 var mm = name.substring(4,6);
		 var dd = name.substring(6,8);
	      return yyyy+"년 "+mm+"월"+dd+"일";
	}
	gridMain.dxObj.groupBy(1,["","#title","#cspan","#cspan","#cspan","#cspan","#cspan",
	                          "#cspan","#cspan","#cspan","#cspan","#cspan","#cspan"]); 
	
	 amountSum = 0, moneySum = 0;
	for(var i=0; i<data.length;i++){
		amountSum += data[i].amount*1;   moneySum += data[i].money*1;
	}
	  gridMain.detachFooter(0);
	  gridMainAttachFooter();
};

function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");	
};

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
				    기간 
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
		 	   공급업체
			 </label>
			 <div class="col-sm-2 col-md-2">
			    <input name="supplyComp" id="supplyComp" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	    </div>
	  </div>
	  <div class="row">
	     <div class="form-group form-group-sm">
		    <div class="col-sm-8 col-md-8">
			  <label class="col-sm-2 col-md-2 control-label" for="textinput">
		 	  부품코드
			  </label>
			  <div class="col-sm-2 col-md-2">
			    <input name="partCode" id="partCode" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		    </div>
	     </div>
   	  </div>
   </form>
  </div>
</div>