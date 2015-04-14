<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 8, 9], "1C"); //업무일지조회(전체)

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //7
                gridMain.setHeader("No,담당,일자,종류,관리번호,내용,첨부", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                gridMain.setInitWidths("50,100,100,100,150,400,50");
                gridMain.setColAlign("center,center,center,center,left,left,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str");
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

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    기간 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="input-group date" id="date1">
                                            <div class="col-sm-10 col-md-10">
                                                <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                            </div>
                                            <div class="col-sm-2 col-md-2">
                                                <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                            </div>
                                        </div>
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="input-group date" id="date2">
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
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 조회자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 종류 </label>
                                <div class="col-sm-5 col-md-5">
                                    <div class="col-xs-3 col-sm-3 col-md-3">
                                        <input type="radio" name="dairyGbn" value="1" checked="checked">개발
                                    </div>
                                    <div class="col-xs-3 col-sm-3 col-md-3">
                                        <input type="radio" name="dairyGbn" value="2">개선
                                    </div>
                                    <div class="col-xs-3 col-sm-3 col-md-3">
                                        <input type="radio" name="dairyGbn" value="3">일반
                                    </div>
                                    <div class="col-xs-3 col-sm-3 col-md-3">
                                        <input type="radio" name="dairyGbn" value="4">전체
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>