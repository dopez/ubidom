<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
//납품요청등록
var o;
var grid1,grid2;
var layout, toolbar, subLayout;
var calMain;
$(document).ready(function() {
      Ubi.setContainer(1, [1,3,6], "2E");
               
      layout = Ubi.getLayout();
      toolbar = Ubi.getToolbar();
      subLayout = Ubi.getSubLayout(); 
     
      layout.cells("b").attachObject("bootContainer2");

      subLayout.cells("a").showHeader();
 	  subLayout.cells("a").setText("발주확인");
      
 	 grid1 = new dxGrid(subLayout.cells("a"), false);
 	 grid1.addHeader({name:"#master_checkbox", colId:"chkCol",        width:"40",  align:"center", type:"ch"});
 	 grid1.addHeader({name:"발주일자",          colId:"morderDate",   width:"90",  align:"center", type:"ro"});
 	 grid1.addHeader({name:"프로젝트번호",      colId:"pjNo",         width:"90",  align:"left",   type:"ro"});
     grid1.addHeader({name:"도번코드",          colId:"dobunCode",    width:"150", align:"left",   type:"ro"});
     grid1.addHeader({name:"자재코드",          colId:"itemCode",     width:"120", align:"left",   type:"ro"});
     grid1.addHeader({name:"도번명",            colId:"itemName",     width:"120", align:"left",   type:"ro"});
     grid1.addHeader({name:"규격",              colId:"itemSize",     width:"120", align:"left",   type:"ro"});
     grid1.addHeader({name:"재질",              colId:"materialName", width:"60",  align:"left",   type:"ro"});
     grid1.addHeader({name:"단위",              colId:"itemUnit",     width:"60",  align:"left",   type:"ro"});
     grid1.addHeader({name:"공정",              colId:"progName",     width:"60",  align:"left",   type:"ro"});
     grid1.addHeader({name:"발주수량",          colId:"qty",          width:"70",  align:"right",  type:"ron"});
     grid1.addHeader({name:"발주중량",          colId:"wet",          width:"70",  align:"right",  type:"ron"});
     grid1.addHeader({name:"단가",              colId:"prc",          width:"70",  align:"right",  type:"ron"});
     grid1.addHeader({name:"금액",              colId:"amt",          width:"80",  align:"right",  type:"ron"});
     grid1.addHeader({name:"납품요청수량",      colId:"inspReqQty",   width:"80",  align:"right",  type:"ron"});
     grid1.addHeader({name:"미요청수량",        colId:"janQty",       width:"70",  align:"right",  type:"ron"});
     grid1.addHeader({name:"납기요청일자",      colId:"deliReqDate",  width:"90",  align:"center", type:"ro"});
     grid1.addHeader({name:"납품장소",          colId:"deliReqArea",  width:"150", align:"lefet",  type:"ro"});
     grid1.addHeader({name:"요청일자",          colId:"reqDate",      width:"90",  align:"center", type:"ro"});
     grid1.addHeader({name:"비고",              colId:"cont",         width:"180", align:"lefet",  type:"ro"});
     grid1.setUserData("","pk","");
     grid1.dxObj.setUserData("","@morderDate","format_date");
     grid1.dxObj.setUserData("","@deliReqDate","format_date");
     grid1.dxObj.setUserData("","@reqDate","format_date");
     grid1.init(); 
     grid1.cs_setNumberFormat(["qty","wet","prc","amt","inspReqQty","janQty"]);
     grid1.cs_setColumnHidden(["setDate","setNumb","seq","custCode","prog"]);
     grid1.attachEvent("onCheckbox", doOnCheck);
     grid1.attachEvent("onRowDblClicked",doOnGrid1DblClicked)
     
     subLayout.cells("b").showHeader();
	 subLayout.cells("b").setText("납품요청");

     grid2 = new dxGrid(subLayout.cells("b"), false);
     grid2.addHeader({name:"납품일자",     colId:"reqDate",      width:"90",  align:"center", type:"ro"});
     grid2.addHeader({name:"발주일자",     colId:"setDate",   width:"90",  align:"center", type:"ro"});
     grid2.addHeader({name:"프로젝트번호", colId:"pjNo",         width:"90",  align:"left",   type:"ro"});
     grid2.addHeader({name:"도번코드",     colId:"dobunCode",    width:"150", align:"left",   type:"ro"});
     grid2.addHeader({name:"품목코드",     colId:"itemCode",     width:"120", align:"left",   type:"ro"});
     grid2.addHeader({name:"품목명",       colId:"itemName",     width:"120", align:"left",   type:"ro"});
     grid2.addHeader({name:"규격",         colId:"itemSize",     width:"120", align:"left",   type:"ro"});
     grid2.addHeader({name:"재질",         colId:"materialName", width:"60",  align:"left",   type:"ro"});
     grid2.addHeader({name:"단위",         colId:"itemUnit",     width:"60",  align:"left",   type:"ro"});
     grid2.addHeader({name:"공정",         colId:"progName",     width:"60",  align:"left",   type:"ro"});
     grid2.addHeader({name:"요청수량",     colId:"reqQty",       width:"60",  align:"right",  type:"edn"});
     grid2.addHeader({name:"단가",         colId:"prc",          width:"70",  align:"right",  type:"edn"});
     grid2.addHeader({name:"금액",         colId:"amt",          width:"80",  align:"right",  type:"ron"});
     grid2.addHeader({name:"납기요청일자", colId:"deliReqDate",  width:"90",  align:"center", type:"ro"});
     grid2.addHeader({name:"납품장소",     colId:"deliReqArea",  width:"150", align:"lefet",  type:"ro"});
     grid2.addHeader({name:"비고",         colId:"rmks",         width:"180", align:"lefet",  type:"ed"});
     grid2.setUserData("","pk","");
     grid2.dxObj.setUserData("","@reqDate","format_date");
     grid2.dxObj.setUserData("","@setDate","format_date");
     grid2.dxObj.setUserData("","@deliReqDate","format_date");
     grid2.init(); 
     grid2.cs_setNumberFormat(["reqQty","prc","amt"]);
     grid2.cs_setColumnHidden(["setNumb","seq","custCode","gridIdx","reqSeq","inQty","badQty","prog"]);
     grid2.attachEvent("onRowDblClicked",doOnGrid2DblClicked)
     grid2.attachEvent("onRowSelect",doOnRowSelect);
     grid2.attachEvent("onCellChanged",doOnCellChanged);
     
     calMain = new dhtmlXCalendarObject([{input: "rqDate",button: "calpicker1"}]);
     calMain.loadUserLanguage("ko");
     calMain.hideTime();
     var t = dateformat(new Date());
     byId("rqDate").value = t;
 
     fn_setFilter(grid1,true,true);
     fn_setFilter(grid2,true);         
      fn_search();

});
function doOnCellChanged(rId,cInd,nValue){
	var qtyIdx = grid2.getColIndexById('reqQty');
	var prcIdx = grid2.getColIndexById('prc');
	if(cInd==qtyIdx){
		doOnRowSelect(rId,cInd);
	  }
	if(cInd==prcIdx){
		doOnRowSelect(rId,cInd);
	  }
}
function doOnRowSelect(id,ind){
	totalQtyCalcul(id);
};

