<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/component/jqueryFileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="/component/jqueryFileupload/js/jquery.iframe-transport.js"></script>
<script src="/component/jqueryFileupload/js/jquery.fileupload.js"></script>
<link href="/component/jqueryFileupload/bootstrap-fileresize.css" type="text/css" rel="stylesheet" />
<link href="/component/jqueryFileupload/css/dropzone.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl01, gridDtl02;
var calMain;
var toolbar01, toolbar02;
var combo01, combo02, combo03, combo04, combo05;
var rowSelVal;
var popCheck = 0;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4],"3L");
	//설비이력등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("b").setHeight(250);
	subLayout.cells("b").attachObject("bootContainer2");
	
	subLayout.cells("a").setWidth(303);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"NO",       colId:"no",         width:"50", align:"center", type:"cntr"});
	gridMst.addHeader({name:"설비코드", colId:"equiCode",   width:"80", align:"left",   type:"ro"});
	gridMst.addHeader({name:"설비명",   colId:"equiName",   width:"80", align:"left",   type:"ro"});
	gridMst.addHeader({name:"사용공정", colId:"useProcess", width:"90", align:"left",   type:"ro"});
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","equiCode");
	gridMst.init(); 
	toolbar.attachEvent("onClick",gridMstOnClick);
	gridMst.attachEvent("onRowSelect",doOnGridMstSelect);
	
	gridTabbar = subLayout.cells("c").attachTabbar({
	       tabs: [{id: "a1",text: "점검항목",active: true}, 
	              {id: "a2",text: "소모성부품이력등록"}]});
	
	 gridDtl01 = new dxGrid(gridTabbar.tabs("a1"), false);
	    gridDtl01.addHeader({name:"NO",           colId:"no",        width:"50",  align:"center", type:"cntr"});
	    gridDtl01.addHeader({name:"항목명",       colId:"checkItem", width:"80",  align:"left",   type:"combo"});
	    gridDtl01.addHeader({name:"주기단위",     colId:"cycleKind", width:"80",  align:"center",  type:"combo"});
	    gridDtl01.addHeader({name:"주기",         colId:"cycle",     width:"60",  align:"right",  type:"edn"});
	    gridDtl01.addHeader({name:"최종점검일자", colId:"finalDate", width:"90",  align:"center", type:"dhxCalendarA"});	
	    gridDtl01.addHeader({name:"비고",         colId:"rmk",       width:"150", align:"left",   type:"ed"});
	    gridDtl01.setUserData("","pk","checkItem");
	    gridDtl01.dxObj.setUserData("","@finalDate","format_date");
	    gridDtl01.setColSort("str");
	    gridDtl01.init(); 
	    gridDtl01.cs_setColumnHidden(["equiCode"]);
	    
	    var gridTab01 = gridTabbar.tabs("a1");
	    toolbar01 = subToolbar(toolbar01,gridTab01,[1,3,4,5,6]);
		toolbar01.attachEvent("onClick",gridDtl01OnClick);
	    
	    
	    gridDtl02 = new dxGrid(gridTabbar.tabs("a2"), false);
	    gridDtl02.addHeader({name:"NO",       colId:"no",        width:"50",  align:"center", type:"cntr"});
	    gridDtl02.addHeader({name:"부품코드", colId:"partCode",  width:"80",  align:"left",    type:"ro"});
	    gridDtl02.addHeader({name:"부품명",   colId:"partName",  width:"100",  align:"left",   type:"combo"});
	    gridDtl02.addHeader({name:"규격",     colId:"partSpec",  width:"80",  align:"left",   type:"ro"});
	    gridDtl02.addHeader({name:"주기단위", colId:"cycleKind", width:"80",  align:"center",  type:"combo"});
	    gridDtl02.addHeader({name:"교환주기", colId:"cycle",     width:"60",  align:"right",  type:"edn"});
	    gridDtl02.addHeader({name:"적정재고", colId:"safeStock", width:"80",  align:"right",  type:"edn"});
	    gridDtl02.addHeader({name:"보험회사", colId:"insurance", width:"120", align:"left",   type:"ed"});	
	    gridDtl02.setUserData("","pk","partCode");
	    gridDtl02.setColSort("str");
	    gridDtl02.init(); 
	    gridDtl02.cs_setColumnHidden(["equiCode"]);
	    gridDtl02.attachEvent("onRowDblClicked",doOnGridDtl02Select);
		var gridTab02 = gridTabbar.tabs("a2");
		toolbar02 = subToolbar(toolbar02,gridTab02,[1,3,4,5,6]);
		toolbar02.attachEvent("onClick",gridDtl02OnClick);
	    
	calMain = new dhtmlXCalendarObject([{input:"buyDate",button:"calpicker1"},{input:"regiDate",button:"calpicker2"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	fn_calValue();
	
	$("#updImg,#delImg").click(function(e){
		if(e.target.id == "updImg"){
			 var rowCheck = gridMst.getSelectedRowId();
	 		if(rowCheck == null){
	 			return false;
	 		}else{
	 			byId("fileName").click();
	 			fileupload('fileName','target',fileUploadCB);
	 		} 
		}
		if(e.target.id == "delImg"){
			  disableValue(1);
		       byId("cudKey").value = "UPDATE";
              $.ajax({
               url : "/erp/prod1/equi/historyS/prcsEquiFileDelete",
               type : "POST",
               data : gfn_getFormElemntsData('frmMain'),
               async : true,
               success : function(data) {
               MsgManager.alertMsg("INF003");
               fn_gridMstSearch();
              }
          }); 
		}
	});
	 
	
	$("#supplyComp,#splyComp,#eqCode").dblclick(function(e){
		if(e.target.id == "supplyComp"){
			popCheck = 1;
			gfn_load_pop('w1','common/codeLen2POP',true,{});
		}
		if(e.target.id == "splyComp"){
			popCheck = 2;
			gfn_load_pop('w1','common/codeLen2POP',true,{});
		}
		if(e.target.id == "eqCode"){
			popCheck = 3;
			gfn_load_pop('w1','common/codeLen2POP',true,{});
		}
	});

	$("#frmMain input:text,input:checkbox").on("change keyup", function(e){
		if($("#cudKey").val() == ''){
		   $("#cudKey").val("INSERT");
		}
	});
	
	combo01 =gridDtl01.getColumnCombo(1);
	combo02 =gridDtl01.getColumnCombo(2);
	combo03 =gridDtl02.getColumnCombo(4);
	combo04 = dhtmlXComboFromSelect("empNo");
	combo05 =gridDtl02.getColumnCombo(2);
	
	gfn_1col_comboLoad(combo01,"E02");
	gfn_1col_comboLoad(combo02,"C10");
	gfn_1col_comboLoad(combo03,"C10");
	gfn_codeLen2_comboLoad(combo04,"사원");
	gfn_codeLen4_comboLoad(combo05,"설비부품");
	
	combo05.attachEvent("onBlur", function(){
		var rowIdx = gridDtl02.getSelectedRowIndex();
		gridDtl02.setCells2(rowIdx,1).setValue(combo05.getSelectedText().innerCode);
		gridDtl02.setCells2(rowIdx,2).setValue(combo05.getSelectedText().innerName);
		gridDtl02.setCells2(rowIdx,3).setValue(combo05.getSelectedText().spec);
	});
	
	fn_gridMstSearch();
});
function fn_onOpenPop(pName){
	var obj = {};
	if(pName == 'codeLen2'){
		if(popCheck == 1){
			obj.innerName = $('#supplyComp').val();
			obj.kind = '고객';
		}else if(popCheck == 2){
			obj.innerName = $('#splyComp').val();
			obj.kind = '고객';
		}else{
			obj.innerName = $('#eqCode').val();
			obj.kind = '설비';
		}
	}else{
		obj.innerName = '';
		obj.kind = '설비';
	}
	return obj;
}

function gridMstOnClick(id){
   if(id == "btn1"){
	   fn_gridMstSearch();
	}
   if(id == "btn2"){
	   fn_gridMstNew();
	}
   if(id == "btn3"){
		fn_formSave();	 
	}
   if(id == "btn4"){
	   fn_gridMstRemove();
	}
};

function gridDtl01OnClick(id){
	if(id == "btn1"){
		fn_tab1Search();
	}
	if(id == "btn3"){
		fn_tab1Save();
	}
	if(id == "btn4"){
		fn_tab1Remove();
	}
	if(id == "btn5"){
		fn_tab1Add();
	}
	if(id == "btn6"){
		fn_tab1Delete();
	}
};

function gridDtl02OnClick(id){
	if(id == "btn1"){
		fn_tab2Search();
	}
	if(id == "btn3"){
		fn_tab2Save();
	}
	if(id == "btn4"){
		fn_tab2Remove();
	}
	if(id == "btn5"){
		fn_tab2Add();
	}
	if(id == "btn6"){
		fn_tab2Delete();
	}
};
function fileUploadCB(data){
	fn_formSave();
};
function fn_calValue(){
	var t = dateformat(new Date());
	byId("buyDate").value = t;
	byId("regiDate").value = t;
};

function disableValue(flag){
	if(flag == 1){
	  $("input[name=equiCode]").attr("disabled",false);
	  $("input[name=equiName]").attr("disabled",false);
	  combo04.enable();
	  
	}else{
	  $("input[name=equiCode]").attr("disabled",true);
	  $("input[name=equiName]").attr("disabled",true);
	 combo04.disable();
	}
}
function fn_gridMstSearch(){
	fn_loadGridMst(); 
	fn_gridMstNew();
}
function fn_gridMstNew(){
	byId("frmMain").reset();
	byId("frmSearch").reset();
	$('#target').removeAttr('src');
	fn_calValue();
	disableValue(1);
}
function fn_loadGridMst(){
	var params = gfn_getFormElemntsData('frmSearch');
    gfn_callAjaxForGrid(gridMst,params,"gridMstSearch",subLayout.cells("a"),fn_loadGridMstCB);
    fn_gridMstNew();
};

function fn_loadGridMstCB(data){
	var rowIdx = cs_selectRow_check(gridMst,"equiCode",rowSelVal)
	gridMst.selectRow(rowIdx,true,true,true);
};

function fn_formSave(){
	cudVal = $('#cudKey').val();	
	 if(cudVal == ''){
		 byId("cudKey").value = "INSERT"; 
	  }
	 f_dxRules = {
		equiCode : ["설비코드",r_notEmpty],
		equiName : ["설비명",r_notEmpty],
	  };
	 if(gfn_formValidation('frmMain')){
		 disableValue(1);
		 rowSelVal = $('equiCode').val();
		var params = gfn_getFormElemntsData('frmMain'); 
		gfn_callAjaxComm(params,"gridFormSave",fn_formSaveCB);  
   }
};
function fn_formSaveCB(data){
	fn_gridMstSearch();
	rowSelVal = null;
}

function fn_gridMstRemove(){
	 $('#cudKey').val('DELETE');
	   var rodid = gridMst.getSelectedRowId();
	   gridMst.cs_deleteRow(rodid); 
}
function doOnGridMstSelect(id,ind){
	fn_gridMstNew();
	byId("cudKey").value = "UPDATE";
	disableValue(2);
	var obj={};
	obj.equiCode= gridMst.setCells(id,1).getValue();
	fn_loadFormList(obj);
	fn_tab1Search();
	fn_tab2Search();
}
function fn_loadFormList(params){
	gfn_callAjaxForForm("frmMain",params,"gridFormSearch",fn_loadFormListCB);
};
function fn_loadFormListCB(data){
	if(data[0].imgPath != null){			
		  $("#target").attr("src", "/erp/prod1/equi/historyS/getEquiImg?equiCode=" + data[0].equiCode);
	}
	combo04.setComboValue(data[0].empNo);
};

function fn_tab1Search(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
		obj = {};
		obj.equiCode = gridMst.setCells(rowCheck,1).getValue();
	  gfn_callAjaxForGrid(gridDtl01,obj,"gridTab1Search",subLayout.cells("c"));
	}
};

