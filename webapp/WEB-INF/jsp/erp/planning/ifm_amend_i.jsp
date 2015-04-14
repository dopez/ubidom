<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(1, [1, 2, 3, 4], "3E"); //amend 등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");



                //up

                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("L/C 내용");
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //11 col
                gridMst.setHeader("L/C No,L/C 종류,개설은행,Open Date,Expiry Date,보험여부,B/L 도착일자,결재일자,비고,선택", null, []);
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,left,center,center,center,center,center,center");
                gridMst.setColTypes("ron,ed,ed,dhxCalendar,dhxCalendar,ed,dhxCalendar,dhxCalendar,ed,ra");
                gridMst.setColSorting("int,str,str,date,date,str,date,date,str,str");
                gridMst.init();

                //down
                subLayout.cells("b").showHeader();
                subLayout.cells("b").setText("amend 내용");

                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9col
                gridDtl.setHeader("No,내용", null, []);
                gridDtl.setInitWidths("50,950");
                gridDtl.setColAlign("center,left");
                gridDtl.setColTypes("ron,txt");
                gridDtl.setColSorting("int,str");
                gridDtl.init();

                subLayout.cells("c").attachObject("amendCharge");
                subLayout.cells("c").setHeight(50);
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
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px;padding-bottom: 5px; margin: 0px;" id="frmMain">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> Date </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="input-group date" id="date">
                                        <div class="col-sm-10 col-md-10">
                                            <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                           <input type="button" id="calpicker1" class="calicon form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1 col-md-1">
                                    <div class="col-sm-offset-2 col-md-offset-2 col-sm-10 col-md-10">
                                        <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 등록자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="regName" id="regName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div> -->
                </form>
            </div>
        </div>
        <div id="amendCharge">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px;padding-bottom: 5px; margin: 0px;" id="frmMain02">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> Amend Charge </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="amdCharge" id="amdCharge" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>