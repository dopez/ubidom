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
	
	subLayout.cells("a").setWidth(350);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"No",       colId:"no",       width:"15", align:"center", type:"cntr"});
	gridMst.addHeader({name:"사원번호", colId:"empNo",    width:"35", align:"center", type:"ro"});
	gridMst.addHeader({name:"성명",     colId:"korName",  width:"25", align:"center", type:"ro"});
	gridMst.addHeader({name:"부서", 	colId:"postName", width:"25", align:"center", type:"ro"});
	gridMst.addHeader({name:"사업장", 	colId:"compId",   width:"25", align:"center", type:"ro"});
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","empNo");
	gridMst.init(); 
	gridMst.setColumnHidden(4,true);
	gridMst.attachEvent("onRowSelect",gridMstOnRowSelect);
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"No",         colId:"no",       width:"5",  align:"center", type:"cntr"});
	gridDtl.addHeader({name:"발령일",     colId:"balDate",  width:"10", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"급여구분",   colId:"payGbn",   width:"7",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"근무구분",   colId:"serveGbn", width:"7",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"발령구분",   colId:"balGbn",   width:"7",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"부서코드",   colId:"postCode", width:"7",  align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령부서",   colId:"postName", width:"7",  align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령직군",   colId:"jikgun",   width:"7",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"발령직무",   colId:"jikmu",    width:"7",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"발령직위",   colId:"jikwee",   width:"7",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"발령직책",   colId:"jikchak",  width:"7",  align:"center", type:"combo"});
	gridDtl.addHeader({name:"급여사업장", colId:"compId",   width:"7",  align:"center", type:"combo"});
	//가 저장될 gridColumns
	gridDtl.addHeader({name:"사원번호",       colId:"empNo",      width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"급여구분코드",   colId:"payGbnNm",   width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"근무구분코드",   colId:"serveGbnNm", width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령구분코드",   colId:"balGbnNm",   width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령직군코드",   colId:"jikgunNm",   width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령직무코드",   colId:"jikmuNm",    width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령직위코드",   colId:"jikweeNm",   width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"발령직책코드",   colId:"jikchakNm",  width:"10", align:"center", type:"ro"});
	gridDtl.addHeader({name:"급여사업장코드", colId:"compIdNm",   width:"10", align:"center", type:"ro"});
	gridDtl.setColSort("str");	
	gridDtl.setUserData("","pk","empNo");
	gridDtl.init(); 
	gridDtl.setColumnHidden(12,true);
	gridDtl.setColumnHidden(13,true);
	gridDtl.setColumnHidden(14,true);
	gridDtl.setColumnHidden(15,true);
	gridDtl.setColumnHidden(16,true);
	gridDtl.setColumnHidden(17,true);
	gridDtl.setColumnHidden(18,true);
	gridDtl.setColumnHidden(19,true);
	gridDtl.setColumnHidden(20,true);
	//근무형태 grid에서 항목 제외
	fn_search();
	gridDtl.attachEvent("onRowSelect",gridDtlOnRowSelect);
	
	$("#postName").click(function(){
		gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
		status = 2;
	});
	
	
 	$("#korName").click(function(){
		gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
	});
 	fn_startSetCombo();
});
function fn_save(){
	 var jsonStr = gridDtl.getJsonUpdated2();
    if (jsonStr == null || jsonStr.length <= 0) return;         		
        $("#jsonData").val(jsonStr);                      
        $.ajax({
           url : "/erp/pers/pers/persAppointS/prcsPersAppoint",
           type : "POST",
           data : $("#pform").serialize(),
           async : true,
           success : function(data) {
           MsgManager.alertMsg("INF001");
           fn_search();
            }
       }); 
}
function fn_search(){
	fn_loadGridLeftList();
	gridDtl.clearAll(); 
}
function fn_loadGridLeftList(){
	var obj={};
	obj.postCode = $('#postCode').val();
	obj.empNo = $('#empNo').val();
	obj.serveGbn= $('input[name="serveGbn"]:checked').val();
    gfn_callAjaxForGrid(gridMst,obj,"/erp/pers/pers/persAppointS/selLeft",subLayout.cells("a"),fn_loadGridLeftListCB);
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
	gridDtl.editCell();
}
function fn_startSetCombo(){
	var combo01 = gridDtl.getColumnCombo(2);
	fn_comboLoad(combo01,gridDtl.getColumnId(2),"P001",2,13);
	var combo02 = gridDtl.getColumnCombo(3);
	fn_comboLoad(combo02,gridDtl.getColumnId(3),"P002",3,14);
	var combo03 = gridDtl.getColumnCombo(4);
	fn_comboLoad(combo03,gridDtl.getColumnId(4),"P003",4,15);
	var combo04 = gridDtl.getColumnCombo(7);
	fn_comboLoad(combo04,gridDtl.getColumnId(7),"P004",7,16);
	var combo05 = gridDtl.getColumnCombo(8);
	fn_comboLoad(combo05,gridDtl.getColumnId(8),"P005",8,17);
	var combo06 = gridDtl.getColumnCombo(9);
	fn_comboLoad(combo06,gridDtl.getColumnId(9),"004",9,18);
	var combo07 = gridDtl.getColumnCombo(10);
	fn_comboLoad(combo07,gridDtl.getColumnId(10),"P006",10,19);
	var combo08 = gridDtl.getColumnCombo(11);
	fn_comboLoad(combo08,gridDtl.getColumnId(11),"000",11,20);
}
function fn_loadGridRightList(params){
	gfn_callAjaxForGrid(gridDtl,params,"/erp/pers/pers/persAppointS/selRight",subLayout.cells("b"),fn_loadGridRightListCB);
}
function fn_loadGridRightListCB(data){
	if(data == ''){
		return false;
	}else{
		for(var i = 0; i<data.length;i++){
			if(data[i].payGbn != null){
			   gridDtl.setCells2(i,2).setValue(data[i].payGbnNm);
			   gridDtl.setCells2(i,13).setValue(data[i].payGbn);
			}
			if(data[i].serveGbn  != null){
			   gridDtl.setCells2(i,3).setValue(data[i].serveGbnNm);
			   gridDtl.setCells2(i,14).setValue(data[i].serveGbn);
			}
			if(data[i].balGbn  != null){
			   gridDtl.setCells2(i,4).setValue(data[i].balGbnNm);
			   gridDtl.setCells2(i,15).setValue(data[i].balGbn);
		    }
			if(data[i].jikgun  != null){
			   gridDtl.setCells2(i,7).setValue(data[i].jikgunNm);
			   gridDtl.setCells2(i,16).setValue(data[i].jikgun);
		    }
			if(data[i].jikmu  != null){
			   gridDtl.setCells2(i,8).setValue(data[i].jikmuNm);
			   gridDtl.setCells2(i,17).setValue(data[i].jikmu);
			}
			if(data[i].jikchak != null){
			   gridDtl.setCells2(i,10).setValue(data[i].jikchakNm);
			   gridDtl.setCells2(i,19).setValue(data[i].jikchak);
			}
			if(data[i].compId  != null){
			   gridDtl.setCells2(i,11).setValue(data[i].compIdNm);
			   gridDtl.setCells2(i,20).setValue(data[i].compId);
			}
			if(data[i].jikwee  != null){
			   gridDtl.setCells2(i,9).setValue(data[i].jikweeNm);
			   gridDtl.setCells2(i,18).setValue(data[i].jikwee); 
			}
		}	
	}
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

function fn_delete(){
    var rodid = gridDtl.getSelectedRowId();
    var rodIdx = gridDtl.getSelectedRowIndex();
    if(gridDtl.isDelRows(rodid)) {
       if(MsgManager.confirmMsg("INF002")) {
     	  if(gridDtl.chkUnsavedRow(rodIdx,rodid)) {
     		  return
     	  }else{
     		 var jsonStr = gridDtl.getJsonRowDel(rodid);
           if (jsonStr == null || jsonStr.length <= 0) return;
            $("#jsonData").val(jsonStr);
                $.ajax({
                 url : "/erp/pers/pers/persAppointS/prcsPersAppoint",
                 type : "POST",
                 data : $("#pform").serialize(),
                 async : true,
                 success : function(data) {
                 MsgManager.alertMsg("INF003");
                 fn_search();
                }
            });
     	   }   	 
        } else {
         	 MsgManager.alertMsg("WRN004");
          } 
     }else {
         MsgManager.alertMsg("WRN002");
      }
}

function fn_comboLoad(comboId,inputName,params,colIndx,mockIndx){
	comboId.setTemplate({
	    input: "#interCode#",
	    input: "#interName#",
	    columns: [
	       {header: "내부코드", width: 100,  option: "#interCode#"},
		   {header: "코드명",   width: 100,  option: "#interName#"}
	    ]
	});
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
	var obj={};
	obj.compId = '100';
	obj.code = params;
	doOnOpen(comboId,obj,colIndx,mockIndx);
}
function doOnOpen(comboId,params,colIndx,mockIndx){
		$.ajax({
			"url":"/erp/pers/pers/persAppointS/selBaseCode",
			"type":"post",
			"data":params,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
				comboId.addOption([
				  {value: list[i].interCode, text:
				  {interCode: list[i].interCode,
				   interName: list[i].interName}}   
				   ]);	
			    }
			}
	  });	
 	comboId.attachEvent("onClose", function() {
	gridDtl.setCells2(gridDtl.getSelectedRowIndex(),colIndx).setValue(comboId.getSelectedText().interName);
	gridDtl.setCells2(gridDtl.getSelectedRowIndex(),mockIndx).setValue(comboId.getSelectedText().interCode);
	});	
};
function fn_onOpenPop(pName){
	var value;
	if(pName=="postCode"){
		value =  '';
	 }else if(pName == "empNo"){
		 value = '';
	 }
	return value;
};

function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if(pName=="postCode"){
		for(i=0;i<data.length;i++){
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			if(status == 1){
				gridDtl.setCells2(gridDtl.getSelectedRowIndex(),5).setValue(obj.postCode);
				gridDtl.setCells2(gridDtl.getSelectedRowIndex(),6).setValue(obj.postName);
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