function totalQtyCalcul(id){
	var qtyIdx = grid2.getColIndexById('reqQty');
	var prcIdx = grid2.getColIndexById('prc');
	var amtIdx = grid2.getColIndexById('amt');
	sum = grid2.setCells(id,amtIdx).getValue()*1;
	qtyValue = grid2.setCells(id,qtyIdx).getValue()*1;
	costValue = grid2.setCells(id,prcIdx).getValue()*1;
	sum = (qtyValue*costValue);
	grid2.setCells(id,amtIdx).setValue(sum);
};
function doOnGrid1DblClicked(rId,cInd){
	fn_hanling_row_data(rId);
};

function fn_hanling_row_data(rId){
	var totalColNum = grid2.getColumnCount();
	var data = new Array(totalColNum);
	var setDateColIdx      = grid2.getColIndexById('setDate');  
	var reqDateColIdx      = grid2.getColIndexById('reqDate');  
	var pjNoColIdx         = grid2.getColIndexById('pjNo'); 
	var setNumbColIdx      = grid2.getColIndexById('setNumb'); 
	var progColIdx         = grid2.getColIndexById('prog'); 
	var progNameColIdx     = grid2.getColIndexById('progName'); 
	var seqColIdx          = grid2.getColIndexById('seq');
	var dobunCodeColIdx    = grid2.getColIndexById('dobunCode');    
	var itemCodeColIdx     = grid2.getColIndexById('itemCode');  
	var itemNameColIdx     = grid2.getColIndexById('itemName');
	var itemSizeColIdx     = grid2.getColIndexById('itemSize'); 
	var materialNameColIdx = grid2.getColIndexById('materialName');
	var itemUnitColIdx     = grid2.getColIndexById('itemUnit');
	var gridIdxColIdx      = grid2.getColIndexById('gridIdx');
	var prcColIdx          = grid2.getColIndexById('prc');
	var amtColIdx          = grid2.getColIndexById('amt');
	var reqQtyColIdx       = grid2.getColIndexById('reqQty');
	var deliReqDateColIdx  = grid2.getColIndexById('deliReqDate');
	var deliReqAreaColIdx  = grid2.getColIndexById('deliReqArea');
	var custCodeColIdx     = grid2.getColIndexById('custCode');
	
	    data[setDateColIdx]      = grid1.setCells(rId,grid1.getColIndexById('morderDate')).getValue();
		data[reqDateColIdx]      = $('#rqDate').val();
		data[pjNoColIdx]         = grid1.setCells(rId,grid1.getColIndexById('pjNo')).getValue();
		data[setNumbColIdx]      = grid1.setCells(rId,grid1.getColIndexById('setNumb')).getValue();
		data[progColIdx]         = grid1.setCells(rId,grid1.getColIndexById('prog')).getValue();
		data[progNameColIdx]     = grid1.setCells(rId,grid1.getColIndexById('progName')).getValue();
		data[seqColIdx]          = grid1.setCells(rId,grid1.getColIndexById('seq')).getValue();
		data[dobunCodeColIdx]    = grid1.setCells(rId,grid1.getColIndexById('dobunCode')).getValue();
	    data[itemCodeColIdx]     = grid1.setCells(rId,grid1.getColIndexById('itemCode')).getValue();
		data[itemNameColIdx]     = grid1.setCells(rId,grid1.getColIndexById('itemName')).getValue();
		data[itemSizeColIdx]     = grid1.setCells(rId,grid1.getColIndexById('itemSize')).getValue();
		data[materialNameColIdx] = grid1.setCells(rId,grid1.getColIndexById('materialName')).getValue();
		data[itemUnitColIdx]     = grid1.setCells(rId,grid1.getColIndexById('itemUnit')).getValue();
		data[gridIdxColIdx]      = rId;
		data[prcColIdx]          = grid1.setCells(rId,grid1.getColIndexById('prc')).getValue();
		data[amtColIdx]          = grid1.setCells(rId,grid1.getColIndexById('amt')).getValue();
		data[reqQtyColIdx]       = grid1.setCells(rId,grid1.getColIndexById('janQty')).getValue();
		data[deliReqDateColIdx]  = grid1.setCells(rId,grid1.getColIndexById('deliReqDate')).getValue();
		data[deliReqAreaColIdx]  = grid1.setCells(rId,grid1.getColIndexById('deliReqArea')).getValue();
		data[custCodeColIdx]     = grid1.setCells(rId,grid1.getColIndexById('custCode')).getValue();
		grid2.addRow(data);
		grid1.cs_deleteRow(rId);
}

