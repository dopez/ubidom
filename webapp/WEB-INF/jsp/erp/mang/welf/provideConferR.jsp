<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst,gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"2E");
	//복지지급품의조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("신청일자,부서,직급,성명,현재포인트,신청포인트,선택,결재,#cspan,#cspan,"+
			          "#cspan,#cspan,#cspan,#cspan,#cspan",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,작성,일자,검토,"+
			             "일자,검토,일자,승인,일자",
			            ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,70,70,70,"+
			              "70,70,70,70,70");
	gridMst.setColAlign("center,left,left,left,right,right,center,center,center,center,"+
			            "center,center,center,center,center");
	gridMst.setColTypes("ro,ro,ro,ro,ron,ron,ra,ro,ro,ro,"+
			            "ro,ro,ro,ro,ro");
	gridMst.setColSorting("date,str,str,str,int,int,na,str,str,str,"+
			              "str,str,str,str,str");
	gridMst.init();	

	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("접수일자,신청일자,현재포인트,신청포인트,신청항목,관련증빙",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;"]);
    gridDtl.setInitWidths("100,100,100,100,100,100");
	gridDtl.setColAlign("center,center,right,right,left,center");
	gridDtl.setColTypes("ro,ro,ron,ron,ro,ro");
	gridDtl.setColSorting("date,date,int,int,str,str");
	gridDtl.attachFooter("합계,,,,,");
	gridDtl.init();	

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
			  <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
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
   </form>
  </div>
</div>