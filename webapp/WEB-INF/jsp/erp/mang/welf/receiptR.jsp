<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,8,9],"1C");
	//복지접수조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("접수일자,신청일자,부서,직급,성명,현재포인트,신청포인트,신청항목,관련증빙,가부,"+
			           "부적합내용",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			               "100");
	gridMain.setColAlign("center,center,left,left,left,right,right,left,center,center,"+
			             "left");
	gridMain.setColTypes("ro,ro,ro,ro,ro,ron,ron,ron,ro,ch,"+
			             "ro");
	gridMain.setColSorting("date,date,str,str,str,int,int,str,na,na,"+
			               "str");
	gridMain.attachFooter("일계,,,,,,,,,,"+
			              "");
	gridMain.attachFooter("합계,,,,,,,,,,"+
			              "");
	gridMain.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
});
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
			 부서
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서등록','common/deptCodePOP')">
			</div>
		  </div>
	  </div>
	</div> 
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 사번
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('사번','common/seqNoPOP')">
			</div>
		  </div>
	  </div>
	</div> 
	<div class="row">
		<div class="form-group form-group-sm">
			 <div class="col-sm-8 col-md-8">
				  <label class="col-sm-2 col-md-2 control-label" for="textinput">
					구분 
			      </label>
				  <div class="col-sm-4 col-md-4">
					 <div class="col-sm-3 col-md-3">
						<input type="radio" name="gubn" id="gubn" value="전체" checked="checked">전체
					 </div>
					 <div class="col-sm-2 col-md-2">
						<input type="radio" name="gubn" id="gubn" value="가">가
					 </div>
					 <div class="col-sm-2 col-md-2">
						<input type="radio" name="gubn" id="gubn" value="부">부
					 </div>
				   </div>
				</div>
		  </div>
	  </div>  
   </form>
  </div>
</div>