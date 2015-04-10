<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                ubi.init(3, [1, 8, 9], "1C"); //월별고객별출하현황

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");

                //grid	

                gridMain = o.slayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                gridMain.setHeader("No,고객,1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월,합계");
                gridMain.attachFooter("&nbsp,합계,0,0,0,0,0,0,0,0,0,0,0,0,0");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,right,right,right,right,right,right,right,right,right,right,right,right,right");
                gridMain.setColTypes("ron,coro,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron");
                gridMain.setColSorting("int,str,int,int,int,int,int,int,int,int,int,int,int,int,int");
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
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                기간 </label>

                            <div class="col-sm-6 col-md-6">
                                <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <span> <img id="calpicker1" class="calicon"
										src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
										onclick="setSens(1,'edDate', 'max')">
									</span>
                                        </div>
                                </div>
                                <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                <div class="col-sm-4 col-md-4">
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
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                고객 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                            <div class="col-sm-6 col-md-6">
                                <div class="col-xs-4 col-sm-2 col-md-2">
                                    <input type="radio" name="searchGbn" value="1" checked="checked">전체
                                </div>
                                <div class="col-xs-4 col-sm-2 col-md-2">
                                    <input type="radio" name="searchGbn" value="2">내수
                                </div>
                                <div class="col-xs-4 col-sm-2 col-md-2">
                                    <input type="radio" name="searchGbn" value="3">수출
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>