function fn_tab2Search(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
		obj = {};
		obj.equiCode = gridMst.setCells(rowCheck,1).getValue();
		gfn_callAjaxForGrid(gridDtl02,obj,"gridTab2Search",subLayout.cells("c"));
	}
	
};

function fn_tab1Save(){
	var rowIdx = gridDtl01.getSelectedRowIndex();
	var colIdx = gridDtl01.getColIndexById('equiCode');
	rowSelVal=gridDtl01.setCells2(rowIdx, colIdx).getValue();
	
	 var jsonStr = gridDtl01.getJsonUpdated2();
   if (jsonStr == null || jsonStr.length <= 0) return;         		
       $("#jsonData").val(jsonStr);   
        var params = $("#tab1form").serialize(); 
		gfn_callAjaxComm(params,"gridTab1Save",fn_tab1SaveCB); 
};
function fn_tab1SaveCB(data){
	fn_tab1Search();
    rowSelVal = null;
}
function fn_tab1Remove(){
	for(var i=0; i<gridDtl01.getRowsNum();i++){
		gridDtl01.cs_deleteRow(gridDtl01.getRowId(i));	 
	 }
};

function fn_tab1Add(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
	 var totalColNum = gridDtl01.getColumnCount();
	    var data = new Array(totalColNum);
	    var finalDateColIdx = gridDtl01.getColIndexById('finalDate');
		var equiCodeColIdx = gridDtl01.getColIndexById('equiCode');
		var cycleColIdx = gridDtl01.getColIndexById('cycle');
		    data[finalDateColIdx] = dateformat(new Date());
	        data[equiCodeColIdx] = gridMst.setCells(rowCheck,1).getValue();
	        data[cycleColIdx] = 0;
		    gridDtl01.addRow(data);
	}
};

