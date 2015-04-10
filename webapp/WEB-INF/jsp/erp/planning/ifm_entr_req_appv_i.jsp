<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

                ubi.init(2,[1,4,8,9], "2E"); //출입신청결재

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");



                //up

				o.slayout.cells("a").showHeader();
				o.slayout.cells("a").setText("결제내역");
                gridMst = o.slayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //7 col
                gridMst.setHeader("작성일자,작성자,출입자 정보,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,결재,#cspan,#cspan,#cspan" ,null,[]);
                gridMst.attachHeader("#rspan,#rspan,성명,직위,소속,시작일자,종료일자,기간,신청사유,작성,검토,검토,승인" ,[]);
                
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center");
                gridMst.setColTypes("dhxCalendar,ed,ed,ed,ed,dhxCalendar,dhxCalendar,dhxCalendar,ed,ed,ch,ch,ch");
                gridMst.init();

                //down
  				o.slayout.cells("b").showHeader();
				o.slayout.cells("b").setText("출입지역신청");

                gridDtl = o.slayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9col
                gridDtl.setHeader("등급,지역,신청,지역,신청,지역,신청,지역,신청", null, []);
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,center,center,center,center,center");
                gridDtl.setColTypes("ron,ed,ra,ed,ra,ed,ra,ed,ra");
                gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str");
                gridDtl.init();

                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;

            })

        </script>
        <style>

        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                            <div class="col-sm-2 col-md-2">
                                
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker1" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
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
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 결재자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="appvName" id="appvName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>