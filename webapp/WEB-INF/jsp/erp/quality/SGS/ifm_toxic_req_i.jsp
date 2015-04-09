<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            var calStDate;
            $(document).ready(function() {

                ubi.init(2, [1, 2, 3, 4, 5, 6], "2E"); //유해물질의뢰등록

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");


                //grid	
                o.slayout.cells("a").showHeader();
                o.slayout.cells("a").setText("SGS 의뢰대상내역");
                gridMst = o.slayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //
                gridMst.setHeader("No,시험종류,시료명,시험주기,최종시험일자,시험예정일자,선택");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,center,center,center,center");
                gridMst.setColTypes("ron,coro,ed,ed,ed,dhxCalendar,dhxCalendar,ch");
                gridMst.setColSorting("int,str,str,str,str,date,date,str");
                gridMst.init();

                o.slayout.cells("b").showHeader();
                o.slayout.cells("b").setText("SGS 의뢰내역");
                gridDtl = o.slayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //7
                gridDtl.setHeader("No,시험종류,시료명,시험주기,최종시험일자,시험예정일자,의뢰기간,의뢰금액");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,center,center,center,center,center,right");
                gridDtl.setColTypes("ron,coro,ed,ed,ed,dhxCalendar,dhxCalendar,dhxCalendar,edn");
                gridDtl.setColSorting("int,str,str,str,str,date,date,str,date,int");
                gridDtl.init();
                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "setDate",
                    button: "calpicker"
                }, {
                    input: "stDate",
                    button: "calpicker1"
                }, {
                    input: "edDate",
                    button: "calpicker2"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("setDate").value = t;
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
                            <div class="col-sm-5 col-md-5">
                                <div class="col-sm-5 col-md-5">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="setDate" id="setDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span> <img id="calpicker"
											style="margin-top: 1px; width: 27px; height: 27px;"
											class="calicon"
											src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
										</span>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                        <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                기간 </label>
                            <div class="col-sm-5 col-md-5">
                                <div class="col-sm-5 col-md-5">
                                    <div class="col-sm-10 col-md-10">
                                        <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span> <img id="calpicker1" class="calicon" style="margin-top: 1px; width: 27px; height: 27px;"
									src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
									onclick="setSens(1,'edDate', 'max')">
								</span>
                                    </div>
                                </div>
                                <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                <div class="col-sm-5 col-md-5">

                                    <div class="col-sm-10 col-md-10">
                                        <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span> <img id="calpicker2" class="calicon" style="margin-top: 1px; width: 27px; height: 27px;"
									src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
									onclick="setSens(1,'stDate', 'min')">
								</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>