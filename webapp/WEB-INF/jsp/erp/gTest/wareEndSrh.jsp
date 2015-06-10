<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
//입고마감내역조회
var grid;
var layout, toolbar, subLayout;
var calMain, myForm;
$(document).ready(function() {
    Ubi.setContainer(1, [1,8,9], "1C");

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
   
    layout.cells("b").attachObject("bootContainer2");


    grid = new dxGrid(subLayout.cells("a"), false);
    grid.addHeader({name:"&nbsp",        colId:"null",         width:"40",  align:"right",  type:"cntr"});
    grid.addHeader({name:"입고번호",     colId:"inSpDno",      width:"100", align:"center", type:"ro"});
    grid.addHeader({name:"프로젝트번호", colId:"pjNo",         width:"100", align:"left",   type:"ro", });
    grid.addHeader({name:"도번코드",     colId:"dobunCode",    width:"150", align:"left",   type:"ro"});
    grid.addHeader({name:"품목코드",     colId:"itemCode",     width:"90",  align:"left",   type:"ro"});
    grid.addHeader({name:"품목명",       colId:"itemName",     width:"90",  align:"left",   type:"ro"});
    grid.addHeader({name:"단위",         colId:"itemUnit",     width:"90",  align:"left",   type:"ro"});
    grid.addHeader({name:"규격",         colId:"itemSize",     width:"100", align:"left",   type:"ro"});
    grid.addHeader({name:"재질",         colId:"materialName", width:"100", align:"left",   type:"ro"});
    grid.addHeader({name:"수량",         colId:"inQty",        width:"100", align:"right",  type:"ron"});
    grid.addHeader({name:"중량",         colId:"inWet",        width:"100", align:"right",  type:"ron"});
    grid.addHeader({name:"단가",         colId:"inPrc",        width:"100", align:"right",  type:"ron"});
    grid.addHeader({name:"금액",         colId:"inAmt",        width:"100", align:"right",  type:"ron"});
    grid.addHeader({name:"할인금액",     colId:"disAmt",       width:"100", align:"right",  type:"ron"});
    grid.addHeader({name:"마감금액",     colId:"endAmt",       width:"100", align:"right",  type:"ron"});
    grid.addHeader({name:"부가세",       colId:"endVat",       width:"100", align:"right",  type:"ron"});
    grid.addHeader({name:"비고",         colId:"conts",        width:"180", align:"lefet",  type:"ro"});
    grid.setUserData("","pk","inSpDno");
    grid.init(); 
    grid.cs_setNumberFormat(["inQty","inWet","inPrc","inAmt","disAmt","endAmt","endVat"]);

    calMain = new dhtmlXCalendarObject([{input: "fromDate",button: "calpicker1"}, 
                                       {input: "toDate",button: "calpicker2"}]);
    calMain.loadUserLanguage("ko");
    calMain.hideTime();
    var t = dateformat(new Date());
    byId("fromDate").value = t;
    byId("toDate").value = t;
    fn_setFilter(true);
});
function fn_setFilter(isChk) {
	  if (isChk) {
	    var z = grid.dxObj.serialize();
	    var colIdx = grid.getColumnsNum();
	    var filterArr = [];
	    var headerMenuArr = [];
	        for (var i = 0; i < colIdx; i++) {
	              var type = grid.dxObj.getColType(i);
	              headerMenuArr.push(true);
	              if (type == "ron") {
	                   filterArr.push("#numeric_filter");
	              } else {
	                 if(i == 0){
	                     filterArr.push("");
	                 }else{
	                    filterArr.push("#text_filter");
	                 }    
	              }
	        }
	       grid.dxObj.enableHeaderMenu(headerMenuArr.join());
	       grid.dxObj.attachHeader(filterArr.join());
	       grid.dxObj.loadXMLString(z);
	     } else {
	         grid.dxObj.detachHeader(1);
	     }
};

function fn_search(){
	fn_loadGridMain();
}

function fn_loadGridMain(){
	var params = gfn_getFormElemntsData("frmSearch");
	gfn_callAjaxForGrid(grid,params,"/erp/scm/wareEndSrh/search",subLayout.cells("a"),fn_loadGridMainCB);
};

function fn_loadGridMainCB(data){
    $('#fromDate').keyup();
    $('#toDate').keyup();
};

function fn_print() {
    grid.dxObj.printView();
};

function fn_excel() {
	grid.dxObj.toExcel("http://175.209.128.74/grid-excel/generate");
};
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:hidden;"></div>
<div id="bootContainer2" style="background-color:#EAEAEA">
    <div class="container">
       <form class="form-horizontal" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;" id="frmSearch" name="frmSearch">
          <div class="row">
             <div class="form-group form-group-sm">
                <div class="col-sm-8 col-md-9">
                    <label class=" col-sm-2 col-md-1 control-label" for="textinput">
                     기간
                    </label>
                    <div class="col-sm-6 col-md-6">
                        <div class="col-sm-4 col-md-3">
                           <div class="input-group date" id="date1">
                              <div class="col-sm-10 col-md-10">
                                  <input type="text" class="form-control input-xs format_date" name="fromDate" id="fromDate" value="">
                              </div>
                              <div class="col-sm-2 col-md-2">
                                  <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'fromDate', 'max')">
                              </div>
                           </div>
                        </div>
                         <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 5px;margin-left:0px;text-align:left;">
                         ~
                         </label>
                         <div class="col-sm-4 col-md-3">
                              <div class="input-group date" id="date2">
                                 <div class="col-sm-10 col-md-10">
                                       <input type="text" class="form-control input-xs format_date" name="toDate" id="toDate" value="">
                                 </div>
                                 <div class="col-sm-2 col-md-2">
                                       <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'toDate', 'min')">
                                 </div>
                              </div>
                          </div>
                       </div>
                   </div>
               </div>
            </div>
       </form>
   </div>
</div>