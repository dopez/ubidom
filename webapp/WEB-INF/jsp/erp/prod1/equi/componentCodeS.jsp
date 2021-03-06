<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var combo01, combo02, combo03;
var rowSelVal;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	//부품코드등록
	Ubi.setContainer(1,[1,2,3,4],"2U");

	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();

	layout.cells("b").attachObject("bootContainer");

	subLayout.cells("b").attachObject("bootContainer2");

	subLayout.cells("a").setWidth(303);
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"50", align:"center", type:"cntr"});
	gridMain.addHeader({name:"부품코드", colId:"partCode",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"부품명",   colId:"partName",   width:"80", align:"left",   type:"ro"});
	gridMain.addHeader({name:"규격",     colId:"partSpec",   width:"90", align:"left",   type:"ro"});
	gridMain.setColSort("str");
	gridMain.setUserData("","pk","no");
	gridMain.init();
	gridMain.attachEvent("onRowSelect",doOnRowSelect);

	combo01 = dhtmlXComboFromSelect("kind1");
	combo02 = dhtmlXComboFromSelect("kind2");
	combo03 = dhtmlXComboFromSelect("partUnit");
	
	gfn_1col_comboLoad(combo01,"E10");
	gfn_1col_comboLoad(combo02,"E11");
	gfn_1col_comboLoad(combo03,"C02");
	
	
	combo01.attachEvent("onClose", function(){
		 var kind1Val = combo01.getSelectedValue();
		 if(kind1Val != null){
           $('#partCode').val(kind1Val);
		 }
	});

	combo02.attachEvent("onClose", function(){
		   var kind2Val = combo02.getSelectedValue();
		   var kind1Val = combo01.getSelectedValue();
		   if(kind2Val != null){
		     $('#partCode').val(kind1Val+kind2Val);
		   }
	}); 

	   $("#ptCode,#ptName").keyup(function(e) {
	    	if(e.target.id == "ptCode"){
	    		 gridMain.filterBy(1,byId("ptCode").value);
			}
	    	if(e.target.id == "ptName"){
	    		 gridMain.filterBy(2,byId("ptName").value);
			}
		 });

	   $("#frmMain input:text,input:checkbox").on("change keyup", function(e){
			if($("#cudKey").val() == ''){
			   $("#cudKey").val("INSERT");
			}
		});
	fn_search();
});

function doOnRowSelect(id,ind){
	fn_new();
	byId("cudKey").value = "UPDATE";
	disableValue(2);
	var obj={};
	obj.partCode= gridMain.setCells(id,1).getValue();
	fn_loadFormList(obj);
};

function fn_search(){
	fn_loadGridList();
	fn_new();
}
function fn_new(){
	byId("frmMain").reset();
	byId("frmSearch").reset();
	disableValue(1);
	combo01.unSelectOption();
	combo02.unSelectOption();
	combo03.unSelectOption();
};

function fn_save(){
	cudVal = $('#cudKey').val();	
	 if(cudVal == ''){
		 byId("cudKey").value = "INSERT"; 
	  }
	 
	f_dxRules = {
	   partCode : ["부품코드",r_notEmpty, r_len + "|5"],
	   kind1    : ["종류1",r_notEmpty],
       kind2    : ["종류2",r_notEmpty],
       partName : ["부품명",r_notEmpty],
	};
	if(gfn_formValidation('frmMain')){
		 disableValue(1);
		 $("input[name=partCode]").attr("disabled",false);
		var params = gfn_getFormElemntsData('frmMain');
		rowSelVal= $('#partCode').val();	
		gfn_callAjaxComm(params,"gridFormSave",fn_formSaveCB);   
	}
};
function fn_formSaveCB(data){
	fn_search();
	rowSelVal = null;
}
function disableValue(flag){
	if(flag == 1){
	  $("input[name=partCode]").attr("disabled",true);
	  combo01.enable();
	  combo02.enable();
	  combo03.enable();

	}else{
	  $("input[name=partCode]").attr("disabled",true);
	  combo01.disable();
	  combo02.disable();
	  combo03.disable();
	}
};

function fn_loadGridList(){
	var params = gfn_getFormElemntsData('frmSearch');
    gfn_callAjaxForGrid(gridMain,params,"gridMstSearch",subLayout.cells("a"),fn_loadGridListCB);
};

