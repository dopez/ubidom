<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
var combo, combo01;
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
	gridMst.cs_setColumnHidden(["cycleKind","orderKey"]);
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
	gridDtl.addHeader({name:"점검자",       colId:"checkEmp",       width:"80",  align:"left",   type:"combo"});
	gridDtl.addHeader({name:"비고",         colId:"rmk",           width:"180", align:"left",   type:"ed"});
	gridDtl.setColSort("str");	
	gridDtl.setUserData("","pk","no");
	gridDtl.dxObj.setUserData("","@preFinalDate","format_date");
	gridDtl.dxObj.setUserData("","@chkPlanDate","format_date");
	gridDtl.dxObj.setUserData("","@checkDate","format_date");
	gridDtl.init(); 
	gridDtl.cs_setColumnHidden(["cycleKind","orderKey"]);
	gridDtl.attachEvent("onRowDblClicked",doOnRowDtlDblClicked);
	
	calMain = new dhtmlXCalendarObject([{input:"checkDate",button:"calpicker"},{input:"pfDate",button:"calpicker1"},{input:"ptDate",button:"calpicker2"}]); 
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
	
	$("#eqCode").keyup(function(e) {
    	if(e.target.id == "eqCode"){
    		gridMst.filterBy(1,byId("eqCode").value);
		}
	 }); 
	
	combo =gridDtl.getColumnCombo(10);
	combo01 = gridDtl.getColumnCombo(11);
	 gfn_single_comboLoad(combo,["1","2","3"],["양호","이상","보류"],3);
	 fn_comboLoad(combo01);
		
});
function fn_comboLoad(comboId,cFlag){
	var obj = {};
		comboId.setTemplate({
		    input: "#interName#",
		    columns: [
	          {header: "사원명", width: 100, option: "#empNo#"}
		    ]
		});
	    obj.korName = '';
		$.ajax({
			"url":"/erp/pers/pers/persAppointS/selEmpPop",
			"type":"post",
			"data":obj,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
				  comboId.addOption(list[i].empNo,list[i].korName);
                  } 
			}
	  });
};

function doOnRowDblClicked(rId,cInd){
	var cudVal = gridMst.setCells(rId,gridMst.getColIndexById('cudKey')).getValue();
	if(cudVal == 'DELETE'){
		MsgManager.alertMsg("WRN010");
		return;
	}else{
		var equiCodeIdx     = gridMst.getColIndexById('equiCode');    
		var equiNameIdx     = gridMst.getColIndexById('equiName');
		var checkItemIdx    = gridMst.getColIndexById('checkItem');    
		var checkItemNmIdx  = gridMst.getColIndexById('checkItemName');
		var cycleNameIdx    = gridMst.getColIndexById('cycleKindName');
		var cycleKindIdx    = gridMst.getColIndexById('cycleKind');    
		var cycleIdx        = gridMst.getColIndexById('cycle');
		var finalDateIdx    = gridMst.getColIndexById('preFinalDate');    
		var chkPlanDateIdx  = gridMst.getColIndexById('chkPlanDate');
		var orderKeyIdx     = gridMst.getColIndexById('orderKey');
		
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
	var chkPlanDateColIdx  = gridDtl.getColIndexById('chkPlanDate');
	var orderKeyColIdx     = gridDtl.getColIndexById('orderKey');
	  data[equiCodeColIdx]     = gridMst.setCells(rId,equiCodeIdx).getValue();
      data[equiNameColIdx]     = gridMst.setCells(rId,equiNameIdx).getValue();
      data[checkItemColIdx]    = gridMst.setCells(rId,checkItemIdx).getValue();
      data[checkItemNmColIdx]  = gridMst.setCells(rId,checkItemNmIdx).getValue();
      data[cycleNameColIdx]    = gridMst.setCells(rId,cycleNameIdx).getValue();
      data[cycleColIdx]        = gridMst.setCells(rId,cycleIdx).getValue();
	  data[finalDateColIdx]    = gridMst.setCells(rId,finalDateIdx).getValue();
      data[chkPlanDateColIdx]  = gridMst.setCells(rId,chkPlanDateIdx).getValue();  
      data[cycleKindColIdx]    = gridMst.setCells(rId,cycleKindIdx).getValue();
      data[orderKeyColIdx]    = gridMst.setCells(rId,orderKeyIdx).getValue();
	  gridDtl.addRow(data);
	  var delInx = gridMst.getSelectedRowIndex();
	  gridMst.cs_deleteRow(rId);
	}
};