function fn_tab1Delete(){
    var rodid = gridDtl01.getSelectedRowId();
    gridDtl01.cs_deleteRow(rodid);
};

function doOnGridDtl02Select(id,ind){
	if(ind==1){
		gfn_load_pop('w1','common/codeLen4POP',true,{});
	}
}

function fn_tab2Save(){
	var rowIdx = gridDtl02.getSelectedRowIndex();
	var colIdx = gridDtl02.getColIndexById('equiCode');
	rowSelVal=gridDtl02.setCells2(rowIdx, colIdx).getValue();
	
	 var jsonStr = gridDtl02.getJsonUpdated2();
   if (jsonStr == null || jsonStr.length <= 0) return;         		
       $("#jsonData2").val(jsonStr);  
        var params = $("#tab2form").serialize(); 
		gfn_callAjaxComm(params,"gridTab2Save",fn_tab2SaveCB);
};
function fn_tab2SaveCB(data){
	fn_tab2Search();
    rowSelVal = null;
}
function fn_tab2Remove(){
	for(var i=0; i<gridDtl02.getRowsNum();i++){
		gridDtl02.cs_deleteRow(gridDtl02.getRowId(i));	 
	 }
};

function fn_tab2Add(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
	 var totalColNum = gridDtl02.getColumnCount();
	 var data = new Array(totalColNum);
		var equiCodeColIdx = gridDtl02.getColIndexById('equiCode');
		var cycleColIdx = gridDtl02.getColIndexById('cycle');
		var safeStockColIdx = gridDtl02.getColIndexById('safeStock');
	        data[equiCodeColIdx] = gridMst.setCells(rowCheck,1).getValue();
	        data[cycleColIdx] = 0;
	        data[safeStockColIdx] = 0;
		    gridDtl02.addRow(data);
	}
};

