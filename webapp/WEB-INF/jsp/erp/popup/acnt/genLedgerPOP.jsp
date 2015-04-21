<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var toolbar;
$(document).ready(function(){
	Ubi.setContainer(1,[1],"1C");
	//전표상세현황조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    layout.cells("b").attachObject("bootContainer");
    girdMain = subLayout.cells("a").attachGrid();
    girdMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //13
    girdMain.setHeader("번호,계정명,세목,차변금액,대변금액,거래처,적요,번호,귀속부서,화폐단위,환율,이율,원가구분,일자,과표,매입구분,매출구분,배서/할인,지급처/은행,전자구분");
    girdMain.attachFooter("&nbsp;,합계,#cspan,0,0");
    girdMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
    girdMain.setColAlign("center,center,center,right,right,left,center,center,center,center,right,right,center,center,center,center,center,center,center,center");
    girdMain.setColTypes("ron,ro,ed,edn,edn,ed,ed,edn,ed,ed,edn,edn,coro,dhxCalendarA,ed,coro,coro,coro,coro,coro");
    girdMain.setColSorting("int,str,str,int,int,str,str,int,str,str,int,int,str,date,str,str,str,str,str,str");
    girdMain.init();
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer">
            <div class="container">
                <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                    <div class="row">
                        <div class="form-group form-group-sm">
                                <label class=" col-xs-1 col-md-1 control-label" for="textinput">
                                    일자 </label>
                                <div class="col-xs-1 col-md-1">
                                    <div class="col-xs-10 col-md-10">
                                        <input name="setDate" id="setDate" type="text" value="" placeholder="" class="form-control input-xs" style="font-size: 8pt;">
                                    </div>
                                    <div class="col-xs-2 col-md-2">
                                        <input type="button" id="calpicker" class="calicon form-control">
                                    </div>
                                </div>
                                <label class=" col-xs-1 col-md-1 control-label" for="textinput">
                                    전표번호</label>
                                <div class="col-xs-1 col-md-1">
                                        <input name="seqNo" id="seqNo" type="text" value="" placeholder="0001" class="form-control input-xs" disabled="disabled">
                                </div>
                                <label class=" col-xs-1 col-md-1 control-label" for="textinput">
                                    전표구분</label>
                                <div class="col-xs-1 col-md-1">
                                    <select class="form-control input-xs">
	                                    <option>대체</option>
	                                    <option>입금</option>
	                                    <option>출금</option>
	                                </select>
                                </div>
                                <label class=" col-xs-1 col-md-1 control-label" for="textinput">
                                    담당자</label>
                                <div class="col-xs-1 col-md-1">
                                        <input name="" id="" type="text" value="" placeholder="2200901" class="form-control input-xs" disabled="disabled">
                                </div>
                                <div class="col-xs-1 col-md-1">
                                        <input name="" id="" type="text" value="" placeholder="홍길동" class="form-control input-xs">
                                </div>
                                <label class=" col-xs-1 col-md-1 control-label" for="textinput">
                                    사업부</label>
                                <div class="col-xs-1 col-md-1">
                                        <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>