function doOnRowDtlDblClicked(rId,cInd){
	var gridMstId = null;
	var gridMstIdx = null;
	var gridDtlOrderKey = gridDtl.setCells(rId,gridDtl.getColIndexById('orderKey')).getValue();
	
	for(var i=0;i<gridMst.getRowsNum();i++){
		var gridMstOrderKey = gridMst.setCells2(i,gridMst.getColIndexById('orderKey')).getValue();
		if(gridDtlOrderKey == gridMstOrderKey){
			gridMstId = gridMst.getRowId(i);
			gridMstIdx = i;
		}
	}
	
	gridMst.setCells(gridMstId,gridMst.getColIndexById('cudKey')).setValue('UPDATE');
	gridMst.cs_addRow(gridMstId);	
	gridDtl.deleteRow(rId);
};

function multiRowSelect(){
	var flag = true;
	var selRowId = {};
    	selRowId = gridMst.getSelectedRowId();
   	var selRowIdArr = selRowId.split(",");
 	for(j=0;j<selRowIdArr.length;j++){
 		var cudVal = gridMst.setCells(selRowIdArr[j],gridMst.getColIndexById('cudKey')).getValue();
 		if(cudVal == 'DELETE'){
 			MsgManager.alertMsg("WRN010");
 			flag = false;
 			return;
 		}
 	}
 	if(flag){
 		var equiCodeIdx     = gridMst.getColIndexById('equiCode');    
		var equiNameIdx     = gridMst.getColIndexById('equiName');
		var checkItemIdx    = gridMst.getColIndexById('checkItem');    
		var checkItemNmIdx  = gridMst.getColIndexById('checkItemName');
		var cycleNameIdx    = gridMst.getColIndexById('cycleKindName');
		var cycleKindIdx    = gridMst.getColIndexById('cycleKind');    
		var cycleIdx        = gridMst.getColIndexById('cycle');
		var finalDateIdx    = gridMst.getColIndexById('preFinalDate');    
		var chkPlanDateIdx  = gridMst.getColIndexById('chkPlanDate');
	    var orderKeyIdx     = gridMst.getColIndexById('orderKey');
 		
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
			var chkPlanDateColIdx  = gridDtl.getColIndexById('chkPlanDate');
			var orderKeyColIdx     = gridDtl.getColIndexById('orderKey');
			  data[equiCodeColIdx]     = gridMst.setCells(selRowIdArr[i],equiCodeIdx).getValue();
		      data[equiNameColIdx]     = gridMst.setCells(selRowIdArr[i],equiNameIdx).getValue();
		      data[checkItemColIdx]    = gridMst.setCells(selRowIdArr[i],checkItemIdx).getValue();
		      data[checkItemNmColIdx]  = gridMst.setCells(selRowIdArr[i],checkItemNmIdx).getValue();
		      data[cycleNameColIdx]    = gridMst.setCells(selRowIdArr[i],cycleNameIdx).getValue();
		      data[cycleColIdx]        = gridMst.setCells(selRowIdArr[i],cycleIdx).getValue();
			  data[finalDateColIdx]    = gridMst.setCells(selRowIdArr[i],finalDateIdx).getValue();
		      data[chkPlanDateColIdx]  = gridMst.setCells(selRowIdArr[i],chkPlanDateIdx).getValue();  
		      data[cycleKindColIdx]    = gridMst.setCells(selRowIdArr[i],cycleKindIdx).getValue();
		      data[orderKeyColIdx]    = gridMst.setCells(selRowIdArr[i],orderKeyIdx).getValue();
			  gridDtl.addRow(data);
			  var delInx = gridMst.getSelectedRowIndex();
			  gridMst.cs_deleteRow(selRowIdArr[i]);
	   	  }
 	}
}

function fn_search(){
	fn_loadGridMst();
	fh_loadGridDtl();
};

function fn_loadGridMst(){
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
	  if(pName == "equiCode"){
		$('#eqCode').val(data[0].equiCode);
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