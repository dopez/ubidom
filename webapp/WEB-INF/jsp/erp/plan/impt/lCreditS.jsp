<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 8, 9], "1C"); //L/C등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");
                layout.cells("b").setHeight(344);


                //grid	
                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("제비용");
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //28
                gridMain.setHeader("No,비용코드,비목,금액", null, []);
                gridMain.setInitWidths("100,100,100,100");
                gridMain.setColAlign("center,left,left,right");
                gridMain.setColTypes("ron,ed,ed,edn");
                gridMain.setColSorting("str,str,str,int");
                gridMain.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "opDate",
                    button: "calpicker1"
                }, {
                    input: "exDate",
                    button: "calpicker2"
                }, {
                    input: "blDate",
                    button: "calpicker3"
                }, {
                    input: "pmtDate",
                    button: "calpicker4"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();


            })
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px;padding-bottom: 5px; margin: 0px;" id="frmMain">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    L/C No
                                </label>
                                <div class="col-sm-7 col-md-7">
                                    <input name="LCNo" id="LCNo" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    L/C종류
                                </label>
                                <div class="col-sm-3 col-md-3">
                                    <div class="col-sm-9 col-md-9">
                                        <input name="LCKind" id="LCKind" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="fn_search()">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    개설은행
                                </label>
                                <div class="col-sm-3 col-md-3">
                                    <div class="col-sm-9 col-md-9">
                                        <input name="openBank" id="openBank" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="fn_search()">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    금액
                                </label>
                                <div class="col-sm-3 col-md-3">
                                    <input name="amount" id="amount" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 통화단위 </label>
                                <div class="col-sm-2 col-md-2">
                                    <select class="form-control input-xs">
                                        <option>KRW</option>
                                        <option>JPY</option>
                                        <option>USD</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> Open Date </label>
                                <div class="col-sm-3 col-md-3">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="opDate" id="opDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                     <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> Expiry Date </label>
                                <div class="col-sm-3 col-md-3">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="exDate" id="exDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                       <input type="button" id="calpicker2" class="calicon form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    보험여부
                                </label>
                                <div class="col-sm-3 col-md-3">
                                    <input name="insrncState" id="insrncState" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> B/L 도착일자 </label>
                                <div class="col-sm-3 col-md-3">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="blDate" id="blDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker3" class="calicon form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 결제일자 </label>
                                <div class="col-sm-3 col-md-3">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="pmtDate" id="pmtDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <input type="button" id="calpicker4" class="calicon form-control">
						     </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    비고
                                </label>
                                <div class="col-sm-7 col-md-7">
                                    <input name="insrncState" id="insrncState" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>