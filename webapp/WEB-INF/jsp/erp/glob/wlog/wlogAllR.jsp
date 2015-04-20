<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst,gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,9],"2E");
	//업무일지조회(전체)
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("방문,유선,불량분석,견적가격조정,TEST진행,기술지원,자료작성,컴프레인,계",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			"text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridMst.setColAlign("right,right,right,right,right,right,right,right,right");
	gridMst.setColTypes("ron,ron,ron,ron,ron,ron,ron,ron,ron");
	gridMst.setColSorting("int,int,int,int,int,int,int,int,int");
	gridMst.init();		
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,담당,고객,일자,종류,내용,첨부",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			"text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,center,left,left,center");
	gridDtl.setColTypes("ron,ro,ro,ro,ro,ro,ro");
	gridDtl.setColSorting("int,str,str,date,str,str,str");
	gridDtl.init();	

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
				 기간 
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
			</div>
		</div>
	  </div>     
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 담당
			 </label>
			 <div class="col-sm-2 col-md-2">
				<input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		 </div>
	  </div>
	</div> 
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 고객
			 </label>
			 <div class="col-sm-2 col-md-2">
				<input name="custom" id="custom" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('고객','common/customPOP')">
			</div>
		 </div>
	  </div>
	</div>
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 종류
			 </label>
			 <div class="col-sm-2 col-md-2">
				<select id="branch" name="branch" class="form-control input-xs">
				 <option value="방문상담">방문상담</option>
				 <option value="유선상담">유선상담</option>
				 <option value="불량분석">불량분석</option>
				 <option value="견적/가격조정">견적/가격조정</option>
				 <option value="Test진행">Test진행</option>
				 <option value="기술지원">기술지원</option>
				 <option value="자료작성">자료작성</option>
				 <option value="컴플레인">컴플레인</option>
				</select>
			</div>
		 </div>
	  </div>
	</div>
  </form>
 </div>
</div>