function fn_loadGridListCB(data){
	var rowIdx = cs_selectRow_check(gridMain,"partCode",rowSelVal)
	gridMain.selectRow(rowIdx,true,true,true);
};

function fn_loadFormList(params){
	gfn_callAjaxForForm("frmMain",params,"gridFormSearch",fn_loadFormListCB);
};
function fn_loadFormListCB(data){
	combo01.setComboValue(data[0].kind1);
	combo02.setComboValue(data[0].kind2);
	combo03.setComboValue(data[0].partUnit);
};

function fn_remove(){
	$('#cudKey').val('DELETE');
    var rodid = gridMain.getSelectedRowId();
    gridMain.cs_deleteRow(rodid);
};

function fn_exit(){
	 var exitVal = true;
		 var cudVal = cudVal = $('#cudKey').val();	
		 if(cudVal != ''){ 
			 exitVal = false;
		 }
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
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	   <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
          <div class="row">
	         <div class="form-group form-group-sm">
		        <div class="col-sm-8 col-md-8">
			      <label class="col-sm-2 col-md-2 control-label" for="textinput">
			       부품코드
			      </label>
			      <div class="col-sm-2 col-md-2">
			        <input name="ptCode" id="ptCode" type="text" value="" placeholder="" class="form-control input-xs">
			      </div>
			      <div class="col-sm-2 col-md-2" style="margin-left: 10px;">
			        <input name="ptName" id="ptName" type="text" value="" placeholder="" class="form-control input-xs">
 			      </div>
		       </div>
	        </div>
	      </div>
       </form>
  </div>
</div>
<div id="bootContainer2" style="position: relative;">
<div class="container">
	  <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">
        <input type="hidden" id="cudKey" name="cudKey" />
         <div class="row">
	        <div class="form-group form-group-sm">
	         <div class="col-sm-8 col-md-8">
		        <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         부품코드
		        </label>
		        <div class="col-sm-4 col-md-4">
			      <input name="partCode" id="partCode" type="text" value="" maxlength="5" class="form-control input-xs">
		        </div>
	        </div>
	      </div>
	    </div>
	    <div class="row">
	       <div class="form-group form-group-sm">
	         <div class="col-sm-8 col-md-8">
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
				종류
			  </label>
			  <div class="col-sm-2 col-md-2">
			  	  <select name="kind1" id="kind1" class="form-control input-xs">
			  	  </select>
			  </div>
		       <div class="col-sm-2 col-md-2">
			  	  <select name="kind2" id="kind2" class="form-control input-xs">
			  	  </select>
			  </div>
	       </div>
	      </div>
	    </div>
	    <div class="row">
	        <div class="form-group form-group-sm">
	         <div class="col-sm-8 col-md-8">
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         부품명
		       </label>
		       <div class="col-sm-4 col-md-4">
			      <input name="partName" id="partName" type="text" value="" placeholder="" class="form-control input-xs">
		       </div>
		     </div>
	      </div>
	   </div>
	   <div class="row">
	        <div class="form-group form-group-sm">
	         <div class="col-sm-8 col-md-8">
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
		         규격
		       </label>
		       <div class="col-sm-4 col-md-4">
			      <input name="partSpec" id="partSpec" type="text" value="" placeholder="" class="form-control input-xs">
		       </div>
		     </div>
	       </div>
	   </div>
	   <div class="row">
	        <div class="form-group form-group-sm">
	          <div class="col-sm-8 col-md-8">
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        단위
		       </label>
		       <div class="col-sm-2 col-md-2">
			  	  <select name="partUnit" id="partUnit" class="form-control input-xs">
			  	  </select>
			  </div>
		    </div>
	       </div>
	   </div>
	   <div class="row">
	        <div class="form-group form-group-sm">
	         <div class="col-sm-8 col-md-8">
		       <label class="col-sm-2 col-md-2 control-label" for="textinput">
		        비고
		       </label>
		       <div class="col-sm-4 col-md-4">
			      <input name="rmk" id="rmk" type="text" value="" placeholder="" class="form-control input-xs">
		      </div>
		    </div>
	       </div>
	   </div>
     </form>
    </div>
</div>
