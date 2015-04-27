<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,3,5,6],"2U");
	//인사발령등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,사원번호,성명,부서",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100");
	gridMst.setColAlign("center,right,left,left");
	gridMst.setColTypes("ron,ron,ro,ro");
	gridMst.setColSorting("int,int,str,str");
	gridMst.init();	
	subLayout.cells("a").setWidth(403);
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,발령일,급여구분,근무구분,발령구분,부서코드,발령부서,발령직군,근무형태,발령직위,"+
			          "발령직책,급여사업장",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100,100");
	gridDtl.setColAlign("center,center,center,center,center,left,left,center,center,center,"+
			            "center,center");
	gridDtl.setColTypes("ron,dhxCalendarA,coro,coro,coro,ed,ed,coro,coro,coro,"+
			            "coro,coro");
	gridDtl.setColSorting("int,date,str,str,str,str,str,str,str,str,"+
			              "str,str");
	gridDtl.init();
	gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	    var t = dateformat(new Date());
		byId("stDate").value = t;
		
		toolbar.attachEvent("onClick", function(id) {
			if(id == "btn5"){
				gridDtl.addRow(gridDtl.getUID(),"1,,,,,,,,,,,",1);
			}
		});
		
		function doOnRowDblClicked(rowId,colId){
			if(colId==5 || colId ==6){
			gfn_load_popup('부서코드','common/deptCodePOP');
			}
		}
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
  <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  발행일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
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
			<div class="col-sm-2 col-md-2">
			  <div class="col-sm-6 col-md-6">
			    <input type="radio" name="gubn" id="gubn" value="재직" checked="checked">재직
			  </div>
			  <div class="col-sm-6 col-md-6">
			    <input type="radio" name="gubn" id="gubn" value="퇴직">퇴직
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
			 성명
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>   
  </form>
 </div> 
</div>