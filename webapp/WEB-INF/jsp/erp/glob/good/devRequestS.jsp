<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
$(document).ready(function(){
	Ubi.setContainer(3,[1,2,3,4],"2E");
	//제품개발의뢰등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,부서코드,부서명",null,
			         ["text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100");
	gridMst.setColAlign("center,left,left");
	gridMst.setColTypes("ron,ro,ro");
	gridMst.setColSorting("int,str,str");
	gridMst.init();
	gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("관련부서");
	var sLayout1 = subLayout.cells("a");
	var subTbr = subToolbar('toolbar1',sLayout1,[5,6]);
	subTbr.attachEvent("onClick", function(id) {
		if(id == "btn5"){
			gridMst.addRow(gridMst.getUID(),"1,,",1);
		  }
	});
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,제품개발내용",null,
			         ["text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,200");
	gridDtl.setColAlign("center,left");
	gridDtl.setColTypes("ron,ed");
	gridDtl.setColSorting("int,str");
	gridDtl.init();
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("개발의뢰내용");
	var sLayout2 = subLayout.cells("b");
	subToolbar('toolbar2',sLayout2,[5,6]);
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
	
	function doOnRowDblClicked(rowId,colId){
		if(colId==1){
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
			 담당
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>           
  </form>
 </div> 
</div>