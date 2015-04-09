<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                ubi.init(2, [1, 8, 9], "1C"); //조치조회

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = o.slayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //11
                gridMain.setHeader("No,접수일자,조치일자,고객,장비,모재,약품,접수상태,코팅,시험의뢰,조치내용");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,left,left,center,center,center,center,center,left");
                gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ra,ra,ro");
                gridMain.setColSorting("int,str,str,str,str,str,str,str,str,str,str,str");
                gridMain.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }, {
                    input: "edDate",
                    button: "calpicker2"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
            })
        </script>
        <style>
            .calicon {
                width: 27px;
                height: 27px;
                margin-top:1px;
            }
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 기간 </label>
                            <div class="col-sm-5 col-md-5">
                                <div class="col-sm-5 col-md-5">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <span> <img id="calpicker1" class="calicon"
												src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
												onclick="setSens(1,'edDate', 'max')" >
											</span>
                                        </div>
                                </div>
                                <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                <div class="col-sm-5 col-md-5">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <span> <img id="calpicker2" class="calicon"
												src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
												onclick="setSens(1,'stDate', 'min')">
											</span>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 고객 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>