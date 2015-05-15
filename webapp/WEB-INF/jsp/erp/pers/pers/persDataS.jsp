<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	gridMain.addHeader({name:"사업장",     colId:"compId", width:"5", align:"center", type:"ro"});
	gridMain.setColSort("str");	
	gridMain.setUserData("","pk","no");
	gridMain.init(); 
	gridMain.setColumnHidden(4,true);
	gridMain.attachEvent("onRowSelect",doOnRowSelect);
	fn_search();

	subLayout.cells("b").attachObject("bootContainer2");
	
	$("#postName").click(function(){
		gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
	});
	
    $("#postName").keyup(function(e) {
	    if (e.keyCode == '9') {
	    	gfn_load_pop('w1','common/deptCodePOP',true,{"postName":$(this).val()});
	    }
	 });
    
    $("#ptName").keyup(function(e) {
	    if (e.keyCode == '13') {
	      gridMain.filterBy(3,byId("ptName").value);
	    }
	 });
    
     $("#btnSearch").click(function(){
    	 execDaumPostcode();
	}); 
    
	$("#persAppointBtn").click(function(){
		gfn_load_pop('w1','pers/persAppointSPOP',true,{"persAppointBtn":$(this).val()});
	});
	
	calMain = new dhtmlXCalendarObject([{input:"amryDate1",button:"calpicker1"},{input:"amryDate2",button:"calpicker2"},{input:"enterDate",button:"calpicker3"},
	{input:"retireDate",button:"calpicker4"},{input:"retireMidDate",button:"calpicker5"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	fn_calValue();
	
	byId("cudKey").value = "INSERT";
});
		
function doOnRowSelect(id, ind){
	byId("cudKey").value = "UPDATE";
	disableValue(2);
	var obj={};
	obj.compId= gridMain.setCells(id,4).getValue();
	obj.empNo= gridMain.setCells(id,1).getValue();
	fn_loadFormList(obj);
	
}

function disableValue(flag){
	if(flag == 1){
	  $("input[name=empNo]").attr("disabled",false);
	  $("input[name=jikwee]").attr("disabled",false);
	  $("input[name=jikmu]").attr("disabled",false);
	  $("input[name=jikchak]").attr("disabled",false);
	}else{
	  $("input[name=empNo]").attr("disabled",true);
	  $("input[name=jikwee]").attr("disabled",true);
	  $("input[name=jikmu]").attr("disabled",true);
	  $("input[name=jikchak]").attr("disabled",true);
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
	fn_calValue();
	disableValue(1);
	byId("cudKey").value = "INSERT";
};

 function fn_save(){
	 disableValue(1);
	var params = $("#frmMain").serialize();
	$.post("/erp/persDataS/prcsPersData",params,prcsPersDtaCB);
	//gfn_callAjaxForForm("frmMain",params,"/erp/persDataS/prcsPersData");
}; 

/* function fn_save(){
	 $("input[name=empNo]").attr("disabled",false);
	$("#frmMain").validate();
	var params = $("#frmMain").serialize();
	$('#frmMain').submit();
	if($("#frmMain").valid()){
		$.ajax(
				 {
				   type:'POST',
				   url:"/erp/persDataS/prcsPersData",
				   data:params,
				   success:function(data)
				     {
				    	 prcsPersDtaCB(data);
				     }
				   });
	}else{
		return false;
	} 
	//$.post("/erp/persDataS/prcsPersData",params,prcsPersDtaCB);
	//gfn_callAjaxForForm("frmMain",params,"/erp/persDataS/prcsPersData");
}; */

function prcsPersDtaCB(){
	fn_loadGridList();
	fn_new();
}
function fn_remove(){
    var rodid = gridMain.getSelectedRowId();
    var rodIdx = gridMain.getSelectedRowIndex();
    if(gridMain.isDelRows(rodid)) {
       if(MsgManager.confirmMsg("INF002")) {
    	   byId("cudKey").value = "DELETE";
    	   disableValue(1);
                $.ajax({
                 url : "/erp/persDataS/prcsPersData",
                 type : "POST",
                 data : $("#frmMain").serialize(),
                 async : true,
                 success : function(data) {
                 MsgManager.alertMsg("INF003");
                 fn_new();
                 fn_loadGridList();
                }
            });   	 
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

function fn_loadFormList(params){
	gfn_callAjaxForGridToFrom(params,"/erp/persDataS/selRight",subLayout.cells("a"),fn_loadFromListCB);
	//$.post("/erp/persDataS/selRight",params,fn_loadFromListCB);
};

function fn_loadFromListCB(data){
	byId("frmMain").reset();
	gfn_setDataInFrom($("#frmMain"),data[0]);
};

function fn_onOpenPop(pName){
	var value;
	if(pName=="postCode"){
		value =  $("#postName").val();	  
	}else if(pName == "empNo"){
		value = $("#empName").val();
	}
	return value;
};

function fn_onClosePop(pName,data){
	if(pName=="postCode"){
		var i;
		var obj={};
		for(i=0;i<data.length;i++){
			obj.postName=data[i].postName;
			obj.postCode=data[i].postCode;
			$("#postName").val(obj.postName);
			$("#postCode").val(obj.postCode);
		}		  
	}else if(pName=="empNo"){
		var i;
		var obj={};
		for(i=0;i<data.length;i++){
			obj.empNo=data[i].empNo;
			obj.korName=data[i].korName;
			$("#empNo").val(obj.empNo);
			$("#empName").val(obj.korName);
		}		  
	}	  
 };
 
 function execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 도로명 조합형 주소 변수

             // 법정동명이 있을 경우 추가한다.
             if(data.bname !== ''){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있을 경우 추가한다.
             if(data.buildingName !== ''){
                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }
             // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
             if(fullRoadAddr !== ''){
                 fullRoadAddr += extraRoadAddr;
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById("postNo").value = data.postcode1+"-"+data.postcode2;
             document.getElementById("address").value = fullRoadAddr;
             document.getElementById("baseAddrs").value = data.jibunAddress; 
         }
     }).open();
 }
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">
	<input type="hidden" id="empNo" name="empNo" />
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
<div id="bootContainer2" style="position: relative; width: 100%; height: 100%;">
  <div class="container">	
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
	  <input type="hidden" id="cudKey" name="cudKey" />
	  <input type="hidden" id="postCode" name="postCode" />
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
				 <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs" required="required">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				성명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs" required="required">
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
				  <input name="engName" id="engName" type="text" value="" placeholder="" class="form-control input-xs" required="required">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 주민등록번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="regiNumb" id="regiNumb" type="text" value="" placeholder="" class="form-control input-xs" required="required">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				부서명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs" required="required">
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
				  <input name="jikwee" id="jikwee" type="text" value="" placeholder="" class="form-control input-xs" required="required">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 휴대번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="handPhone" id="handPhone" type="text" value="" placeholder="" class="form-control input-xs" required="required">
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
				 <input name="email" id="email" type="text" value="" placeholder="" class="form-control input-xs" required="required">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직책명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="jikchak" id="jikchak" type="text" value="" placeholder="" class="form-control input-xs" required="required">
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
					<input name="postNo" id="postNo" type="text" value="" placeholder="" class="form-control input-xs" required="required">
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
				 <input name="address" id="address" type="text" value="" placeholder="" class="form-control input-xs" required="required">
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
				     <input name="bldKind" id="bldKind" value="1" type="checkbox">
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
			          <input name="disorderYn" id="disorderYn" type="checkbox" value="1">
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
				      <input name="armyMerit" id="armyMerit" type="checkbox" value="1" placeholder="" >
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
                              <input type="text" class="form-control input-xs" name="enterDate" id="enterDate" value="" required="required">
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
                              <input type="text" class="form-control input-xs" name="retireDate" id="retireDate" value="">
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
                              <input type="text" class="form-control input-xs" name="retireMidDate" id="retireMidDate" value="">
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