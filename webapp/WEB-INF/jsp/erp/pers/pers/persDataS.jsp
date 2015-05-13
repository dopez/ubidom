<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4],"2U");
	//인사자료등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	subLayout.cells("a").setWidth(403);
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",       width:"25", align:"center", type:"cntr"});
	gridMain.addHeader({name:"사원번호", colId:"empNo",    width:"25", align:"center", type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",  width:"25", align:"center", type:"ro"});
	gridMain.addHeader({name:"부서",     colId:"postName", width:"25", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.init(); 
	
	fn_search();
	subLayout.cells("b").attachObject("bootContainer2");
	
	$("#postName").dblclick(function(){
		gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
	});
	
	$("#persAppointBtn").click(function(){
		gfn_load_pop('w1','pers/persAppointSPOP',true,{"persAppointBtn":$(this).val()});
	});
	
	calMain = new dhtmlXCalendarObject([{input:"amryDate1",button:"calpicker1"},{input:"amryDate2",button:"calpicker2"},{input:"enterDate",button:"calpicker3"},
	{input:"retireDate",button:"calpicker4"},{input:"retireMidDate",button:"calpicker5"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	fn_calValue();
});

function fn_calValue(){
	var t = dateformat(new Date());
	byId("amryDate1").value = t; byId("amryDate2").value = t; 
	byId("enterDate").value = t; byId("retireDate").value = t; byId("retireMidDate").value = t;
};

function fn_search(){
	fn_loadGridList(); 
};

function fn_new(){
	document.getElementById("frmMain").reset();
	fn_calValue();
};

function checkBox_value(inputId){
	var chVal = 0;
	if(document.getElementById(inputId).checked){
		chVal = 1;
	}
	return chVal;
}

function fn_save(){
	var obj = {};
	obj.postNo = $("#postNo").val();
	obj.postName = $("#postName").val();
	obj.empNo = $("#empNo").val();
	obj.korName = $("#korName").val();
	obj.engName = $("#engName").val();
	obj.chaName = $("#chaName").val();
	obj.regiNumb = $("#regiNumb").val();
	obj.jikwee = $("#jikwee").val();
	obj.jikmu = $("#jikmu").val();
	obj.jikchak = $("#jikchak").val();
	obj.address = $("#address").val();
	obj.baseAddrs = $("#baseAddrs").val();
	obj.tel = $("#tel").val();
	obj.handPhone = $("#handPhone").val();
	obj.email = $("#email").val();
	obj.character = $("#character").val();
	obj.taste = $("#taste").val();
	obj.partCont = $("#partCont").val();
	obj.length = $("#length").val();
	obj.weight = $("#weight").val();
	obj.blood = $("#blood").val();
	obj.eyeLeft = $("#eyeLeft").val();
	obj.eyeRight = $("#eyeRight").val();
	obj.disaYn = $("#disaYn").val();
	obj.bldKind = checkBox_value("bldKind");
	obj.disorderYn = checkBox_value("disorderYn");
	obj.disorderCont = $("#disorderCont").val();
	obj.armyKind = $("#armyKind").val();
	obj.amryBarch = $("#amryBarch").val();
	obj.armyGd = $("#armyGd").val();
	obj.armyYn = $("#armyYn").val();
	obj.armyNo = $("#armyNo").val();
	obj.amryDate1 = $("#amryDate1").val();
	obj.amryDate2 = $("#amryDate2").val();
	obj.enterDate = $("#enterDate").val();
	obj.retireDate = $("#retireDate").val();
	obj.retireMidDate = $("#retireMidDate").val();
	obj.bankCode = $("#bankCode").val();
	obj.bankNumb = $("#bankNumb").val();
	obj.religion = $("#religion").val();
	obj.armySpcase = checkBox_value("armySpcase");
	obj.armyMerit = checkBox_value("armyMerit");
	gfn_callAjaxForForm("frmMain",obj,"/erp/persDataS/prcsPersData");
};

function fn_remove(){
    var rodid = gridMain.getSelectedRowId();
    var rodIdx = gridMain.getSelectedRowIndex();
    if(gridMain.isDelRows(rodid)) {
       if(MsgManager.confirmMsg("INF002")) {
     	  if(gridMain.chkUnsavedRow(rodIdx,rodid)) {
     		  return
     	  }else{
     		 var jsonStr = gridMain.getJsonRowDel(rodid);
           if (jsonStr == null || jsonStr.length <= 0) return;
            $("#jsonData").val(jsonStr);
                $.ajax({
                 url : "/erp/persDataS/prcsPersData",
                 type : "POST",
                 data : $("#pform").serialize(),
                 async : true,
                 success : function(data) {
                 MsgManager.alertMsg("INF003");
                 fn_loadGridList();
                }
            });
     	   }   	 
        } else {
         	 MsgManager.alertMsg("WRN004");
          } 
     }else {
         MsgManager.alertMsg("WRN002");
      }
};

function fn_loadGridList(){
    gfn_callAjaxForGrid(gridMain,{},"/erp/persDataS/selLeft",subLayout.cells("a"),fn_loadGridListCB);
};
function fn_loadGridListCB(data){

};

function fn_onOpenPop(){
	var value =  $("#postName").val();
	return value;
};

function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		var i;
		var obj={};
		for(i=0;i<data.length;i++){
			var params =  "postName=" + data[i].postName;
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			$("#postName").val(obj.postName);
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
			<div class="col-sm-2 col-md-2" style="margin-left: 5px;">
			  <input name="persAppointBtn" id="persAppointBtn" type="button" value="인사발령" placeholder="" class="form-control btn btn-default btn-xs">
			</div>
		  </div>
	  </div>
	</div>         
  </form>
 </div> 
</div>
<div id="bootContainer2" style="position: relative; width: 100%; height: 100%;">
  <div class="container">	
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
	   <div class="col-sm-2 col-md-2">
	     <div class="row">
		   <div class="form-group form-group-sm">
			  <div class="col-sm-8 col-md-8">
				 <img alt="" src=""  height="150px;">
			  </div>
		   </div>
 		  </div>
		  <div class="row">
		   <div class="form-group form-group-sm">
			  <div class="col-sm-2 col-md-2 col-sm-offset-2 col-md-offset-2">
				 <input name="upd" id="upd" type="button" value="첨부" placeholder="" class="form-control btn btn-default btn-xs">
			  </div>
			  <div class="col-sm-2 col-md-2">
				  <input name="del" id="del" type="button" value="삭제" placeholder="" class="form-control btn btn-default btn-xs">
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
				  <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs">
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
				  <input name="engName" id="engName" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 주민등록번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="regiNumb" id="regiNumb" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				부서명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs">
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
				  <input name="jikwee" id="jikwee" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 휴대번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="handPhone" id="handPhone" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직무명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="jikmu" id="jikmu" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 이메일 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="email" id="email" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직책명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="jikchak" id="jikchak" type="text" value="" placeholder="" class="form-control input-xs">
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
				 <div class="col-sm-10 col-md-10">
					<input name="postNo" id="postNo" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-2 col-md-2">
					<button type="button" class="form-control btn btn-default btn-xs" name="btnSearch" id="btnSearch" onclick="fn_search()">
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
				 <input name="address" id="address" type="text" value="" placeholder="" class="form-control input-xs">
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
				 성격 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-2 col-md-2">
				      <input name="character" id="character" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     취미 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="taste" id="taste" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     특기 
			       </label>
			       <div class="col-sm-2 col-md-2">
				     <input name="partCont" id="partCont" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 몸무게 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-2 col-md-2">
				      <input name="weight" id="weight" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     신장 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="length" id="length" type="text" value="" placeholder="" class="form-control input-xs">
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
			         <input name="bldKind" id="bldKind" value="1" type="checkbox">
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
				 장애유무
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-1 col-md-1">
			          <input name="disorderYn" id="disorderYn" type="checkbox" value="1">
			       </div>
			       <div class="col-sm-6 col-md-6">
			         <input name="disorderCont" id="disorderCont" value="" type="text" class="form-control input-xs">
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
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 군별 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-2 col-md-2">
				      <input name="armyKind" id="armyKind" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     병과 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="amryBarch" id="amryBarch" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     계급 
			       </label>
			       <div class="col-sm-2 col-md-2">
				     <input name="armyGd" id="armyGd" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 보훈대상 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-2 col-md-2">
				      <input name="armyMerit" id="armyMerit" type="checkbox" value="1" placeholder="" >
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     특례유무 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="armySpcase" id="armySpcase" type="checkbox" value="1" placeholder="" >
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     재대구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
				     <select name="armyYn" id="armyYn" class="form-control input-xs">
				      <option value="1">만기재대</option>
				      <option value="0">소집해제</option>
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
                              <input type="text" class="form-control input-xs" name="amryDate1" id="amryDate1" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'amryDate2', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="amryDate2" id="amryDate2" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'amryDate1', 'min')">
                          </div>
                       </div> 
                 </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     군번 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="armyNo" id="armyNo" type="text" value="" placeholder="" class="form-control input-xs">
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
                    <div class="col-sm-2 col-md-2">
                         <div class="col-sm-11 col-md-11">
                              <input type="text" class="form-control input-xs" name="enterDate" id="enterDate" value="">
                         </div>
                         <div class="col-sm-1 col-md-1">
                              <input type="button" id="calpicker3" class="calicon form-control">
                          </div>
                     </div>
                     <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     퇴사일자 
			         </label>
                       <div class="col-sm-2 col-md-2">
                         <div class="col-sm-11 col-md-11">
                              <input type="text" class="form-control input-xs" name="retireDate" id="retireDate" value="">
                         </div>
                         <div class="col-sm-1 col-md-1">
                              <input type="button" id="calpicker4" class="calicon form-control">
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
                    <div class="col-sm-2 col-md-2">
                         <div class="col-sm-11 col-md-11">
                              <input type="text" class="form-control input-xs" name="retireMidDate" id="retireMidDate" value="">
                         </div>
                         <div class="col-sm-1 col-md-1">
                              <input type="button" id="calpicker5" class="calicon form-control">
                          </div>
                     </div>
                     <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				     은행 
			         </label>
                       <div class="col-sm-2 col-md-2">
                              <input name="bankCode" id="bankCode" value="" type="text" class="form-control input-xs" >
                     </div>
			       <label class="col-sm-2 col-md-2 control-label" for="textinput"> 
				     계좌번호 
			       </label>
			       <div class="col-sm-4 col-md-4">
				      <input name="bankNumb" id="bankNumb" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
		     </div>
		   </div>
 		</div>
	</form>
  </div>	
</div>