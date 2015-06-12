<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
//납품요청내역조회
var grid;
var layout, toolbar, subLayout;
var calMain;
$(document).ready(function() {
    Ubi.setContainer(2,[1,8,9], "1C");

    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

    layout.cells("b").attachObject("bootContainer2");

    grid = new dxGrid(subLayout.cells("a"), false);
    grid.addHeader({name:"&nbsp",        colId:"no",           width:"40",  align:"center", type:"cntr"});
    grid.addHeader({name:"발주일자",     colId:"morderDate",   width:"90",  align:"left",   type:"ro"});
    grid.addHeader({name:"프로젝트번호", colId:"pjNo",         width:"90",  align:"left",   type:"ro"});
    grid.addHeader({name:"도번코드",     colId:"dobunCode",    width:"150", align:"left",   type:"ro"});
    grid.addHeader({name:"자재코드",     colId:"itemCode",     width:"120", align:"left",   type:"ro"});
    grid.addHeader({name:"도번명",       colId:"itemName",     width:"120", align:"left",   type:"ro"});
    grid.addHeader({name:"규격",         colId:"itemSize",     width:"120", align:"left",   type:"ro"});
    grid.addHeader({name:"재질",         colId:"materialName", width:"100", align:"left",   type:"ro"});
    grid.addHeader({name:"단위",         colId:"itemUnit",     width:"60",  align:"left",   type:"ro"});
    grid.addHeader({name:"공정",         colId:"prog",         width:"60",  align:"left",   type:"ro"});
    grid.addHeader({name:"발주수량",     colId:"qty",          width:"70",  align:"right",  type:"ron"});
    grid.addHeader({name:"발주중량",     colId:"wet",          width:"70",  align:"right",  type:"ron"});
    grid.addHeader({name:"단가",         colId:"prc",          width:"70",  align:"right",  type:"ron"});
    grid.addHeader({name:"금액",         colId:"amt",          width:"80",  align:"right",  type:"ron"});
    grid.addHeader({name:"요청수량",     colId:"inspReqQty",   width:"70",  align:"right",  type:"ron"});
    grid.addHeader({name:"미요청수량",   colId:"janQty",       width:"70",  align:"right",  type:"ron"});
    grid.addHeader({name:"납기요청일자", colId:"deliReqDate",  width:"90",  align:"center", type:"ro"});
    grid.addHeader({name:"납품장소",     colId:"deliReqArea",  width:"150", align:"left",   type:"ro"});
    grid.addHeader({name:"비고",         colId:"cont",         width:"180", align:"left",   type:"ro"});
    grid.setUserData("","pk","no");
    grid.dxObj.setUserData("","@morderDate","format_date");
    grid.dxObj.setUserData("","@deliReqDate","format_date");
    grid.init(); 
    grid.cs_setColumnHidden(["setDate","setNumb","seq","custCode"]);

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
		if($('#itemName').val() == ''){
			$('#itemName').val('%');
		}
		var params = gfn_getFormElemntsData("frmSearch");
		gfn_callAjaxForGrid(grid,params,"/erp/scm/deliverReqSrh/search",subLayout.cells("a"),fn_loadGridMainCB);
	}

	function fn_loadGridMainCB(data){
		$('#itemName').val('');
	    $('#fromDate').keyup();
	    $('#toDate').keyup();
	}

	function fn_print() {
	     grid.dxObj.printView();
	};

	function fn_excel() {
		grid.dxObj.toExcel("http://175.209.128.74/grid-excel/generate");
	};
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:hidden;"></div>
<div id="bootContainer2"style="background-color:#EAEAEA">
 <div class="container">
	  <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
       <input id="itemName" name="itemName" type="hidden" placeholder="" value="" class="form-control ">
         <div class="row">
		    <div class="form-group form-group-sm">
			   <div class="col-sm-8 col-md-8">
				  <label class="col-sm-2 col-md-2 control-label" for="textinput">
				   발주일자 
				  </label>
				  <div class="col-sm-6 col-md-6">
                      <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="fromDate" id="fromDate" value="">
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
                               <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'fromDate', 'min')"> 
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
		 	   구분
			 </label>
			 <div class="col-sm-2 col-md-2">
			     <select name="state" id="state" class="form-control input-xs">
                     <option value="10">미입고요청</option>
                     <option value="20">입고요청</option>
                     <option value="%">전체</option>
                 </select>
			</div>
		  </div>
	    </div>
	  </div>
   </form>
  </div>
</div>
  