<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,5,6],"2U");
	//자격면허등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").setWidth(300);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"NO",       colId:"no",       width:"15", align:"center", type:"cntr"});
	gridMst.addHeader({name:"사원번호", colId:"empNo",    width:"35", align:"center", type:"ro"});
	gridMst.addHeader({name:"성명",     colId:"korName",  width:"25", align:"center", type:"ro"});
	gridMst.addHeader({name:"부서",     colId:"postName", width:"25", align:"center", type:"ro"});
	gridMst.addHeader({name:"사업장",   colId:"compId",   width:"25", align:"center", type:"ro"});
	gridMst.setColSort("str");	
	gridMst.setUserData("","pk","no");
	gridMst.init(); 
	gridMst.setColumnHidden(4,true);
	gridMst.attachEvent("onRowSelect",doOnMstRowSelect);
	
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	gridDtl.addHeader({name:"NO",       colId:"no",       width:"4", align:"center", type:"cntr"});
	gridDtl.addHeader({name:"자격구분", colId:"qualKind", width:"7", align:"center", type:"ed"});
	gridDtl.addHeader({name:"자격증명", colId:"qualName", width:"8", align:"center", type:"ed"});
	gridDtl.addHeader({name:"자격등급", colId:"qualGd",   width:"7", align:"center", type:"ed"});
	gridDtl.addHeader({name:"수당",     colId:"qualPay",  width:"7", align:"center", type:"ed"});
	gridDtl.addHeader({name:"취득일자", colId:"achiDate", width:"7", align:"center", type:"dhxCalendarA"});
	gridDtl.addHeader({name:"시행처",   colId:"apprCust", width:"10", align:"center", type:"ed"});
	gridDtl.addHeader({name:"사원번호", colId:"empNo",    width:"7", align:"center", type:"ro"});
	gridDtl.addHeader({name:"사업장",   colId:"compId",   width:"7", align:"center", type:"ro"});
	gridDtl.addHeader({name:"순번",     colId:"seq",      width:"7", align:"center", type:"ro"});
	gridDtl.setColSort("str");	
	gridDtl.setUserData("","pk","no");
	gridDtl.init(); 
	gridDtl.setColumnHidden(7,true);
	gridDtl.setColumnHidden(8,true);
	gridDtl.setColumnHidden(9,true);
	gridDtl.attachEvent("onRowSelect",doOnDtlRowSelect);
	
   fn_search();
	
	$("#postName").click(function(){
		gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
	});
	
	$("#korName").click(function(){
		gfn_load_pop('w1','common/empPOP',true,{"korName":$(this).val()});
	});
	
});
function doOnMstRowSelect(id,ind){
	var obj={};
	obj.compId = gridMst.setCells(id,4).getValue();
	obj.empNo = gridMst.setCells(id,1).getValue();
	fn_loadGridRightList(obj);
}
function doOnDtlRowSelect(id,ind){
	gridDtl.editCell();
	var no = gridDtl.setCells(id,0).getValue();
	var seqValue = gridDtl.setCells(id,9).getValue();
	if(seqValue == ""){
		gridDtl.setCells(id,9).setValue(no);
	}
}
function fn_search(){
	gridDtl.clearAll();
	fn_loadGridLeftList();
}
function fn_add(){
	var rowCheck = gridMst.getSelectedRowId();
	if(rowCheck == null){
		return false;
	}else{
	 var totalColNum = gridDtl.getColumnCount();
	    var data = new Array(totalColNum);
	    var achiDateColIdx = gridDtl.getColIndexById('achiDate');
		var empNoColIdx = gridDtl.getColIndexById('empNo');    
		var compIdColIdx = gridDtl.getColIndexById('compId');
		    data[achiDateColIdx] = dateformat(new Date());
	        data[empNoColIdx] = gridMst.setCells(rowCheck,1).getValue();
	        data[compIdColIdx] = gridMst.setCells(rowCheck,4).getValue();
		    gridDtl.addRow(data);
	}
}
function fn_save(){
	 var jsonStr = gridDtl.getJsonUpdated2();
   if (jsonStr == null || jsonStr.length <= 0) return;         		
       $("#jsonData").val(jsonStr);                      
       $.ajax({
          url : "/erp/pers/pers/licenseDataS/prcsLicenseDataS",
          type : "POST",
          data : $("#pform").serialize(),
          async : true,
          success : function(data) {
          MsgManager.alertMsg("INF001");
          fn_refreshGrid(gridDtl.getSelectedRowId());
           }
      }); 
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
                 url : "/erp/pers/pers/licenseDataS/prcsLicenseDataS",
                 type : "POST",
                 data : $("#pform").serialize(),
                 async : true,
                 success : function(data) {
                 MsgManager.alertMsg("INF003");
                 fn_refreshGrid(rodid);
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
function fn_refreshGrid(id){
	var obj={};
	  obj.compId = gridDtl.setCells(id,8).getValue();
	  obj.empNo = gridDtl.setCells(id,7).getValue();
	  fn_loadGridRightList(obj);
}
function fn_loadGridLeftList(){
	var obj={};
	obj.jikgun = $('#jikgun').val();
	obj.serveGbn = $('#serveGbn').val();
	obj.postCode = $('#postCode').val();
	obj.empNo = $('#empNo').val();
    gfn_callAjaxForGrid(gridMst,obj,"/erp/pers/pers/licenseDataS/selLeft",subLayout.cells("a"),fn_loadGridLeftListCB);
}
function fn_loadGridLeftListCB(data){
	byId("frmMain").reset();
	$('#postCode').val('');
	$('#empNo').val('');
};
function fn_loadGridRightList(params){
	gfn_callAjaxForGrid(gridDtl,params,"/erp/pers/pers/licenseDataS/selRight",subLayout.cells("b"));
}

function fn_onClosePop(pName,data){
	var i;
	var obj={};
	if(pName=="postCode"){
		for(i=0;i<data.length;i++){
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			$('#postName').val(obj.postName);
			$('#postCode').val(obj.postCode);
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
      <input type="hidden" name="postCode" id="postCode">
      <input type="hidden" name="empNo" id="empNo">
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 직군
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jikgun" id="jikgun" class="form-control input-xs">
			   <option value="%">전체</option>
			   <option value="01">관리직</option>
			   <option value="02">생산직</option>
			   <option value="03">용역</option>
			   <option value="04">외국인</option>
			   <option value="05">기술직</option>
			   <option value="06">계약직</option>
			  </select>
			</div>
			<label class="col-sm-1 col-md-1 control-label" for="textinput">
			 근무
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="serveGbn" id="serveGbn" class="form-control input-xs">
			   <option value="%">전체</option>
			   <option value="01">재직</option>
			   <option value="02">휴직</option>
			   <option value="03">퇴직</option>
			  </select>
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
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
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