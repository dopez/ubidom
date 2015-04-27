<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
        var gridMst,girdDtl;
        $(document).ready(function(){
        	Ubi.setContainer(2, [1, 2, 3, 4, 5, 6], "2E"); //시험결과등록

        	layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();
        	
        	

                //form//
                layout.cells("b").attachObject("bootContainer2");
                

                //grid	
                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("시험대기내역");
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //15
                gridMst.setHeader("No,시험담당자,결과통보일자,의뢰일자,회사,소속,성명,장비,위치,약품,시료명,시료수량,시료처리,요구사항,선택");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,left,left,center,left,center,center,center,right,center,center,center");
                gridMst.setColTypes("ron,ed,dhxCalendar,dhxCalendar,ed,ed,ed,ed,ed,ed,ed,edn,ed,ed,ra");
                gridMst.setColSorting("int,str,date,date,str,str,str,str,str,str,str,int,str,str,str");
                gridMst.init();

                subLayout.cells("b").showHeader();
                subLayout.cells("b").setText("시험결과");
                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //7
                gridDtl.setHeader("No,의뢰번호,시료,수량,시험항목,결과,비고");
                gridDtl.setInitWidths("100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,center,center,center");
                gridDtl.setColTypes("ron,ed,ed,edn,ed,ch,txt");
                gridDtl.setColSorting("int,str,str,int,str,str,str");
                gridDtl.init();
                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; ">
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
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">등록자</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>