function doOnGrid2DblClicked(rId,cInd){
	var grid1Idx = grid2.setCells(rId,grid2.getColIndexById('gridIdx')).getValue();
	grid1.cs_addRow(grid1Idx);
	grid2.deleteRow(rId);
}

function fn_setFilter(grid,isChk,flag) {
    if (isChk){
	      var z = grid.dxObj.serialize();
	      var colIdx = grid.getColumnsNum();
	      var filterArr = [];
	      var headerMenuArr = [];
	      for (var i = 0; i < colIdx; i++) {
	           var type = grid.dxObj.getColType(i);
	           headerMenuArr.push(true);
	           if (type == "ron") {
	               filterArr.push("#numeric_filter");
	            }else {
	               if(i == 0 && flag){
	            	  filterArr.push("");
	            	}else{
	            	  filterArr.push("#text_filter");
	               }
	           }
	       }
       grid.dxObj.enableHeaderMenu(headerMenuArr.join());
	   grid.dxObj.attachHeader(filterArr.join());
	   grid.dxObj.loadXMLString(z);
    }else{
	   grid.dxObj.detachHeader(1);
	 }
};

function doOnCheck(rowId, cellInd, state) {
   var flag = grid1.setCells(rowId, 0).isChecked();
   var newId = (new Date()).valueOf();
      if(flag){
            dhtmlx.message({
                type: "error",
                text: rowId + "번째 줄이 이동하였습니다.",
                 expire: 0
             });
            fn_hanling_row_data(rowId);
        }
         return true;
};

function fn_search(){
	fn_loadGridMst();
	fn_loadGridDtl();
};

function fn_loadGridMst(){
	var params = gfn_getFormElemntsData("frmSearch");
	gfn_callAjaxForGrid(grid1,params,"/erp/scm/deliverReqReg/searchM",subLayout.cells("a"));
};

function fn_loadGridDtl(){
	var params = gfn_getFormElemntsData("frmSearch");
	gfn_callAjaxForGrid(grid2,params,"/erp/scm/deliverReqReg/searchD",subLayout.cells("b"),fn_loadGridDtlCB);
};

function fn_loadGridDtlCB(data){
	$('#rqDate').keyup();
}        

 function fn_save() {
	 var jsonStr = grid2.getJsonUpdated2();
	    $("#jsonData").val(jsonStr);
       $.ajax({
          url: "/erp/scm/deliverReqReg/save",
          type: "POST",
          data: $("#pform").serialize(),
          async: true,
          success: function(data) {
          MsgManager.alertMsg("INF001");
          fn_search();
          }
      });
};

function fn_delete(){
	var rodid = grid2.getSelectedRowId();
	grid2.cs_deleteRow(rodid);
}
</script>
<form id="pform" name="pform" method="post">
     <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:hidden;"></div>
<div id="bootContainer2" style="background-color:#EAEAEA">
   <div class="container">
       <form class="form-horizontal" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;" id="frmSearch" name="frmSearch">
            <div class="row">
                <div class="col-sm-8 col-md-8">
                     <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-1 control-label" for="textinput"> 
                          일자
                         </label>
                         <div class="col-sm-2 col-md-2">
                            <div class="col-sm-8 col-md-8">
                                 <input name="rqDate" id="rqDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                            </div>
                            <div class="col-sm-2 col-md-2" style="margin-left:0px;">
                                 <input type="button" id="calpicker1" class="calicon form-control">
                            </div>
                         </div>
                    </div>
                </div>
            </div>
       </form>
    </div>
</div>