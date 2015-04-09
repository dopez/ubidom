<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                ubi.init(2, [1, 2, 3, 4], "3E"); //BOM등록

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");

                //form02//
                o.slayout.cells("b").attachObject("bootContainer3");
                o.slayout.cells("b").setHeight(80);

                //up


                gridMst = o.slayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                gridMst.setHeader("계정번호,계정일자,사유", null, ["text-align:center;", "text-align:center;", "text-align:center;"]);

                gridMst.setInitWidths("100,100,780");
                gridMst.setColAlign("center,center,left");
                gridMst.setColTypes("ro,ro,ro");
                gridMst.setColSorting("str,str,str");
                gridMst.init();

                //down
                gridDtl = o.slayout.cells("c").attachGrid();
                o.slayout.cells("c").showHeader();
                o.slayout.cells("c").setText("BOM");
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/");

                gridDtl.setHeader("순번,공정,자재코드,자재명,소요량,Loss율", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);

                gridDtl.setInitWidths("50,200,200,400,100,100");
                gridDtl.setColAlign("center,left,left,left,right,right");
                gridDtl.setColTypes("ro,coro,ro,ro,ro,ed");
                gridDtl.setColSorting("str,str,str,str,str,str");
                gridDtl.init();

                //set date//
                calMain = new dhtmlXCalendarObject([{
                    input: "regDate",
                    button: "calpicker2"
                }, {
                    input: "appvlDate",
                    button: "calpicker3"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("regDate").value = t;
            })
        </script>
        <style>

        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>

        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                제품코드 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                개정번호 </label>
                            <div class="col-sm-1 col-md-1">
                                <input name="gjCode" id="gjCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput">
                                개정사유 </label>
                            <div class="col-sm-8 col-md-8">
                                <input name="gjCause" id="gjCause" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div id="bootContainer3">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain02">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-8">
                            <label class="col-sm-1 col-md-1 control-label" for="textinput">
                                작성자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="regEmpName" id="regEmpName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput">
                                작성일자 </label>
                            <div class="col-sm-2 col-md-2">

                                <div class="col-sm-10 col-md-10">
                                    <input name="regDate" id="regDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <span>
						       <img id="calpicker2" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                </div>

                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput">
                                승인자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="appvlName" id="appvlName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput">
                                승인일자 </label>
                            <div class="col-sm-2 col-md-2">


                                <div class="col-sm-10 col-md-10">
                                    <input name="appvlDate" id="appvlDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <span> <img id="calpicker3"
										style="margin-top: 1px; width: 27px; height: 27px;"
										class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif"
										border="0">
									</span>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-8">
                            <label class="col-sm-1 col-md-1 control-label" for="textinput">
                                기준중량 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="rpWeight" id="rpWeight" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput">
                                가감기준량 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="adjQty" id="adjQty" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput">
                                종료일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="endDate" id="endDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>