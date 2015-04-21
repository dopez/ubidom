<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,2,3,4],"2U");
	//인사자료등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,사원번호,성명,부서",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100");
	gridMain.setColAlign("center,right,left,left");
	gridMain.setColTypes("ron,ron,ro,ro");
	gridMain.setColSorting("int,int,str,str");
	gridMain.init();	
	subLayout.cells("a").setWidth(403);
	
	subLayout.cells("b").attachObject("bootContainer2");
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"},{input:"isDate",button:"calpicker3"},
	{input:"tsDate",button:"calpicker4"},{input:"tjDate",button:"calpicker5"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t; byId("edDate").value = t; byId("isDate").value = t; byId("tsDate").value = t; byId("tjDate").value = t;
	

});
function fn_search(){

}
function fn_save(){
	
}
function fn_new(){
	
}
function fn_delete(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
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
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 근무
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="work" id="work" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="재직">재직</option>
			   <option value="휴직">휴직</option>
			   <option value="퇴직">퇴직</option>
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
			  <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 성명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
			<div class="col-sm-2 col-md-2" style="margin-left: 5px;">
			  <input name="pers" id="pers" type="button" value="인사발령" placeholder="" class="form-control btn btn-default btn-xs">
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
				  <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 성명(한자) 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="nameHan" id="nameHan" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				성명(영문) 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="nameEng" id="nameEng" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 주민등록번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="jumin" id="jumin" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				부서명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="deptName" id="deptName" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
		   </div>
 		 </div>
 		 <div class="row">
		   <div class="form-group form-group-sm">
		      <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 전화번호 
			  </label>
			  <div class="col-sm-2 col-md-2">
				 <input name="phone" id="phone" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			  <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				직무명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="job" id="job" type="text" value="" placeholder="" class="form-control input-xs">
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
				직책명 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="positionName" id="positionName" type="text" value="" placeholder="" class="form-control input-xs">
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
				세콤ID 
			  </label>
			  <div class="col-sm-2 col-md-2">
				  <input name="cecom" id="cecom" type="text" value="" placeholder="" class="form-control input-xs">
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
				 <div class="col-sm-11 col-md-11">
					<input name="postNo" id="postNo" type="text" value="" placeholder="" class="form-control input-xs">
				 </div>
				 <div class="col-sm-1 col-md-1">
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
				 본적 
			  </label>
			  <div class="col-sm-6 col-md-6">
				 <input name="addr2" id="addr2" type="text" value="" placeholder="" class="form-control input-xs">
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
				      <input name="char" id="char" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     취미 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="hobby" id="hobby" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     특기 
			       </label>
			       <div class="col-sm-2 col-md-2">
				     <input name="spec" id="spec" type="text" value="" placeholder="" class="form-control input-xs">
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
				      <input name="height" id="height" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     혈액형 
			       </label>
			       <div class="col-sm-2 col-md-2">
				     <input name="blod" id="blod" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 학력 
			    </label>
			    <div class="col-sm-6 col-md-6">
			       <div class="col-sm-2 col-md-2">
				      <input name="academic" id="academic" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     결혼구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
			         <select name="wedding" id="wedding" class="form-control input-xs">
			           <option value="미혼">미혼</option>
			           <option value="기혼">기혼</option>
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
			             <input name="EyeLeft" id="EyeLeft" type="text" value="" placeholder="" class="form-control input-xs">
			          </div>
				      <div class="col-sm-6 col-md-6">
			             <input name="EyeRight" id="EyeRight" type="text" value="" placeholder="" class="form-control input-xs">
			          </div>
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     색맹구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
			         <input name="colorEye" id="colorEye" value="" type="checkbox">
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
			          <input name="empty" id="empty" type="checkbox" value="">
			       </div>
			       <div class="col-sm-6 col-md-6">
			         <input name="jang" id="jang" value="" type="text" class="form-control input-xs">
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
			          <input name="religion" id="religion" type="text" value="" class="form-control input-xs">
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
				      <input name="amyType" id="amyType" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     병과 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="amyType1" id="amyType1" type="text" value="" placeholder="" class="form-control input-xs">
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     계급 
			       </label>
			       <div class="col-sm-2 col-md-2">
				     <input name="amyType2" id="amyType2" type="text" value="" placeholder="" class="form-control input-xs">
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
				      <input name="bohun" id="bohun" type="checkbox" value="" placeholder="" >
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     특례유무 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="tle" id="tle" type="checkbox" value="" placeholder="" >
			       </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     재대구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
				     <select name="jede" id="jde" class="form-control input-xs">
				      <option value="만기재대">만기재대</option>
				      <option value="소집해제">소집해제</option>
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
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                          </div>
                       </div> 
                 </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     군번 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="amyNum" id="amyNum" type="checkbox" value="" placeholder="" >
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
                              <input type="text" class="form-control input-xs" name="isDate" id="isDate" value="">
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
                              <input type="text" class="form-control input-xs" name="tsDate" id="tsDate" value="">
                         </div>
                         <div class="col-sm-1 col-md-1">
                              <input type="button" id="calpicker4" class="calicon form-control">
                          </div>
                     </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     사업장구분 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="saup" id="saup" type="text" value="" placeholder="" class="form-control input-xs">
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
                              <input type="text" class="form-control input-xs" name="tjDate" id="tjDate" value="">
                         </div>
                         <div class="col-sm-1 col-md-1">
                              <input type="button" id="calpicker5" class="calicon form-control">
                          </div>
                     </div>
                     <div class="col-sm-5 col-md-5">
                     <label class="col-sm-5 col-md-5 control-label" for="textinput"> 
				     국민연금 
			         </label>
                       <div class="col-sm-1 col-md-1">
                         <input name="gmyg" id="gmyg" type="checkbox" value="" placeholder="" >
                     </div>
                     <label class="col-sm-5 col-md-5 control-label" for="textinput"> 
				     고용보험 
			         </label>
                       <div class="col-sm-1 col-md-1">
                         <input name="gybh" id="gybh" type="checkbox" value="" placeholder="" >
                     </div>
                     </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     급여대장미표시부분 
			       </label>
			       <div class="col-sm-2 col-md-2">
				      <input name="bubun" id="bubun" type="checkbox" value="" placeholder="" >
			       </div>
		     </div>
		   </div>
 		</div>
 		<div class="row">
		   <div class="form-group form-group-sm">
		        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 
				 은행 
			    </label>
			    <div class="col-sm-6 col-md-6">
                    <div class="col-sm-2 col-md-2">
                        <input type="text" name="bank" id="bank" class="form-control input-xs"> 
                     </div>
			       <label class="col-sm-3 col-md-3 control-label" for="textinput"> 
				     계좌번호 
			       </label>
			       <div class="col-sm-7 col-md-7">
				      <input type="text" name="bankNum" id="bankNum" class="form-control input-xs">
			       </div>
		     </div>
		   </div>
 		</div>
	</form>
  </div>	
</div>