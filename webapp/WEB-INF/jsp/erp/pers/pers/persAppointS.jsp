<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var status;
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
	gridDtl.addHeader({name:"발령부서",   colId:"postName", width:"80", align:"left",   type:"ro"});
	gridDtl.addHeader({name:"발령직군",   colId:"jikgun",   width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"발령직무",   colId:"jikmu",    width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"발령직위",   colId:"jikwee",   width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"발령직책",   colId:"jikchak",  width:"80", align:"left",   type:"combo"});
	gridDtl.addHeader({name:"급여사업장", colId:"compId",   width:"80", align:"left",   type:"combo"});
	gridDtl.setUserData("","pk","empNo");
	gridDtl.dxObj.setUserData("","@balDate","format_date");
	gridDtl.setColSort("str");
	gridDtl.init();
	gridDtl.cs_setColumnHidden(["empNo"]);

	fn_search();
	gridDtl.attachEvent("onRowSelect",gridDtlOnRowSelect);
	
	$("#postName,#korName").click(function(e){
		if(e.target.id == "postName"){
		  gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
		  status = 2;
		}
		if(e.target.id == "korName"){
			gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
		}
	});
	
 	fn_startSetCombo();
});
function fn_search(){
	fn_loadGridLeftList();
	gridDtl.clearAll(); 
}
function fn_loadGridLeftList(){
	var obj={};
	obj.postCode = $('#postCode').val();
	obj.empNo = $('#empNo').val();
	obj.serveGbn= $('input[name="serveGbn"]:checked').val();
	if(obj.postCode == ''){
		obj.postCode = '%';
	}
	if(obj.empNo == ''){
		obj.empNo = '%';
	}
    gfn_callAjaxForGrid(gridMst,obj,"gridMstSearch",subLayout.cells("a"),fn_loadGridLeftListCB);
};
function fn_loadGridLeftListCB(data){
	byId("frmMain").reset();
	$('#postCode').val('');
	$('#empNo').val('');
};
function gridMstOnRowSelect(id,ind){
	var obj={};
	obj.compId = gridMst.setCells(id,4).getValue();
	obj.empNo = gridMst.setCells(id,1).getValue();
	fn_loadGridRightList(obj);
}
function gridDtlOnRowSelect(id,ind){
	status = 1;
	if(ind==5){
	gfn_load_pop('w1','common/deptCodePOP',true,{"postName":""});
	}
}
function fn_startSetCombo(){
	var combo01 = gridDtl.getColumnCombo(2);
	fn_comboLoad(combo01,gridDtl.getColumnId(2),"P001",2);
	var combo02 = gridDtl.getColumnCombo(3);
	fn_comboLoad(combo02,gridDtl.getColumnId(3),"P002",3);
	var combo03 = gridDtl.getColumnCombo(4);
	fn_comboLoad(combo03,gridDtl.getColumnId(4),"P003",4);
	var combo04 = gridDtl.getColumnCombo(7);
	fn_comboLoad(combo04,gridDtl.getColumnId(7),"P004",7);
	var combo05 = gridDtl.getColumnCombo(8);
	fn_comboLoad(combo05,gridDtl.getColumnId(8),"P005",8);
	var combo06 = gridDtl.getColumnCombo(9);
	fn_comboLoad(combo06,gridDtl.getColumnId(9),"004",9);
	var combo07 = gridDtl.getColumnCombo(10);
	fn_comboLoad(combo07,gridDtl.getColumnId(10),"P006",10);
	var combo08 = gridDtl.getColumnCombo(11);
	fn_comboLoad(combo08,gridDtl.getColumnId(11),"000",11);
}
function fn_loadGridRightList(params){
	gfn_callAjaxForGrid(gridDtl,params,"gridDtlSearch",subLayout.cells("b"));
}

function fn_add(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
	 var totalColNum = gridDtl.getColumnCount();
	    var data = new Array(totalColNum);
	    var balDateColIdx = gridDtl.getColIndexById('balDate');
		var empNoColIdx = gridDtl.getColIndexById('empNo');    
	        data[balDateColIdx] = dateformat(new Date());
	        data[empNoColIdx] = gridMst.setCells(rowCheck,1).getValue();
		    gridDtl.addRow(data);
	}
}
function fn_save(){
	 var rowIdx = gridMst.getSelectedRowIndex();
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
          gridMst.selectRow(rowIdx,true,true,true);
          }
      }); 
};

function fn_delete(){
    var rodid = gridDtl.getSelectedRowId();
    gridDtl.cs_deleteRow(rodid);
}

function fn_comboLoad(comboId,inputName,params,colIndx){
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
		   {header: "구 분",   width: 100,  option: "#interName#"}
	    ]
	});
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
	var obj={};
	obj.compId = '100';
	obj.code = params;
	doOnOpen(comboId,obj,colIndx);
}
function doOnOpen(comboId,params,colIndx){
		$.ajax({
			"url":"/erp/cmm/InterCodeR",
			"type":"post",
			"data":params,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
				  comboId.addOption(list[i].interCode,list[i].interName);
			    }
			}
	  });	
};

function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if(pName=="postCode"){
		for(i=0;i<data.length;i++){
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			if(status == 1){
				var selRowIdx = gridDtl.getSelectedRowIndex();
				gridDtl.setCells2(selRowIdx,5).setValue(obj.postCode);
				gridDtl.setCells2(selRowIdx,6).setValue(obj.postName); 
			}else{
				$('#postName').val(obj.postName);
				$('#postCode').val(obj.postCode);
				status = 1;
			}
			
		}		  
	}else if(pName == "empNo"){
		for(i=0;i<data.length;i++){
			obj.korName=data[i].korName;
			obj.empNo=data[i].empNo;
				$('#korName').val(obj.korName);
				$('#empNo').val(obj.empNo);
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
     <input type="hidden" id="postCode" name="postCode" />
     <input type="hidden" id="empNo" name="empNo" />
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