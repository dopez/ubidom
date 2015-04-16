<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 2, 3, 4, 5, 6], "1C"); //시험검사의뢰등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();


                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //16
                gridMain.setHeader("No,완료일자,설비,위치,약품,시료명,시료수량,시료처리,결과공유,시험종류 및 시험수량,#cspan,#cspan,#cspan,요구사항,목적/용도,시료특이사항", null, []);
                gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,종류,항목,세부내역,시험수량,#rspan,#rspan,#rspan");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,left,left,left,right,right,right,center,center,center,center,center,center,right,center,center");
                gridMain.setColTypes("ro,dhxCalendar,coro,coro,ed,ed,edn,coro,ch,coro,coro,coro,edn,ed,ed,ed");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str");
                gridMain.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                /* byId("edDate").value = t; */

            })
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-4 col-md-2 control-label" for="textinput"> 일자 </label>
                                <div class="col-sm-4 col-md-2">

                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>

                                </div>
                                <div class="col-sm-2 col-md-1">
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
                                <label class=" col-sm-4 col-md-2 control-label" for="textinput"> 의뢰자 </label>
                                <div class="col-sm-4 col-md-2">
                                    <input name="reqName" id="reqName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    의뢰회사 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqComp" id="reqComp" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
	                            <div class="col-sm-3 col-md-3">
	                                <input type="button" id="btnExamShare" name="btnExamShare" value="시험결과공유자등록" class="btn btn-default btn-xs form-control">
	                            </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>