<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;  
var calMain;
var combo;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,9],"1C");
	//일일근태조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"5", align:"center", type:"cntr"});
	gridMain.addHeader({name:"근무일자", colId:"workDate",   width:"6", align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"부서",     colId:"postName",   width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"직위",     colId:"jikweeName", width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"사번",     colId:"empNo",      width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",    width:"6", align:"center", type:"ro"});
	gridMain.addHeader({name:"근태구분", colId:"workKind",   width:"6", align:"center", type:"combo"});
	gridMain.addHeader({name:"정상",     colId:"workTime",   width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"연장",     colId:"overTime",   width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"야근",     colId:"nightTime",  width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"외출",     colId:"partTime",   width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"조퇴",     colId:"earlyTime",  width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"지각",     colId:"lateTime",   width:"5", align:"center", type:"ro"});
	gridMain.addHeader({name:"총근무",   colId:"totalTime",  width:"5", align:"center", type:"ro"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMain.init();

	calMain = new dhtmlXCalendarObject([{input:"frDate",button:"calpicker1"},{input:"toDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("frDate").value = t;
	byId("toDate").value = t;
	
	combo =gridMain.getColumnCombo(6);
	fn_comboSet(combo);
});
function fn_comboSet(comboId){
	var params={};
	params.compId = '100';
	params.code = 'P008';
	
	comboId.setTemplate({
	    input: "#interName#",
	    columns: [
	       {header: "구분", width: 100,  option: "#interName#"}
	    ]
	});
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
comboId.enableFilteringMode(true);
comboId.enableAutocomplete(true);
comboId.allowFreeText(true);
};
function fn_search(){
	fn_loadGridList();
};
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
function  fn_print(){
	/* var url = "/erp/pers/stan/deptR/report/deptR.do";
	url = url + "?postName=" + $("#postName").val();
	url = url + "&historyKind="+ $('input[name="historyKind"]:checked').val();
	window.open(url,'rpt',''); */
 }
function fn_loadGridList(){
	var obj={};
	obj.frDate = $('#frDate').val();
	obj.toDate = $('#toDate').val();
	obj.postCode = $('#postCode').val();
	obj.jikgun = $('#jikgun').val();
	obj.workKind = $('#workKind').val();
	obj.empNo = $('#empNo').val();
	obj.inoutChk = $('input[name="inoutChk"]:checked').val();
	if(obj.postCode == ''){
		obj.postCode = '%';
	}
	if(obj.empNo == ''){
		obj.empNo = '%';
	}
	console.log(obj);
	gfn_callAjaxForGrid(gridMain,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridListCB);
}
function fn_loadGridListCB(data){
	$('#empNo').val('');
	$('#korName').val('');
	$('#postCode').val('');
	$('#postName').val('');
};
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
     <input type="hidden" id="postCode" name="postCode">
     <input type="hidden" id="empNo" name="empNo">
      <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				 집계기간 
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="frDate" id="frDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'toDate', 'max')">
                          </div>
                     </div>
                       <div class="col-sm-2 col-md-2">
                        <label class="col-sm-4 col-md-4 col-sm-offset-3 col-md-offset-3 control-label">
                        ~
                        </label>
                       </div>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="toDate" id="toDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'frDate', 'min')">
                          </div>
                       </div> 
                 </div>       
			</div>
		</div>
	  </div> 
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
			    부서
			   </label>
			   <div class="col-sm-2 col-md-2">
			     <input name="postName" id="postName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			   </div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 근태구분
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="workKind" id="workKind" class="form-control input-xs">
			   <option value="%">전체</option>
			   <option value="01">연차휴가</option>
			   <option value="02">월차휴가</option>
			   <option value="03">생리휴가</option>
			   <option value="04">유급휴가</option>
			   <option value="05">무급휴가</option>
			   <option value="06">공상</option>
			   <option value="07">결근(유급)</option>
			   <option value="08">결근(무급)</option>
			   <option value="09">결근(무결)</option>
			   <option value="10">훈련</option>
			   <option value="11">출장</option>
			   <option value="12">지각</option>
			   <option value="13">조퇴</option>
			   <option value="14">외출</option>
			   <option value="15">휴일</option>
			   <option value="16">정상</option>
			   <option value="17">주휴</option>
			   <option value="18">교육</option>
			   <option value="19">휴직</option>
			   <option value="20">특근</option>
			  </select>
			</div>
			 <label class="col-sm-1 col-md-1 control-label" for="textinput">
			    성명
			   </label>
			   <div class="col-sm-2 col-md-2">
			     <input name="korName" id="korName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			   </div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 출력구분
			 </label>
			<div class="col-sm-3 col-md-3">
			  <div class="col-sm-6 col-md-6">
			    <input type="radio" name="inoutChk" id="inoutChk" value="1" checked="checked">전체
			  </div>
			  <div class="col-sm-6 col-md-6">
			    <input type="radio" name="inoutChk" id="inoutChk" value="2">근태이상
			  </div>
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>