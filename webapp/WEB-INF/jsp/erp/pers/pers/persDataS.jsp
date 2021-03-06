<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/component/jqueryFileupload/js/vendor/jquery.ui.widget.js"></script>
<script src="/component/jqueryFileupload/js/jquery.iframe-transport.js"></script>
<script src="/component/jqueryFileupload/js/jquery.fileupload.js"></script>
<link href="/component/jqueryFileupload/bootstrap-fileresize.css" type="text/css" rel="stylesheet" />
<link href="/component/jqueryFileupload/css/dropzone.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
var combo01, combo02, combo03, combo04;
var mainTabbar = parent.mainTabbar;
var ActTabId = parent.ActTabId;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,9],"2U");
	//인사자료등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("b").attachObject("bootContainer2");
	
	subLayout.cells("a").setWidth(303);
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",       width:"50", align:"center", type:"cntr"});
	gridMain.addHeader({name:"사원번호", colId:"empNo",    width:"70", align:"left",   type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",  width:"90", align:"left",   type:"ro"});
	gridMain.addHeader({name:"부서",     colId:"postName", width:"90", align:"left",   type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.init(); 
	gridMain.cs_setColumnHidden(["compId"]);
	gridMain.attachEvent("onRowSelect",doOnRowSelect);

	$("#btnSearch,#persAppointBtn,#updImg,#delImg").click(function(e){
		if(e.target.id == "btnSearch"){
			execDaumPostcode("postNo","address");
		}
		if(e.target.id == "persAppointBtn"){
			var rowCheck = gridMain.getSelectedRowId();
			if(rowCheck == null){
				return false;
			}else{
			   gfn_load_pop('w1','pers/persAppointSPOP',true,{"persAppointBtn":$(this).val()});
			}
		}
		if(e.target.id == "updImg"){
			var rowCheck = gridMain.getSelectedRowId();
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
               url : "/erp/pers/pers/persDataS/prcsFileDelete",
               type : "POST",
               data : gfn_getFormElemntsData('frmMain'),
               async : true,
               success : function(data) {
               MsgManager.alertMsg("INF003");
               fn_new();
               fn_loadGridList();
              }
          });
		}
	});
	
    $("#ptName,#empName").keyup(function(e) {
    	if(e.target.id == "ptName"){
    		 gridMain.filterBy(3,byId("ptName").value);
		}
    	if(e.target.id == "empName"){
    		gridMain.filterBy(2,byId("empName").value);
		}
	 }); 
	
    $("#frmMain input:text,input:checkbox").on("change keyup", function(e){
		if($("#cudKey").val() == ''){
		   $("#cudKey").val("INSERT");
		}
	});
    
	combo01 = dhtmlXComboFromSelect("jikwee");
	combo02 = dhtmlXComboFromSelect("jikmu");
	combo03 = dhtmlXComboFromSelect("jikchak");
	combo04 = dhtmlXComboFromSelect("postCode");
	gfn_1col_comboLoad(combo01,"004");
	gfn_1col_comboLoad(combo02,"P005");
	gfn_1col_comboLoad(combo03,"P006");
	fn_comboLoad(combo04);
	
	combo04.attachEvent("onChange", function(){
		$('#postCode').val(combo04.getSelectedText().postCode);
		});
	
	calMain = new dhtmlXCalendarObject([{input:"amryDate1",button:"calpicker1"},{input:"amryDate2",button:"calpicker2"},{input:"enterDate",button:"calpicker3"},
	{input:"retireDate",button:"calpicker4"},{input:"retireMidDate",button:"calpicker5"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	fn_calValue();

	fn_search();
});
$(window).resize(function(){
var h = $(window).height();
var w = $(window).width();
	if(w<1300){
		$('#bootContainer2').css("overflow-x",'scroll');
	}
	if(h<400){
		$('#bootContainer2').css("overflow-y",'scroll');
	}
});

function fn_comboLoad(comboId){
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
          {header: "부서명", width: 100, option: "#postName#"}
	    ]
	});
	comboId.enableFilteringMode(true);
	comboId.enableAutocomplete(true);
	comboId.allowFreeText(true);
	comboId.confirmValue();
	var obj={};
	obj.postName = '%';
		$.ajax({
			"url":"/erp/pers/stan/deptS/gridMstSearch",
			"type":"post",
			"data":obj,
			"success" : function(data){
			  var list = data;
			  for(var i=0;i<list.length;i++){
				  comboId.addOption(list[i].postCode, list[i].postName);
                  } 
			}
	  });	
};

