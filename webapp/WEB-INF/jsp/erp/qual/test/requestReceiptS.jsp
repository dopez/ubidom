<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst,gridDtl; 
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"2E"); 
	//시험의뢰접수등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,선택,회사,소속,성명,요청일,완료일,설비,위치,약품,"+
			          "시료명,시료수량,시료처리,결과공유,시험종류및시험수량,#cspan,#cspan,#cspan,목적/용도,요구사항,"+
			          "시료특이사항",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;"]);
	gridMst.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,"+
			             "#rspan,#rspan,#rspan,#rspan,종류,항목,시험수량,세부내역,#rspan,#rspan,"+
			             "#rspan",
			            ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100,100,100,100,70,70,70,70,100,100,"+
			              "100");
	gridMst.setColAlign("center,center,left,left,left,center,center,left,left,left,"+
			            "left,right,left,left,left,left,right,left,left,left,"+
			            "left");
	gridMst.setColTypes("ron,ra,ro,ro,ro,ro,ro,ro,ro,ro,"+
			            "ro,ron,ro,ro,ro,ro,ron,ro,ro,ro,"+
			            "ro");
	gridMst.setColSorting("int,na,str,str,str,date,date,str,str,str,"+
			              "str,int,str,str,str,str,int,str,str,str,"+
			              "str");
	gridMst.init();	
	gridMst.attachEvent("onCheck",doOnCheck);
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("시험의뢰내역");
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,목적/용도,요청일,완료일,시료명,시료수량,시료처리,시험담당,결과통보일자",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,center,center,left,right,left,left,center");
	gridDtl.setColTypes("ron,ro,ro,ro,ro,ron,ro,ro,dhxCalendarA");
	gridDtl.setColSorting("int,str,date,date,str,int,str,str,date");
	gridDtl.init();	
	gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("시험의뢰접수내역");

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
	
	toolbar.attachEvent("onClick", function(id) {
		if(id == "btn5"){
			gridMst.addRow(gridMst.getUID(),"1,,,,,,,,,,,,,,,,,,,,",1);
		}
	});
	
	function doOnCheck(rowId,colId){
		if(colId==1){
			gridDtl.addRow(gridDtl.getUID(),"1,,,,,,,,",1);
		}
	}
	
	function doOnRowDblClicked(rowId,colId){
		if(colId==7){
		gfn_big_load_popup(403,300,'담당','qual/chargePOP');
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
			  일자
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
             </div>
		 </div>
	    </div>
      </div>  
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 접수자
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="register" id="register" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>        
  </form>
 </div> 
</div>