function fn_tab2Delete(){
    var rodid = gridDtl02.getSelectedRowId();
    gridDtl02.cs_deleteRow(rodid);
};

function fn_onClosePop(pName,data){
	 if(pName == "codeLen4"){
		var rowIdx = gridDtl02.getSelectedRowIndex();
		gridDtl02.setCells2(rowIdx,1).setValue(data[0].innerCode);
		gridDtl02.setCells2(rowIdx,2).setValue(data[0].innerName);
		gridDtl02.setCells2(rowIdx,3).setValue(data[0].spec);
	  }else if(pName == "codeLen2"){
		  if(popCheck == 1){
			  $('#supplyComp').val(data[0].innerName);
		  }else if(popCheck == 2){
			  $('#splyComp').val(data[0].innerName);  
		  }else{
			  $('#eqCode').val(data[0].innerCode);  
		  }
	  }
 };
 function fn_exit(){
		var exitVal = cs_close_event([gridDtl01,gridDtl02]);
		if(exitVal){
			mainTabbar.tabs(ActTabId).close();	
		}else{
			if(MsgManager.confirmMsg("WRN012")){
				mainTabbar.tabs(ActTabId).close();	
			}else{
				return true;
			}
		} 
}
</script>
<form id="tab1form" name="tab1form" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<form id="tab2form" name="tab2form" method="post">
    <input type="hidden" id="jsonData2" name="jsonData2" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">      
         <div class="row">
	        <div class="form-group form-group-sm">
		       <div class="col-sm-8 col-md-8">
			      <label class="col-sm-2 col-md-2 control-label" for="textinput">
			       설비코드
			      </label>
			      <div class="col-sm-2 col-md-2">
			        <input name="eqCode" id="eqCode" type="text" value="" placeholder="" class="form-control input-xs">
			      </div>
			      <label class="col-sm-1 col-md-1 control-label" for="textinput">
			       거래처
			      </label>
			      <div class="col-sm-2 col-md-2">
			         <input name="splyComp" id="splyComp" type="text" value="" placeholder="" class="form-control input-xs">
			      </div>
		       </div>
	       </div>
	     </div>
      </form>
  </div>   
