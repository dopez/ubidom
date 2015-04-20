<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,9],"1C");
	//일일근태조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,근무일자,부서,직책,사번,성명,근태구분,출근,퇴근,정상,연장,야근,외출,조퇴,지각,총근무,휴일구분,요일",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,center,left,left,left,left,center,center,center,right,right,right,right,right,right,right,center,center");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,coro,ro,ro,ron,ron,ron,ron,ron,ron,ron,coro,coro");
	gridMain.setColSorting("int,date,str,str,int,str,str,date,date,int,int,int,int,int,int,int,str,str");
	gridMain.init();		
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				 집계기간 
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                          </div>
                     </div>
                       <div class="col-sm-2 col-md-2">
                        <label class="col-sm-4 col-md-4 col-sm-offset-3 col-md-offset-3 control-label">
                        ~
                        </label>
                       </div>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                             <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
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
			  <select name="jobgubn" id="jobgubn" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="관리직">관리직</option>
			   <option value="생산직">생산직</option>
			   <option value="용역">용역</option>
			   <option value="외국인">외국인</option>
			   <option value="기술직">기술직</option>
			  </select>
			</div>
			 <label class="col-sm-1 col-md-1 control-label" for="textinput">
			    부서
			   </label>
			   <div class="col-sm-2 col-md-2">
			     <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
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
			     <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
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