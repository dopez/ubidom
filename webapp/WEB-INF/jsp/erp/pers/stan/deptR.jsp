<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,8,9],"1C");
	//부서조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",       width:"4", align:"center", type:"cntr"});
	gridMain.addHeader({name:"부서코드", colId:"postCode", width:"7", align:"left",   type:"ro"});
	gridMain.addHeader({name:"부서명",   colId:"postName", width:"7", align:"left",   type:"ro"});
	gridMain.addHeader({name:"시작일",   colId:"stDate",   width:"7", align:"center", type:"ro"});
	gridMain.addHeader({name:"종료일", 	 colId:"endDate",  width:"7", align:"center", type:"ro"});	
	gridMain.setUserData("","pk","postCode");
	gridMain.dxObj.setUserData("","@stDate","format_date");
	gridMain.dxObj.setUserData("","@endDate","format_date");
	gridMain.setColSort("str");
	gridMain.init();
	
	$("#postName").dblclick(function(){
		gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
	});

});
//조회
function fn_search(){
	var obj={};
	obj.postName = $("#postName").val();
	obj.historyKind = $('input[name="historyKind"]:checked').val();
	fn_loadGridList(obj);
};
//엑셀
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
 
function  fn_print(){
	var url = "/erp/pers/stan/deptR/report/deptR.do";
	url = url + "?postName=" + $("#postName").val();
	url = url + "&historyKind="+ $('input[name="historyKind"]:checked').val();
	window.open(url,'rpt','');
 }
 
function fn_loadGridList(params) {
	 gfn_callAjaxForGrid(gridMain,params,"gridMainSearch",subLayout.cells("a"));
};

  function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		var i;
		var obj={};
		for(i=0;i<data.length;i++){
			var params =  "postName=" + data[i].postName;
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			obj.historyKind = $('input[name="historyKind"]:checked').val();
			 fn_loadGridList(obj);
			 $("#postName").val(obj.postName);
		}		  
	}	  
 };

</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 부서명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>   
	<div class="row">
	   <div class="form-group form-group-sm">
		   <div class="col-sm-8 col-md-8">
			   <label class="col-sm-2 col-md-2 control-label" for="textinput">
				기준 
			   </label>
			   <div class="col-sm-3 col-md-3">
				   <div class="col-sm-4 col-md-4">
					  <input type="radio" name="historyKind" id="historyKind" value="C" checked="checked">현재
				   </div>
				   <div class="col-sm-6 col-md-6">
						<input type="radio" name="historyKind" id="historyKind" value="H">HISTORY
				  </div>
			   </div>
		   </div>
	    </div>
	 </div>        
  </form>
 </div> 
</div>