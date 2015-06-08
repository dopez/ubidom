<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,5,6],"2E");
	//입고등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	 subLayout.cells("a").showHeader();
	 subLayout.cells("a").setText("발주내역");
	 gridMst = new dxGrid(subLayout.cells("a"),false);
	 gridMst.addHeader({name:"No",         colId:"no",         width:"3",align:"center", type:"cntr"});
	 gridMst.addHeader({name:"발주일자",   colId:"baljuDate",  width:"5",align:"center", type:"ro"});
	 gridMst.addHeader({name:"공급업체",   colId:"supplyComp", width:"5",align:"left",   type:"ro"});
	 gridMst.addHeader({name:"부품코드",   colId:"partCode",   width:"5",align:"left",   type:"ro"});
	 gridMst.addHeader({name:"부품명",     colId:"partName",   width:"5",align:"left",   type:"ro"});
	 gridMst.addHeader({name:"규격",       colId:"partSpec",   width:"5",align:"left",   type:"ro"});
	 gridMst.addHeader({name:"단위",       colId:"partUnit",   width:"5",align:"left",   type:"ro"});
	 gridMst.addHeader({name:"발주수량",   colId:"baljuAmont", width:"5",align:"right",  type:"ro"});
	 gridMst.addHeader({name:"입고수량",   colId:"ipAmont",    width:"5",align:"right",  type:"ed"});
	 gridMst.addHeader({name:"미입고수량", colId:"mipAmount",  width:"5",align:"right",  type:"ed"});
	 gridMst.setUserData("","pk","no");
	 gridMst.setColSort("str");
	 gridMst.dxObj.setUserData("","@baljuDate","format_date");
	 gridMst.init();	
	 gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
    //선택 없애고 더블클릭으로 변경
    
	 subLayout.cells("b").showHeader();
	 subLayout.cells("b").setText("입고내역");
	 gridDtl = new dxGrid(subLayout.cells("b"),false);
	 gridDtl.addHeader({name:"No",         colId:"no",         width:"3",align:"center", type:"cntr"});
	 gridDtl.addHeader({name:"부품코드",   colId:"partCode",   width:"5",align:"left",   type:"ro"});
	 gridDtl.addHeader({name:"부품명",     colId:"partName",   width:"5",align:"left",   type:"ro"});
	 gridDtl.addHeader({name:"규격",       colId:"partSpec",   width:"5",align:"left",   type:"ro"});
	 gridDtl.addHeader({name:"단위",       colId:"partUnit",   width:"5",align:"left",   type:"ro"});
	 gridDtl.addHeader({name:"발주수량",   colId:"baljuAmont", width:"5",align:"right",  type:"ro"});
	 gridDtl.addHeader({name:"미입고수량", colId:"ipAmont",    width:"5",align:"right",  type:"ed"});
	 gridDtl.addHeader({name:"입고수량",   colId:"mipAmount",  width:"5",align:"right",  type:"ed"});
	 gridDtl.setUserData("","pk","no");
	 gridDtl.setColSort("str");
	 gridDtl.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
		
});
function doOnRowDblClicked(rId,cInd){
	
};

function fn_search(){
	
};

function fn_new(){
	
};

function fn_save(){
	
};

function fn_remove(){
	
}

function fn_add(){
	
};

function fn_delete(){
	
};
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	 <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
        <div class="row">
		  <div class="form-group form-group-sm">
		    <div class="col-sm-8 col-md-8">
			  <label class="col-sm-2 col-md-2 control-label" for="textinput">
			    일자 
			  </label>
			  <div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs format_dat e">
                  </div>
                  <div class="col-sm-2 col-md-2">
                        <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
              </div>
              <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
              </div>
		    </div>
	       </div>
        </div>      
        <div class="row">
	      <div class="form-group form-group-sm">
		     <div class="col-sm-8 col-md-8">
			   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			     등록자
			   </label>
		 	   <div class="col-sm-2 col-md-2">
			     <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
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
			     <input name="supplyComp" id="supplyComp" type="text" value=""  class="form-control input-xs">
			   </div>
		     </div>
	      </div>
	   </div>
     </form>
   </div>    
</div>