</div>
<div id="bootContainer2" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmMain" name="frmMain" enctype="multipart/form-data" style="padding-top:10px;padding-bottom:5px;margin:0px;">      
          <input type="hidden" id="cudKey" name="cudKey" />
          <input type="hidden" id="imgPath"  name="imgPath">
          <input id="fileName" type="file" name="fileName" data-url="/erp/prod1/equi/historyS/prcsEquiFileUpload" multiple style="display: none;">
       <div class="col-sm-4 col-md-4">
	     <div class="row">
		   <div class="form-group form-group-sm">
			  <div class="col-sm-9 col-md-9 col-sm-offset-1 col-md-offset-1">
				 <img  src=""  height="180px;" width="400px;" id="target" name="target">
			  </div>
		   </div>
 		  </div>
		  <div class="row">
		   <div class="form-group form-group-sm">
			  <div class="col-sm-2 col-md-2 col-sm-offset-3 col-md-offset-3">
				 <input name="updImg" id="updImg" type="button" value="첨부" class="form-control btn btn-default btn-xs">
			  </div>
			  <div class="col-sm-2 col-md-2 col-sm-offset-1 col-md-offset-1">
				  <input name="delImg" id="delImg" type="button" value="삭제" class="form-control btn btn-default btn-xs">
			  </div>
		   </div>
 		 </div>
	   </div>
       <div class="col-sm-6 col-md-6">
          <div class="row">
	         <div class="form-group form-group-sm">
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         설비코드
		        </label>
		        <div class="col-sm-3 col-md-3">
			       <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		          설비명
		        </label>
		        <div class="col-sm-3 col-md-3">
			      <input name="equiName" id="equiName" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
	         </div>
	      </div>
          <div class="row">
	         <div class="form-group form-group-sm">
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         규격
		        </label>
		        <div class="col-sm-3 col-md-3">
			      <input name="standard" id="standard" type="text" value="" placeholder="" class="form-control input-xs">
		        </div>
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         용량
		       </label>
		       <div class="col-sm-3 col-md-3">
			      <input name="capacity" id="capacity" type="text" value="" placeholder="" class="form-control input-xs">
		       </div>
	        </div>
	     </div>
	    <div class="row">
	       <div class="form-group form-group-sm">
		      <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       구입금액
		      </label>
		      <div class="col-sm-3 col-md-3">
			     <input name="buyMoney" id="buyMoney" type="text" value="0" placeholder="" class="form-control input-xs">
		      </div>
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        구입일자
		      </label>
		       <div class="col-sm-3 col-md-3">
                  <div class="col-sm-10 col-md-10">
                     <input name="buyDate" id="buyDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                  </div>
                  <div class="col-sm-2 col-md-2">
                      <input type="button" id="calpicker1" class="calicon form-control input-xs">
                  </div>              
               </div> 
	        </div>
	    </div>
	    <div class="row">
	       <div class="form-group form-group-sm">
		      <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        사용공정
		      </label>
		      <div class="col-sm-3 col-md-3">
			     <input name="useProcess" id="useProcess" type="text" value="" placeholder="" class="form-control input-xs">
		      </div>
		      <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        담당자
		      </label>
		      <div class="col-sm-3 col-md-3">
			   <!-- <select name="empNo" id="empNo" class="form-control input-xs">
			  	  </select> -->
			  	  <input name="empNo" id="empNo" type="text" class="form-control input-xs">
		      </div>
	       </div>
	   </div>
	   <div class="row">
	       <div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       공급업체
		     </label>
		     <div class="col-sm-3 col-md-3">
			    <input name="supplyComp" id="supplyComp" type="text" value="" placeholder="" class="form-control input-xs">
		     </div>
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       제작업체
		     </label>
		     <div class="col-sm-3 col-md-3">
			    <input name="makeComp" id="makeComp" type="text" value="" placeholder="" class="form-control input-xs">
		     </div>
	     </div>
	  </div>
	  <div class="row">
	     <div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       등록일자
		     </label>
		     <div class="col-sm-3 col-md-3">
                  <div class="col-sm-10 col-md-10">
                     <input name="regiDate" id="regiDate" type="text" value="" placeholder="" class="form-control input-xs format_date">
                  </div>
                   <div class="col-sm-2 col-md-2">
                       <input type="button" id="calpicker2" class="calicon form-control input-xs">
                  </div>              
             </div> 
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        사용유무
		     </label>
		     <div class="col-sm-3 col-md-3">
		        <select name="useYn" id="useYn" class="form-control input-xs">
		          <option value="Y">사용</option>
		          <option value="N">미사용</option>
		        </select>
		     </div>
	     </div>
	 </div>
	 <div class="row">
	     <div class="form-group form-group-sm">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
		       사용중지사유
		     </label>
		     <div class="col-sm-8 col-md-8">
			   <input name="useStopRemarks" id="useStopRemarks" type="text" value="" placeholder="" class="form-control input-xs">
		    </div>
	     </div>
	   </div>
	</div> 
    </form>
  </div>  
</div>