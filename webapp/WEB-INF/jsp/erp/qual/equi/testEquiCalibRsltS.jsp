<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst,Dtl;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(1,[1,8,9],"2E"); //시험장비검교정결과등록
	
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");

	//grid	
	
	gridMst = subLayout.cells("a").showHeader();
	gridMst = subLayout.cells("a").setText("검교정대상 시험장비");
	gridMst = subLayout.cells("a").attachGrid();
    gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //10
    gridMst.setHeader("No,장비코드,장비명,규격,용도,교정항목,교정주기,교정기간,최종교정일자,교정예정일자,선택");
    gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
    gridMst.setColAlign("center,left,left,left,left,center,center,center,center,center,center");
    gridMst.setColTypes("edn,ed,ed,ed,ed,ed,ed,ed,ed,ed,ra");
    gridMst.setColSorting("int,str,str,str,str,str,str,str,str,str,str");
    gridMst.init();
    
    gridDtl = subLayout.cells("b").showHeader();
	gridDtl = subLayout.cells("b").setText("검교정결과");
	gridDtl = subLayout.cells("b").attachGrid();
    gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //10
    gridDtl.setHeader("No,장비코드,장비명,규격,용도,교정항목,교정주기,교정기간,검교정기간,교정비용,검교정결과");
    gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
    gridDtl.setColAlign("center,left,left,left,left,center,center,center,center,center,center");
    gridDtl.setColTypes("edn,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed");
    gridDtl.setColSorting("int,str,str,str,str,str,str,str,str,str,str");
    gridDtl.init();
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"}]);
	 calMain.loadUserLanguage("ko");
	 calMain.hideTime();
		var t = dateformat(new Date());
		byId("stDate").value = t;

})

</script>

<div id="container"
	style="position: relative; width: 100%; height: 100%;">
	</div>
<div id="bootContainer2">
        <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input type="button" id="calpicker1" class="calicon form-control">
                                </div>
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
	</form>
	</div>
</div>