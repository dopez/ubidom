<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var status;
var  combo09;
var rowSelVal;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,5,6],"2U");
	//인사발령등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").setWidth(303);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"No",       colId:"no",       width:"50", align:"center", type:"cntr"});
	gridMst.addHeader({name:"사원번호", colId:"empNo",    width:"70", align:"left",   type:"ro"});
	gridMst.addHeader({name:"성명",     colId:"korName",  width:"90", align:"left",   type:"ro"});
	gridMst.addHeader({name:"부서", 	colId:"postName", width:"90", align:"left",   type:"ro"});
	gridMst.setUserData("","pk","empNo");
	gridMst.setColSort("str");
	gridMst.init(); 
	gridMst.cs_setColumnHidden(["compId"]);
	gridMst.attachEvent("onRowSelect",gridMstOnRowSelect);
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"No",         colId:"no",       width:"50", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"발령일",     colId:"balDate",  width:"80", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"급여구분",   colId:"payGbn",   width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"근무구분",   colId:"serveGbn", width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"발령구분",   colId:"balGbn",   width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"부서코드",   colId:"postCode", width:"80", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"발령부서",   colId:"postName", width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"발령직군",   colId:"jikgun",   width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"발령직무",   colId:"jikmu",    width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"발령직위",   colId:"jikwee",   width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"발령직책",   colId:"jikchak",  width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"급여사업장", colId:"compId",   width:"80", align:"left",   type:"combo"});
	gridDtl.setUserData("","pk","");
	gridDtl.dxObj.setUserData("","@balDate","format_date");
	gridDtl.setColSort("str");
	gridDtl.init();
	gridDtl.cs_setColumnHidden(["empNo"]);

	
	gridDtl.attachEvent("onRowDblClicked",onGridDtlDblClicked);
	
	$("#postName,#korName").keyup(function(e) {
    	if(e.target.id == "postName"){
    		gridMst.filterBy(3,byId("postName").value);
		}
    	if(e.target.id == "korName"){
    		gridMst.filterBy(2,byId("korName").value);
		}
	 }); 
	
	var combo01 = gridDtl.getColumnCombo(2);
	var combo02 = gridDtl.getColumnCombo(3);
	var combo03 = gridDtl.getColumnCombo(4);
	var combo04 = gridDtl.getColumnCombo(7);
	var combo05 = gridDtl.getColumnCombo(8);
	var combo06 = gridDtl.getColumnCombo(9);
	var combo07 = gridDtl.getColumnCombo(10);
	var combo08 = gridDtl.getColumnCombo(11);
	 combo09 = gridDtl.getColumnCombo(6);
	gfn_1col_comboLoad(combo01,"P001");
	gfn_1col_comboLoad(combo02,"P002");
	gfn_1col_comboLoad(combo03,"P003");
	gfn_1col_comboLoad(combo04,"P004");
	gfn_1col_comboLoad(combo05,"P005");
	gfn_1col_comboLoad(combo06,"004");
	gfn_1col_comboLoad(combo07,"P006");
	gfn_1col_comboLoad(combo08,"000");
	gfn_codeLen2_comboLoad(combo09,"부서");
	
	combo09.attachEvent("onBlur", function(){
	var rowIdx = gridDtl.getSelectedRowIndex();
	gridDtl.setCells2(rowIdx,5).setValue(combo09.getSelectedText().innerCode);
	gridDtl.setCells2(rowIdx,6).setValue(combo09.getSelectedText().innerName);
	});
	
	fn_search();
});
function fn_onOpenPop(pName){
	var value;
     if(pName == "codeLen2"){
    	 var obj={};
    		 obj.innerName= $('#postName').val();
    		 obj.kind=  '부서';
    	 value = obj; 
	}
	return value;
};

function fn_search(){
	gridDtl.clearAll();
	gridDtl.parse("","js");
	fn_loadGridMst();
}
function fn_loadGridMst(){
	var obj={};
	obj.postCode = $('#postName').val();
	obj.empNo = $('#korName').val();
	obj.serveGbn= $('input[name="serveGbn"]:checked').val();
    gfn_callAjaxForGrid(gridMst,obj,"gridMstSearch",subLayout.cells("a"),fn_loadGridMstCB);
};
function fn_loadGridMstCB(data){
	var rowIdx = cs_selectRow_check(gridMst,"empNo",rowSelVal)
	gridMst.selectRow(rowIdx,true,true,true);
};
function gridMstOnRowSelect(id,ind){
	var compIdx = gridMst.getColIndexById('compId');
	var empIdx = gridMst.getColIndexById('empNo');
	var obj={};
	obj.compId = gridMst.setCells(id,compIdx).getValue();
	obj.empNo = gridMst.setCells(id,empIdx).getValue();
	fn_loadGridDtl(obj);
}
function onGridDtlDblClicked(rInd,cInd){
	status = 1;
	if(cInd==5){
	gfn_load_pop('w1','common/codeLen2POP',true,{});
	}
}

function fn_loadGridDtl(params){
	gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"));
}

function fn_add(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
		var empNoIdx = gridMst.getColIndexById('empNo');
	    var totalColNum = gridDtl.getColumnCount();
	    var data = new Array(totalColNum);
	    var balDateColIdx = gridDtl.getColIndexById('balDate');
		var empNoColIdx = gridDtl.getColIndexById('empNo');    
	        data[balDateColIdx] = dateformat(new Date());
	        data[empNoColIdx] = gridMst.setCells(rowCheck,empNoIdx).getValue();
		    gridDtl.addRow(data);
	}
}
function fn_save(){
	var rowIdx = gridDtl.getSelectedRowIndex();
	var colIdx = gridDtl.getColIndexById('empNo');
	rowSelVal=gridDtl.setCells2(rowIdx, colIdx).getValue();
	
	var jsonStr = gridDtl.getJsonUpdated2();
   if (jsonStr == null || jsonStr.length <= 0) return;         		
       $("#jsonData").val(jsonStr);                      
       $.ajax({
          url : "/erp/pers/pers/persAppointS/gridDtlSave",
          type : "POST",
          data : $("#pform").serialize(),
          async : true,
          success : function(data) {
          MsgManager.alertMsg("INF001");
          fn_search();
          rowSelVal = null;
          }
      }); 
};

function fn_delete(){
    var rodid = gridDtl.getSelectedRowId();
    gridDtl.cs_deleteRow(rodid);
}

function fn_onClosePop(pName,data){
	 if(pName == "codeLen2"){
		  var postCodeIdx = gridDtl.getColIndexById('postCode');
		  var postNameIdx = gridDtl.getColIndexById('postName');
		  var selRowIdx = gridDtl.getSelectedRowIndex();
		  gridDtl.setCells2(selRowIdx,postCodeIdx).setValue(data[0].innerCode);
		  gridDtl.setCells2(selRowIdx,postNameIdx).setValue(data[0].innerName);
		}	  	  
};

function fn_exit(){
	var exitVal = cs_close_event([gridDtl]);
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
			  구분 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-6 col-md-6">
			       <input type="radio" name="serveGbn" id="serveGbn" value="1" checked="checked">재직
			    </div>
			    <div class="col-sm-6 col-md-6">
			       <input type="radio" name="serveGbn" id="serveGbn" value="2">퇴직
			    </div>           
             </div>
		 </div>
	    </div>
      </div>
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  
		  <label class="col-sm-1 col-md-1 control-label" for="textinput">
			 성명
		  </label>
		  <div class="col-sm-2 col-md-2">
			  <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
		  </div>
	   </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>