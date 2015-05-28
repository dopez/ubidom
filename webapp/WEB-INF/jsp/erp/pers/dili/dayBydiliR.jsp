<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;  
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,3,6,8],"1C");
	//일일근태등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = new dxGrid(subLayout.cells("a"), false);
	gridMain.addHeader({name:"NO",       colId:"no",         width:"5", align:"center", type:"cntr"});
	gridMain.addHeader({name:"근무일자", colId:"workDate",   width:"7", align:"center", type:"dhxCalendarA"});
	gridMain.addHeader({name:"부서",     colId:"postName",   width:"7", align:"center", type:"ro"});
	gridMain.addHeader({name:"직위",     colId:"jikweeName", width:"7", align:"center", type:"ro"});
	gridMain.addHeader({name:"사번",     colId:"empNo",      width:"7", align:"center", type:"ro"});
	gridMain.addHeader({name:"성명",     colId:"korName",    width:"7", align:"center", type:"ro"});
	gridMain.addHeader({name:"근태구분", colId:"workKind",   width:"7", align:"center", type:"combo"});
	gridMain.addHeader({name:"정상",     colId:"workTime",   width:"7", align:"center", type:"edn"});
	gridMain.addHeader({name:"연장",     colId:"overTime",   width:"7", align:"center", type:"edn"});
	gridMain.addHeader({name:"야근",     colId:"nightTime",  width:"7", align:"center", type:"edn"});
	gridMain.addHeader({name:"외출",     colId:"partTime",   width:"7", align:"center", type:"edn"});
	gridMain.addHeader({name:"조퇴",     colId:"earlyTime",  width:"7", align:"center", type:"edn"});
	gridMain.addHeader({name:"지각",     colId:"lateTime",   width:"7", align:"center", type:"edn"});
	gridMain.addHeader({name:"총근무",   colId:"totalTime",  width:"7", align:"center", type:"edn"});
	gridMain.setUserData("","pk","no");
	gridMain.setColSort("str");
	gridMain.init();

	calMain = new dhtmlXCalendarObject([{input:"frDate",button:"calpicker1"},{input:"toDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("frDate").value = t;
	byId("toDate").value = t;
});
//조회
function fn_search(){
	fn_loadGridList();
};
//엑셀
function fn_excel(){
	gridMain.getDxObj().toExcel("http://175.209.128.74/grid-excel/generate");
 };
 
function  fn_print(){
	/* var url = "/erp/pers/stan/deptR/report/deptR.do";
	url = url + "?postName=" + $("#postName").val();
	url = url + "&historyKind="+ $('input[name="historyKind"]:checked').val();
	window.open(url,'rpt',''); */
 }
function fn_loadGridLeftList(){
	var obj={};
	obj.workDate = $('#workDate').val();
	obj.postCode = $('#postCode').val();
	obj.jikgun = $('#jikgun').val();
	if(obj.postCode == ''){
		obj.postCode = '%';
	}
    gfn_callAjaxForGrid(gridMst,obj,"gridMainSearch",subLayout.cells("a"),fn_loadGridLeftListCB);
}

</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
     <input type="hidden" id="postCode" name="postCode">
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
			  <select name="jobgubn" id="jobgubn" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="연차휴가">연차휴가</option>
			   <option value="월차휴가">월차휴가</option>
			   <option value="생리휴가">생리휴가</option>
			   <option value="유급휴가">유급휴가</option>
			   <option value="무급휴가">무급휴가</option>
			   <option value="공상">공상</option>
			   <option value="결근(유급)">결근(유급)</option>
			   <option value="결근(무급)">결근(무급)</option>
			   <option value="결근(무결)">결근(무결)</option>
			   <option value="훈련">훈련</option>
			   <option value="출장">출장</option>
			   <option value="지각">지각</option>
			   <option value="조퇴">조퇴</option>
			   <option value="외출">외출</option>
			   <option value="주휴">주휴</option>
			   <option value="교육">교육</option>
			   <option value="휴직">휴직</option>
			   <option value="특근">특근</option>
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
			    <input type="radio" name="gubn" id="gubn" value="전체" checked="checked">전체
			  </div>
			  <div class="col-sm-6 col-md-6">
			    <input type="radio" name="gubn" id="gubn" value="근태이상" checked="checked">근태이상
			  </div>
			</div>
		  </div>
	  </div>
	</div>
  </form>
 </div> 
</div>