<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            var calStDate;
            $(document).ready(function() {

                ubi.init(2, [1, 2, 3, 4, 5, 6], "2E"); //시험데이터등록1

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");
                

                //grid	
                o.slayout.cells("a").showHeader();
                o.slayout.cells("a").setText("시험대기내역");
                gridMst = o.slayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //15
                gridMst.setHeader("No,시험담당자,결과통보일자,의뢰일자,회사,소속,성명,장비,위치,약품,시료명,시료수량,시료처리,요구사항,선택");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,left,left,center,left,center,center,center,right,center,center,center");
                gridMst.setColTypes("ron,ed,dhxCalendar,dhxCalendar,ed,ed,ed,ed,ed,ed,ed,edn,ed,ed,ra");
                gridMst.setColSorting("int,str,date,date,str,str,str,str,str,str,str,int,str,str,str");
                gridMst.init();

                o.slayout.cells("b").showHeader();
                o.slayout.cells("b").setText("시험결과 데이터");
                gridDtl = o.slayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //22
                gridDtl.setHeader("No,의뢰번호,시료,위치,초기접촉각,#cspan,#cspan,#cspan,#cspan,#cspan,시험방법,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,변화도,온도,습도,시험장비,비고");
                gridDtl.attachHeader("#rspan,#rspan,#rspan,#rspan,1P,2P,3P,4P,5P,평균,1P,2P,3P,4P,5P,6P,최소값,#rspan,#rspan,#rspan,#rspan,#rspan");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center");
                gridDtl.setColTypes("ron,ed,ed,ed,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,ed,txt");
                gridDtl.setColSorting("int,str,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,str,str");
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
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <span> <img id="calpicker1"
								style="margin-top: 1px; width: 27px; height: 27px;"
								class="calicon"
								src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
							</span>
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
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">등록자</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>