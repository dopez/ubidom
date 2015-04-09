<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            var calStDate
            $(document)
                .ready(
                    function() {

                        ubi.init(0, [1, 2, 3, 4, 5, 6], "1C"); //진공증착기준등록

                        o = ubi.getDataSet();

                        //마지막 C셀을 죽이고 b 셀에 새로운 레이아웃 추가//
                        var differentLayout = o.layout.cells("b").attachLayout("2U");
                        o.slayout.cells("a").setHeight(0);
                        differentLayout.cells("a").setWidth(253);
                        differentLayout.cells("a").hideHeader();
                        differentLayout.cells("b").hideHeader();

                        //left grid//
                        gridMst = differentLayout.cells("a").attachGrid();
                        gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                        gridMst.setHeader("설비코드, 설비명", null, [
                            "text-align:center;", "text-align:center;"
                        ]);

                        gridMst.setInitWidths("100,150");
                        gridMst.setColAlign("left,left");
                        gridMst.setColTypes("ro,ro");
                        gridMst.setColSorting("str,str");
                        gridMst.init();

                        //right form & grid//
                        var rightLayout = differentLayout.cells("b").attachLayout("2E");
                        rightLayout.cells("a").hideHeader();
                        rightLayout.cells("a").attachObject("bootContainer2");
                        rightLayout.cells("a").setHeight(114);

                        rightLayout.cells("b").setText("증착조건");
                        gridDtl = rightLayout.cells("b").attachGrid();
                        gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                        gridDtl.setHeader("No,모재,약품명,온도,진공도,에칭,어시스트,두께,Rate,에칭,방식", null, []);
                        gridDtl.setInitWidths("50,100,150,50,100,100,150,100,100,100,100");
                        gridDtl.setColAlign("center,left,left,center,center,right,right,right,right,right,right");
                        gridDtl.setColTypes("ro,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed");
                        gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
                        gridDtl.init();

                        //set date//
                        calStDate = new dhtmlXCalendarObject([{
                            input: "applyDate",
                            button: "calpicker1"
                        }]);
                        calStDate.loadUserLanguage("ko");
                        calStDate.hideTime();
                        var t = dateformat(new Date());
                        byId("applyDate").value = t;
                    })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput"> 적용일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="input-group date" id="date">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="applyDate" id="applyDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <div class="input-group date" id="date">

                                            <span> <img id="calpicker1"
											style="margin-top: 1px; width: 27px; height: 27px;"
											class="calicon"
											src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
										</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput"> 설비코드 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                설비명 </label>
                            <div class="col-sm-10 col-md-8">
                                <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>