function fileUploadCB(data){
	fn_save();
};
		
function doOnRowSelect(id, ind){
	fn_new();
	byId("cudKey").value = "UPDATE";
	disableValue(2);
	var obj={};
	obj.compId= gridMain.setCells(id,4).getValue();
	obj.empNo= gridMain.setCells(id,1).getValue();
	obj.postName = gridMain.setCells(id,3).getValue();
	fn_loadFormList(obj);	
}

function disableValue(flag){
	if(flag == 1){
	  $("input[name=empNo]").attr("disabled",false);
	  combo01.disable();
	  combo02.disable();
	  combo03.disable();
	  combo04.enable();
	  
	}else{
	  $("input[name=empNo]").attr("disabled",true);
	  combo01.disable();
	  combo02.disable();
	  combo03.disable();
	  combo04.disable();
	}
}
function fn_calValue(){
	var t = dateformat(new Date());
	byId("amryDate1").value = t; 
	byId("amryDate2").value = t; 
	byId("enterDate").value = t;
};

function fn_search(){
	fn_loadGridList(); 
	fn_new();
};

function fn_new(){
	byId("frmMain").reset();
	byId("frmSearch").reset();
	$('#bldKind').removeAttr('checked');
	$('#target').removeAttr('src');
	fn_calValue();
	disableValue(1);
	combo01.unSelectOption();
	combo02.unSelectOption();
	combo03.unSelectOption();;
};

 function fn_save(){
	 cudVal = $('#cudKey').val();	
	 if(cudVal == ''){
		 byId("cudKey").value = "INSERT"; 
	  }
	   f_dxRules = {
	   empNo : ["사원번호",r_notEmpty,r_len + "|7"],
	   korName : ["성명",r_notEmpty],
       regiNumb: ["주민번호",r_notEmpty,r_len + "|14"],
       postName: ["부서명",r_notEmpty],
       postNo: ["우편번호",r_notEmpty],
       address: ["주소",r_notEmpty],
       enterDate: ["입사날짜",r_notEmpty]
	};
	if(gfn_formValidation('frmMain')){
		 disableValue(1);
		  combo01.enable();
		  combo02.enable();
		  combo03.enable();
		  
		var params = gfn_getFormElemntsData('frmMain');
	     gfn_callAjaxComm(params,"formSave",fn_formSaveCB); 
	}
}; 
function fn_formSaveCB(data){
	fn_search();
}
function fn_remove(){
	$('#cudKey').val('DELETE');
    var rodid = gridMain.getSelectedRowId();
    gridMain.cs_deleteRow(rodid);
};

function fn_loadGridList(){
    gfn_callAjaxForGrid(gridMain,{},"gridMstSearch",subLayout.cells("a"));
};
function fn_loadFormList(params){
	gfn_callAjaxForForm("frmMain",params,"gridDtlSearch",fn_loadFormListCB);
};
function fn_loadFormListCB(data){
	var selIdx = gridMain.getSelectedRowIndex();
	combo01.setComboValue(data[0].jikwee);
	combo02.setComboValue(data[0].jikmu);
	combo03.setComboValue(data[0].jikchak);
	combo04.setComboValue(data[0].postCode);
	if(data[0].imgPath != null){			
	  $("#target").attr("src", "/erp/pers/pers/persDataS/getPersImg?empNo=" + data[0].empNo);
	}
	$('#cudKey').val('');
};

