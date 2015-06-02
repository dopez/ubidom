<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(0,[1,2,3,4],"2U");
	//사업장 등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 

	subLayout.cells("b").attachObject("bootContainer2");
	
	subLayout.cells("a").setWidth(250);
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",         colId:"no",        width:"15", align:"center", type:"cntr"});
	gridMain.addHeader({name:"사업장번호", colId:"compId",    width:"42", align:"center", type:"ro"});
	gridMain.addHeader({name:"사업장",     colId:"compName",  width:"42", align:"center", type:"ro"});
	gridMain.setUserData("","pk","compId");
	gridMain.setColSort("str");
	gridMain.init(); 
	gridMain.attachEvent("onRowSelect",doOnRowSelect);

	calMain = new dhtmlXCalendarObject([{input:"startDate",button:"calpicker1"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	fn_calValue();
	
	$("#btnSearch").click(function(){
   	 execDaumPostcode("zipCode","address");
	}); 
	
	byId("cudKey").value = "INSERT";
	fn_search();
});
function doOnRowSelect(id, ind){
	byId("cudKey").value = "UPDATE";
	disableValue(2);
	var obj={};
	obj.compId= gridMain.setCells(id,1).getValue();
	fn_loadFormList(obj);
};
function disableValue(flag){
	if(flag == 1){
	  $("input[name=compId]").attr("disabled",false);
	  
	}else{
	  $("input[name=compId]").attr("disabled",true);
	}
};
function fn_search(){
	fn_loadGridList(); 
	fn_new();
};
function fn_new(){
	byId("frmMain").reset();
	fn_calValue();
	disableValue(1);
	byId("cudKey").value = "INSERT";
};
function fn_calValue(){
	var t = dateformat(new Date());
	byId("startDate").value = t; 
};
function fn_loadGridList(){
    gfn_callAjaxForGrid(gridMain,{},"gridMainSearch",subLayout.cells("a"));
};
function fn_save(){
	 f_dxRules = {
	   compId :        ["회사코드",r_notEmpty],
	   compName :      ["회사명",r_notEmpty],
 	   presidentName : ["대표자명",r_notEmpty],
 	   compNo:         ["사업자등록번호",r_notEmpty],
 	   corpNo:         ["법인번호",r_notEmpty],
 	   bizStatus:      ["업태",r_notEmpty],
 	   bizItem:        ["업종",r_notEmpty],
       zipCode:        ["우편번호",r_notEmpty],
       address:        ["주소",r_notEmpty],
       startDate:      ["개업년월일",r_notEmpty]
	};
	 
	if(gfn_formValidation('frmMain')){
 		 disableValue(1);	
        $.ajax({
         url : "/erp/comm/stan/compS/formSave",
         type : "POST",
         data : gfn_getFormElemntsData('frmMain'),
         async : true,
         success : function(data) {
         MsgManager.alertMsg("INF001");
         fn_search();
         }
      }); 
	}
};

function fn_remove(){
	$('#cudKey').val('DELETE');
    var rodid = gridMain.getSelectedRowId();
    gridMain.cs_deleteRow(rodid);
};
function fn_loadFormList(params){
	gfn_callAjaxForForm("frmMain",params,"formSearch");
};
</script>
<form id="pform" name="pform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer2" style="position: relative; width: 100%; height: 100%;">
  <div class="container">	
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">
	  <input type="hidden" id="cudKey" name="cudKey" />
      <input type="hidden" id="placeName" name="placeName" />
      <input type="hidden" id="confirmNo" name="confirmNo" />
       <div class="row">
			<div class="form-group form-group-sm">
			 <div class="col-sm-6 col-md-6">
				<label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				회사코드
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="compId" id="compId" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			</div>
		  </div>	
		</div>
      	<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
				<label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				대표자명
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="presidentName" id="presidentName" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 회사명
			    </label>
				<div class="col-sm-3 col-md-3">
					<input name="compName" id="compName" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
			</div>
		  </div>	
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
			    <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				사업자등록번호
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="compNo" id="compNo" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 영문회사명
			    </label>
				<div class="col-sm-3 col-md-3">
					<input name="eCompName" id="eCompName" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
			 </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
			    <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				업태
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="bizStatus" id="bizStatus" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 법인번호
			    </label>
				<div class="col-sm-3 col-md-3">
					<input name="corpNo" id="corpNo" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
			  </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			 <div class="col-sm-6 col-md-6">
			   <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				우편번호
				</label>
				<div class="col-sm-3 col-md-3">
					<div class="col-sm-8 col-md-8">
					<input name="zipCode" id="zipCode" type="text" value="" placeholder="" class="form-control input-xs" >
				 </div>
				 <div class="col-sm-3 col-md-3">
					<button type="button" class="form-control btn btn-default btn-xs" name="btnSearch" id="btnSearch">
					  <span class="glyphicon glyphicon-search"></span>
					</button>
				 </div>
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 종목
			    </label>
				<div class="col-sm-3 col-md-3">
					<input name="bizItem" id="bizItem" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
			 </div>
		   </div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
			    <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				주소
				</label>
				<div class="col-sm-9 col-md-9">
					<input name="address" id="address" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			  </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
			    <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				영문 회사주소
				</label>
				<div class="col-sm-9 col-md-9">
					<input name="eAddress" id="eAddress" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			  </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
			    <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				전화번호
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="tel" id="tel" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			  </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
			    <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				이메일
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="email" id="email" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 팩스번호
			    </label>
				<div class="col-sm-3 col-md-3">
					<input name="fax" id="fax" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
			  </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
			    <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				국외용 전화번호
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="eTel" id="eTel" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			  </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			<div class="col-sm-6 col-md-6">
				<label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				국외용 이메일
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="eEmail" id="eEmail" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 국외용 팩스번호
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="eFax" id="eFax" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
			  </div>
		   </div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
				<label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				개업연월일
				</label>
				<div class="col-sm-3 col-md-3">
					<div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs format_date" name="startDate" id="startDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker1" class="calicon form-control">
                          </div>
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 홈페이지
			    </label>
				<div class="col-sm-3 col-md-3">
					<input name="url" id="url" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
			  </div>
			</div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			  <div class="col-sm-6 col-md-6">
				<label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				회기년도
				</label>
				<div class="col-sm-3 col-md-3">
					<select name="fiYear" id="fiYear" class="form-control input-xs">
					  <option value="01">03월 결산법인</option>
					  <option value="02">06월 결산법인</option>
					  <option value="03">09월 결산법인</option>
					  <option value="04">12월 결산법인</option>
					</select>
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 재고자산평가방법
			    </label>
				<div class="col-sm-3 col-md-3">
					<select name="inventoryAssetKind" id="inventoryAssetKind" class="form-control input-xs">
					  <option value="001">총평균법</option>
					  <option value="002">이동 평균법</option>
					  <option value="003">선입 선출법</option>
					  <option value="004">후입 선출법</option>
					</select>
			    </div>
			  </div> 
		    </div>
		</div>
		<div class="row">
			<div class="form-group form-group-sm">
			 <div class="col-sm-6 col-md-6">
				<label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				회계기수
				</label>
				<div class="col-sm-3 col-md-3">
					<input name="fiFlag" id="fiFlag" type="text" value="" placeholder="" class="form-control input-xs">
				</div>
				<label class="col-sm-3 col-md-3 control-label" for="textinput">
				 세무서
			    </label>
				<div class="col-sm-3 col-md-3">
					<input name="taxofficeCode" id="taxofficeCode" type="text" value="" placeholder="" class="form-control input-xs">
			    </div>
			  </div>
			</div>
		</div>
	</form>
  </div>	
</div>