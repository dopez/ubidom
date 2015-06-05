<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
var combo;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4,6],"2E");
	//설비점검등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("점검대상");
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"NO",           colId:"no",          width:"4", align:"center", type:"cntr"});
	gridMst.addHeader({name:"설비코드",     colId:"equiCode",    width:"6", align:"center", type:"ro"});
	gridMst.addHeader({name:"설비명",       colId:"equiName",    width:"6", align:"center", type:"ro"});
	gridMst.addHeader({name:"항목코드",     colId:"checkItem",   width:"6", align:"center", type:"ro"});
	gridMst.addHeader({name:"항목명",       colId:"checkItemNm", width:"6", align:"center", type:"ro"});
	gridMst.addHeader({name:"주기단위",     colId:"cycleKind",   width:"6", align:"center", type:"ro"});
	gridMst.addHeader({name:"점검주기",     colId:"cycle",       width:"6", align:"center", type:"ro"});
	gridMst.addHeader({name:"최종점검일자", colId:"finalDate",   width:"6", align:"center", type:"ro"});
	gridMst.addHeader({name:"점검예정일자", colId:"finalPreDate",width:"6", align:"center", type:"ro"});
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","no");
	gridMst.dxObj.setUserData("","@finalDate","format_date");
	gridMst.dxObj.setUserData("","@finalPreDate","format_date");
	gridMst.init(); 
	gridMst.cs_setColumnHidden(["korName"]);
	gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("점검대상");
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"NO",           colId:"no",          width:"4", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"설비코드",     colId:"equiCode",    width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"설비명",       colId:"equiName",    width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"항목코드",     colId:"checkItem",   width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"항목명",       colId:"checkItemNm", width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"주기단위",     colId:"cycleKind",   width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"점검주기",     colId:"cycle",       width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"최종점검일자", colId:"finalDate",   width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"점검예정일자", colId:"finalPreDate",width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"점검일자",     colId:"checkDate",   width:"6", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"점검결과",     colId:"checkReq",    width:"6", align:"center", type:"combo"});
	gridDtl.addHeader({name:"점검자",       colId:"korName",     width:"6", align:"center", type:"ro"});
	gridDtl.addHeader({name:"비고",         colId:"rmk",         width:"8", align:"center", type:"ed"});
	gridDtl.setColSort("str");	
	gridDtl.setUserData("","pk","no");
	gridDtl.dxObj.setUserData("","@finalDate","format_date");
	gridDtl.dxObj.setUserData("","@finalPreDate","format_date");
	gridDtl.dxObj.setUserData("","@checkDate","format_date");
	gridDtl.init(); 
	gridDtl.cs_setColumnHidden(["empNo"]);
	gridMst.attachEvent("onRowSelect",doOnDtlRowSelect);
	
	calMain = new dhtmlXCalendarObject([{input:"inspDate",button:"calpicker"},{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("inspDate").value = t;
	byId("stDate").value = t;
	byId("edDate").value = t;
	
	combo =gridDtl.getColumnCombo(10);
	combo.setTemplate({
	    input: "#interName#",
	    columns: [
		   {header: "코드명",   width: 100,  option: "#interName#"}
	    ]
	});
	combo.addOption("P","합격");
	combo.addOption("F","불합격");
	combo.enableFilteringMode(true);
	combo.enableAutocomplete(true);
	combo.allowFreeText(true);
		
});
function doOnRowDblClicked(rId,cInd){
	var totalColNum = gridDtl.getColumnCount();
    var data = new Array(totalColNum);
	var equiCodeColIdx     = gridDtl.getColIndexById('equiCode');    
	var equiNameColIdx     = gridDtl.getColIndexById('equiName');
	var checkItemColIdx    = gridDtl.getColIndexById('checkItem');    
	var checkItemNmColIdx  = gridDtl.getColIndexById('checkItemNm');
	var cycleKindColIdx    = gridDtl.getColIndexById('cycleKind');    
	var cycleColIdx        = gridDtl.getColIndexById('cycle');
	var finalDateColIdx    = gridDtl.getColIndexById('finalDate');    
	var finalPreDateColIdx = gridDtl.getColIndexById('finalPreDate');
	var korNameColIdx      = gridDtl.getColIndexById('korName');
	  data[equiCodeColIdx]     = gridDtl.setCells(rId,1).getValue();
      data[equiNameColIdx]     = gridDtl.setCells(rId,2).getValue();
      data[checkItemColIdx]    = gridDtl.setCells(rId,3).getValue();
      data[checkItemNmColIdx]  = gridDtl.setCells(rId,4).getValue();
      data[cycleKindColIdx]    = gridDtl.setCells(rId,5).getValue();
      data[cycleColIdx]        = gridDtl.setCells(rId,6).getValue();
	  data[finalDateColIdx]    = gridDtl.setCells(rId,7).getValue();
      data[finalPreDateColIdx] = gridDtl.setCells(rId,8).getValue(); 
      data[korNameColIdx]      = gridDtl.setCells(rId,9).getValue(); 
	  gridDtl.addRow(data);
};

function doOnDtlRowSelect(id,ind){
	if(ind==11){
		gfn_load_pop('w1','common/empPOP',true,{});
	}
};

function fn_search(){
	fn_loadGridMst();
};

function fn_loadGridMst(){
	/*
	var params = gfn_getFormElemntsData('frmSearch');
    gfn_callAjaxForGrid(gridMain,params,"gridMstSearch",subLayout.cells("a")); */
};

function fn_new(){
	gridDtl.clearAll();
};

function fn_save(){
	var rowIdx = gridMst.getSelectedRowIndex();
	 var jsonStr = gridDtl.getJsonUpdated2();
	 if(jsonStr == null || jsonStr.length <= 0 ) return;
	 $("#jsonData").val(jsonStr);
    $.ajax({
       url : "",
       type : "POST",
       data : $("#pform").serialize(),
       async : true,
       success : function(data) {
       MsgManager.alertMsg("INF001");
       gridMst.selectRow(rowIdx,true,true,true);
       fn_new();
        }
   }); 
};

function fn_remove(){
	for(var i=0; i<gridDtl.getRowsNum();i++){
		gridDtl.cs_deleteRow(gridDtl.getRowId(i));	 
	 }
};

function fn_delete(){
	var rodid = gridDtl.getSelectedRowId();
	gridDtl.cs_deleteRow(rodid);
};

function fn_onClosePop(pName,data){
	var selIdx = gridDtl.getSelectedRowIndex();
	var i;
      if(pName == "empNo"){
		for(i=0;i<data.length;i++){
			gridDtl.setCells2(selIdx,11).setValue(data[i].korName);
			gridDtl.setCells2(selIdx,13).setValue(data[i].empNo);
		}
	}	  
 };
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
         <div class="row">
		    <div class="form-group form-group-sm">
		      <div class="col-sm-8 col-md-8">
			    <label class="col-sm-2 col-md-2 control-label" for="textinput">
			     점검일자 
			    </label>
			    <div class="col-sm-2 col-md-2">
                    <div class="col-sm-10 col-md-10">
                       <input name="inspDate" id="inspDate" type="text" value="" placeholder="" class="form-control input-xs">
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
				    점검기간 
				   </label>
				   <div class="col-sm-6 col-md-6">
                       <div class="col-sm-4 col-md-4">
                           <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                           </div>
                           <div class="col-sm-2 col-md-2">
                               <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')"/>
                           </div>
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                           <div class="col-sm-4 col-md-4">
                              <div class="col-sm-10 col-md-10">
                                <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                              </div>
                              <div class="col-sm-2 col-md-2">
                                  <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
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
			        <label class="col-sm-1 col-md-1 control-label" for="textinput">
			        등록자
			       </label>
			       <div class="col-sm-2 col-md-2">
			        <input name="register" id="register" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
		        </div>
	         </div>
	       </div>   
       </form>
   </div>    
</div>