function fn_onOpenPop(pName){
	var value;
     if(pName == "persCode"){
		var obj={};
		obj.compId= gridMain.setCells2(gridMain.getSelectedRowIndex(),4).getValue();
		obj.empNo=  gridMain.setCells2(gridMain.getSelectedRowIndex(),1).getValue();
		value = obj;
	}
	return value;
};

 function fn_print(){
		var url = "/erp/pers/pers/persDataP/report/persDataP.do"; 
			url = url + "?empNo=" + $("#empNo").val();
		window.open(url,'rpt','');
}
 
 function fn_exit(){
	 var exitVal = true;
		 var cudVal = cudVal = $('#cudKey').val();	
		 if(cudVal != ''){ 
			 exitVal = false;
		 }
	 if(exitVal){
		mainTabbar.tabs(ActTabId).close();	 
	 }		
}
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
			 부서
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="ptName" id="ptName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			 <label class="col-sm-1 col-md-1 control-label" for="textinput">
			 성명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<div class="col-sm-2 col-md-2" style="margin-left: 5px;">
			  <input name="persAppointBtn" id="persAppointBtn" type="button" value="인사발령" placeholder="" class="form-control btn btn-default btn-xs">
			</div>
		  </div>
	  </div>
	</div>         
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative; width: 100%; height: 100%;" >
  <div class="container">	
	<form class="form-horizontal" id="frmMain" name="frmMain" enctype="multipart/form-data" style="padding-top:10px;padding-bottom:5px;margin:0px;">
	  <input type="hidden" id="cudKey" name="cudKey" />
	  <input type="hidden" id="character" name="character" />
	  <input type="hidden" id="taste" name="taste" />
	  <input type="hidden" id="partCont" name="partCont" />
	  <input type="hidden" id="armyKind" name="armyKind" />
	  <input type="hidden" id="amryBarch" name="amryBarch" />
	  <input type="hidden" id="armyGd" name="armyGd" />
	  <input type="hidden" id="weight" name="weight" value="0" />
	  <input type="hidden" id="length" name="length" value="0" />
      <input type="hidden" id="armyNo" name="armyNo" />
      <input type="hidden" id="armySpcase" name="armySpcase" />
      <input id="imgPath" type="hidden" name="imgPath">
      <input id="fileName" type="file" name="fileName" data-url="/erp/pers/pers/persDataS/prcsFileUpload" multiple style="display: none;">
	   <div class="col-sm-2 col-md-2">
	     <div class="row">
		   <div class="form-group form-group-sm">
			  <div class="col-sm-7 col-md-7 col-sm-offset-1 col-md-offset-1">
				 <img src=""  height="150px;" width="400px;" id="target" name="target">
			  </div>
		   </div>
 		  </div>
		  <div class="row">
		   <div class="form-group form-group-sm">
			  <div class="col-sm-2 col-md-2 col-sm-offset-2 col-md-offset-2">
				 <input name="updImg" id="updImg" type="button" value="첨부" class="form-control btn btn-default btn-xs">
			  </div>
			  <div class="col-sm-2 col-md-2 col-sm-offset-1 col-md-offset-1">
				  <input name="delImg" id="delImg" type="button" value="삭제" class="form-control btn btn-default btn-xs">
			  </div>
		   </div>
 		 </div>
	   </div>
	   <div class="col-sm-10 col-md-10">
		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 사원번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				성명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs" >
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 성명(한자) 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="chaName" id="chaName" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				성명(영문) 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="engName" id="engName" type="text" value="" placeholder="" class="form-control input-xs" >
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 주민등록번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="regiNumb" id="regiNumb" type="text" value="" placeholder="" class="form-control input-xs" >
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				부서명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <select name="postCode" id="postCode" class="form-control input-xs">
			  	  </select>
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 전화번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="tel" id="tel" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직위명 
			  </label>
			  <div class="col-sm-2 col-md-2">
			  	  <select name="jikwee" id="jikwee" class="form-control input-xs">
			  	  </select>
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 휴대번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="handPhone" id="handPhone" type="text" value="" placeholder="" class="form-control input-xs" >
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직무명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <select name="jikmu" id="jikmu" class="form-control input-xs">
			  	  </select>
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 이메일 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="email" id="email" type="text" value="" placeholder="" class="form-control input-xs" >
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직책명 
			  </label>
			  <div class="col-sm-2 col-md-2">
			      <select name="jikchak" id="jikchak" class="form-control input-xs">
			  	  </select>
			  </div>
		   </div>
 		 </div>	   
	   </div>
	   <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 우편번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <div class="col-sm-8 col-md-8">
					<input name="postNo" id="postNo" type="text" value="" placeholder="" class="form-control input-xs" >
				 </div>
				 <div class="col-sm-2 col-md-2">
					<button type="button" class="form-control btn btn-default btn-xs" name="btnSearch" id="btnSearch">
					  <span class="glyphicon glyphicon-search"></span>
					</button>
				 </div>
			  </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 주소 
			  </label>
			  <div class="col-sm-6 col-md-6">
				 <input name="address" id="address" type="text" value="" placeholder="" class="form-control input-xs" >
			  </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 본적 
			  </label>
			  <div class="col-sm-6 col-md-6">
				 <input name="baseAddrs" id="baseAddrs" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 시력좌우 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-2 col-md-2">
				       <div class="col-sm-6 col-md-6">
			             <input name="eyeLeft" id="eyeLeft" type="text" value="" placeholder="" class="form-control input-xs">
			          </div>
				      <div class="col-sm-6 col-md-6">
			             <input name="eyeRight" id="eyeRight" type="text" value="" placeholder="" class="form-control input-xs">
			          </div>
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     색맹구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
			         <input type="checkbox" name="bldKind" id="bldKind" value="1">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     혈액형 
			       </label>
			       <div class="col-sm-2 col-md-2">
			         <select name="blood" id="blood"  class="form-control input-xs">
			           <option value="A">A형</option>
			           <option value="B">B형</option>
			           <option value="AB">AB형</option>
			           <option value="O">O형</option>
			         </select>
			       </div>
		       </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 장애유무 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-1 col-md-1">
			         <input type="checkbox" name="disorderYn" id="disorderYn" value="1">
			       </div>
			       <div class="col-sm-6 col-md-6">
			         <input name="disorderCont" id="disorderCont" value="" type="text" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     결혼구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
			         <select name="disaYn" id="disaYn" class="form-control input-xs">
			           <option value="0">미혼</option>
			           <option value="1">기혼</option>
			         </select>
			       </div>
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 종교 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-2 col-md-2">
				      <select name="religion" id="religion"  class="form-control input-xs">
			          	<option value="무교">무교</option>
			          	<option value="기독교">기독교</option>
			          	<option value="천주교">천주교</option>
			          	<option value="불교">불교</option>
			          </select>
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     보훈대상 
			       </label>
			       <div class="col-sm-2 col-md-2">
			           <input type="checkbox" name="armyMerit" id="armyMerit" value="1">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     재대구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
				     <select name="armyYn" id="armyYn" class="form-control input-xs">
				      <option value="1">만기재대</option>
				      <option value="0">소집해제</option>
				      <option value="2">면제</option>
				     </select>
			       </div>
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 복무기간 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-7 col-md-7">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="amryDate1" id="amryDate1" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'amryDate2', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="amryDate2" id="amryDate2" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'amryDate1', 'min')">
                          </div>
                       </div> 
                 </div>
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 입사일자 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-7 col-md-7">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="enterDate" id="enterDate" value="" >
                         </div>
                         <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker3" class="calicon form-control">
                          </div>
                     </div>
                     <label class="col-sm-4 col-md-4 control-label" for="textinput">
                       퇴사일자
                     </label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="retireDate" id="retireDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker4" class="calicon form-control" >
                          </div>
                       </div> 
                 </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     사업장구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <select name="compId" id="compId"  class="form-control input-xs">
			       	       <option value="100">본점</option>
			       	    </select>
			       </div>
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 퇴직중간정산 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-7 col-md-7">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="retireMidDate" id="retireMidDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker5" class="calicon form-control">
                          </div>
                     </div>
                     <label class="col-sm-4 col-md-4 control-label" for="textinput">
                       은행
                     </label>
                        <div class="col-sm-2 col-md-2">
                          <input name="bankCode" id="bankCode" value="" type="text" class="form-control input-xs" >
                       </div> 
                 </div>
			       <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				     계좌번호 
			       </label>
			       <div class="col-sm-3 col-md-3">
				      <input name="bankNumb" id="bankNumb" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
		     </div>
		   </div>
 		</div>
	</form>
  </div>	
</div>
