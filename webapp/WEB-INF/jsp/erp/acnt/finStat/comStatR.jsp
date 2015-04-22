<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var t = new Date().getFullYear();
            var m = +new Date().getMonth() + 1;
            $(document).ready(function() {
                Ubi.setContainer(2, [1, 8, 9], "1C");
                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();
                //      제조원가명세서
                layout.cells("b").attachObject("bootContainer");

                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //6
                gridMain.setHeader("No,계정,당기,#cspan,전기,#cspan");
                gridMain.attachHeader("#rspan,#rspan,,,,");
                gridMain.attachFooter(",계,0,0,0,0");
                gridMain.setInitWidths("100,100,100,100,100,100");
                gridMain.setColAlign("center,center,right,right,right,right");
                gridMain.setColTypes("ron,ro,ron,ron,ron,ron");
                gridMain.setColSorting("int,str,int,int,int,int");
                gridMain.init();

                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.setDateFormat("%Y/%m");
                calMain.hideTime();
                byId("stDate").value = t + "/" + m;

                $("#forHide02").hide();
            });

            function calYearAdder(n) {
                if (n == 1) {
                    if (m > 11) {
                        m = 1;
                        t = t + 1
                        byId("stDate").value = t + "/" + m;
                    } else {
                        m++;
                        byId("stDate").value = t + "/" + m;
                    }
                } else {
                    if (m < 2) {
                        m = 12;
                        t = t - 1
                        byId("stDate").value = t + "/" + m;
                    } else {
                        m--;
                        byId("stDate").value = t + "/" + m;
                    }
                }
            }

            function rdo_onclick() {
                if (rdoAll.checked) {
                    $("#forHide01").hide();
                    $("#forHide02").show();
                } else {
                    $("#forHide02").hide();
                    $("#forHide01").show();
                }
            }
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;"></div>
        <div id="bootContainer">
            <div class="container">
                <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="form-group form-group-sm">
                                <div id="forHide01">
                                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                        결산월 </label>
                                    <div class="col-sm-2 col-md-2">
                                        <div class="col-sm-6 col-md-6">
                                            <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                        </div>
                                        <div class="col-sm-3 col-md-3">
                                            <input type="button" id="" class="form-control btn btn-default btn-xs" value="▲" onclick="calYearAdder(1)">
                                        </div>
                                        <div class="col-sm-3 col-md-3">
                                            <input type="button" id="" class="form-control btn btn-default btn-xs" value="▼" onclick="calYearAdder(2)">
                                        </div>
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                            <input type="button" id="" class="form-control btn btn-default btn-xs" value="확&nbsp;정" onclick="">
                                        </div>
                                    </div>
                                </div>
                                <div id="forHide02">
                                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                        기간 </label>
                                    <div class="col-sm-6 col-md-6">
                                        <div class="col-sm-4 col-md-4">
                                            <div class="col-sm-10 col-md-10">
                                                <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                            </div>
                                            <div class="col-sm-2 col-md-2">
                                                <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                            </div>
                                        </div>
                                        <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="col-sm-10 col-md-10">
                                                <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                            </div>
                                            <div class="col-sm-2 col-md-2">
                                                <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    구분 </label>
                                <div class="col-sm-10 col-md-10">
                                    <input name="gbn" id="rdoMonth" type="radio" value="1" placeholder="" class="" onclick="rdo_onclick()" checked="checked">당월
                                    <input name="gbn" id="rdoAll" type="radio" value="2" placeholder="" class="" onclick="rdo_onclick()">누계
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>