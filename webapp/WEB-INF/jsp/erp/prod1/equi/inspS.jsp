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
	gridMst.addHeader({name:"NO",           colId:"no",            width:"50", align:"center", type:"cntr"});
	gridMst.addHeader({name:"설비코드",     colId:"equiCode",      width:"80", align:"left",   type:"ro"});
	gridMst.addHeader({name:"설비명",       colId:"equiName",      width:"80", align:"left",   type:"ro"});
	gridMst.addHeader({name:"항목코드",     colId:"checkItem",     width:"80", align:"left",   type:"ro"});
	gridMst.addHeader({name:"항목명",       colId:"checkItemName", width:"80", align:"left",   type:"ro"});
	gridMst.addHeader({name:"주기단위",     colId:"cycleKindName", width:"80", align:"center", type:"ro"});
	gridMst.addHeader({name:"점검주기",     colId:"cycle",         width:"60", align:"right",  type:"ro"});
	gridMst.addHeader({name:"최종점검일자", colId:"finalDate",     width:"90", align:"center", type:"ro"});
	gridMst.addHeader({name:"점검예정일자", colId:"chkPlanDate",   width:"90", align:"center", type:"ro"});
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","no");
	gridMst.dxObj.setUserData("","@finalDate","format_date");
	gridMst.dxObj.setUserData("","@chkPlanDate","format_date");
	gridMst.enableMultiselect(true);
	gridMst.init(); 
	gridMst.cs_setColumnHidden(["cycleKind"]);
	gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
	
	subLayout.cells("b").showHeader();
	//subLayout.cells("b").setText("점검대상");
     subLayout.cells("b").setText('점검대상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
     '&nbsp;&nbsp;<input type="button" value=" 선택항목 추가" onclick="multiRowSelect()" class="imgTest" style="color: blue; background-color: buttonhighlight;"');
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"NO",           colId:"no",            width:"50",  align:"center", type:"cntr"});
	gridDtl.addHeader({name:"설비코드",     colId:"equiCode",      width:"80",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"설비명",       colId:"equiName",      width:"80",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"항목코드",     colId:"checkItem",     width:"80",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"항목명",       colId:"checkItemName", width:"80",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"주기단위",     colId:"cycleKindName", width:"80",  align:"center", type:"ro"});
	gridDtl.addHeader({name:"점검주기",     colId:"cycle",         width:"60",  align:"right",  type:"ro"});
	gridDtl.addHeader({name:"최종점검일자", colId:"preFinalDate",  width:"90",  align:"center", type:"ro"});
	gridDtl.addHeader({name:"점검예정일자", colId:"chkPlanDate",   width:"90",  align:"center", type:"ro"});
	gridDtl.addHeader({name:"점검일자",     colId:"checkDate",     width:"80",  align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"점검결과",     colId:"result",        width:"80",  align:"left",   type:"combo"});
	gridDtl.addHeader({name:"점검자",       colId:"korName",       width:"80",  align:"left",   type:"ro"});
	gridDtl.addHeader({name:"비고",         colId:"rmk",           width:"180", align:"left",   type:"ed"});
	gridDtl.setColSort("str");	
	gridDtl.setUserData("","pk","no");
	gridDtl.dxObj.setUserData("","@preFinalDate","format_date");
	gridDtl.dxObj.setUserData("","@chkPlanDate","format_date");
	gridDtl.dxObj.setUserData("","@checkDate","format_date");
	gridDtl.init(); 
	gridDtl.cs_setColumnHidden(["checkEmp","cycleKind"]);
	gridDtl.attachEvent("onRowSelect",doOnDtlRowSelect);
	
	calMain = new dhtmlXCalendarObject([{input:"pfDate",button:"calpicker"},{input:"ptDate",button:"calpicker1"},{input:"checkDate",button:"calpicker2"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("pfDate").value = t;
	byId("ptDate").value = t;
	byId("checkDate").value = t;
	
	$("#eqCode").dblclick(function(e){
		if(e.target.id == "eqCode"){
			gfn_load_pop('w1','common/equiCodePOP',true,{"eqCode":$(this).val()});
		}
	});
	
	combo =gridDtl.getColumnCombo(10);
	combo.setTemplate({
	    input: "#interName#",
	    columns: [
		   {header: "코드명",   width: 100,  option: "#interName#"}
	    ]
	});
	combo.addOption("1","양호");
	combo.addOption("2","이상");
	combo.addOption("3","보류");
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
	var checkItemNmColIdx  = gridDtl.getColIndexById('checkItemName');
	var cycleNameColIdx    = gridDtl.getColIndexById('cycleKindName');
	var cycleKindColIdx    = gridDtl.getColIndexById('cycleKind');    
	var cycleColIdx        = gridDtl.getColIndexById('cycle');
	var finalDateColIdx    = gridDtl.getColIndexById('preFinalDate');    
	var chkPlanDateColIdx = gridDtl.getColIndexById('chkPlanDate');
	  data[equiCodeColIdx]     = gridMst.setCells(rId,1).getValue();
      data[equiNameColIdx]     = gridMst.setCells(rId,2).getValue();
      data[checkItemColIdx]    = gridMst.setCells(rId,3).getValue();
      data[checkItemNmColIdx]  = gridMst.setCells(rId,4).getValue();
      data[cycleNameColIdx]    = gridMst.setCells(rId,5).getValue();
      data[cycleColIdx]        = gridMst.setCells(rId,6).getValue();
	  data[finalDateColIdx]    = gridMst.setCells(rId,7).getValue();
      data[chkPlanDateColIdx]  = gridMst.setCells(rId,8).getValue();  
      data[cycleKindColIdx]    = gridMst.setCells(rId,9).getValue();
	  gridDtl.addRow(data);
	  var delInx = gridMst.getSelectedRowIndex();
	  gridMst.deleteRow(rId);
};

function doOnDtlRowSelect(id,ind){
	if(ind==11){
		gfn_load_pop('w1','common/empPOP',true,{});
	}
};

function multiRowSelect(){
	var selRowId = {};
    	selRowId = gridMst.getSelectedRowId();
   	var selRowIdArr = selRowId.split(",");
 
	var totalRowNum = gridMst.getRowsNum();
	for(i=0;i<selRowIdArr.length;i++){
		var totalColNum = gridDtl.getColumnCount();
	    var data = new Array(totalColNum);
		var equiCodeColIdx     = gridDtl.getColIndexById('equiCode');    
		var equiNameColIdx     = gridDtl.getColIndexById('equiName');
		var checkItemColIdx    = gridDtl.getColIndexById('checkItem');    
		var checkItemNmColIdx  = gridDtl.getColIndexById('checkItemName');
		var cycleNameColIdx    = gridDtl.getColIndexById('cycleKindName');
		var cycleKindColIdx    = gridDtl.getColIndexById('cycleKind');    
		var cycleColIdx        = gridDtl.getColIndexById('cycle');
		var finalDateColIdx    = gridDtl.getColIndexById('preFinalDate');    
		var chkPlanDateColIdx = gridDtl.getColIndexById('chkPlanDate');
		  data[equiCodeColIdx]     = gridMst.setCells(selRowIdArr[i],1).getValue();
	      data[equiNameColIdx]     = gridMst.setCells(selRowIdArr[i],2).getValue();
	      data[checkItemColIdx]    = gridMst.setCells(selRowIdArr[i],3).getValue();
	      data[checkItemNmColIdx]  = gridMst.setCells(selRowIdArr[i],4).getValue();
	      data[cycleNameColIdx]    = gridMst.setCells(selRowIdArr[i],5).getValue();
	      data[cycleColIdx]        = gridMst.setCells(selRowIdArr[i],6).getValue();
		  data[finalDateColIdx]    = gridMst.setCells(selRowIdArr[i],7).getValue();
	      data[chkPlanDateColIdx]  = gridMst.setCells(selRowIdArr[i],8).getValue();  
	      data[cycleKindColIdx]    = gridMst.setCells(selRowIdArr[i],9).getValue();
		  gridDtl.addRow(data);
		  var delInx = gridMst.getSelectedRowIndex();
		  gridMst.deleteRow(selRowIdArr[i]);
   	}
}

function fn_search(){
	fn_loadGridMst();
	fh_loadGridDtl();
};

function fn_loadGridMst(){
	if($('#eqCode').val() == ''){
		$('#eqCode').val('%');
	}
	var params = gfn_getFormElemntsData('frmSearch');
    gfn_callAjaxForGrid(gridMst,params,"gridMstSearch",subLayout.cells("a"));
};

function fh_loadGridDtl(){
	if($('#eqCode').val() == ''){
		$('#eqCode').val('%');
	}
	var params = gfn_getFormElemntsData('frmSearch');
    gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"),fn_loadGridDtlCB);
    $('#eqCode').val('');
};
function fn_loadGridDtlCB(data){
	$('#pfDate').keyup();
	$('#ptDate').keyup();
	$('#checkDate').keyup();
}
function fn_new(){
	gridDtl.clearAll();
};

function fn_save(){
	var rowIdx = gridMst.getSelectedRowIndex();
	 var jsonStr = gridDtl.getJsonUpdated2();
	 if(jsonStr == null || jsonStr.length <= 0 ) return;
	 $("#jsonData").val(jsonStr);
    $.ajax({
       url : "/erp/prod1/equi/inspS/gridDtlSave",
       type : "POST",
       data : $("#pform").serialize(),
       async : true,
       success : function(data) {
       MsgManager.alertMsg("INF001");
       fn_search();
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
	var i;
      if(pName == "empNo"){
		for(i=0;i<data.length;i++){
			var selIdx = gridDtl.getSelectedRowIndex();
			gridDtl.setCells2(selIdx,11).setValue(data[i].korName);
			gridDtl.setCells2(selIdx,13).setValue(data[i].empNo);
		}
      }
	  if(pName == "equiCode"){
		  for(i=0;i<data.length;i++){
			 $('#eqCode').val(data[i].equiCode);
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
	   <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
         <div class="row">
		    <div class="form-group form-group-sm">
		      <div class="col-sm-8 col-md-8">
			    <label class="col-sm-2 col-md-2 control-label" for="textinput">
			     점검일자 
			    </label>
			    <div class="col-sm-2 col-md-2">
                    <div class="col-sm-10 col-md-10">
                       <input name="checkDate" id="checkDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
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
				    점검예정기간 
				   </label>
				   <div class="col-sm-6 col-md-6">
                       <div class="col-sm-4 col-md-4">
                           <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="pfDate" id="pfDate" value="">
                           </div>
                           <div class="col-sm-2 col-md-2">
                               <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'ptDate', 'max')"/>
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
			         설비코드
			        </label>
			        <div class="col-sm-2 col-md-2">
			          <input name="eqCode" id="eqCode" type="text" value="" placeholder="" class="form-control input-xs">
			        </div>
		        </div>
	         </div>
	       </div>  
       </form>
   </div>    
</div>