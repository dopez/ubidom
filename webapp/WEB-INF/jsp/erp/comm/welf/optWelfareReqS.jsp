<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(1, [1, 2, 3, 4], "1C"); //시험검사의뢰등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");
                layout.cells("b").setHeight(500);
                subLayout.cells("a").setHeight(0);

                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                /* byId("edDate").value = t; */

            })
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                                <div class="col-sm-2 col-md-2">

                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                       <input type="button" id="calpicker1" class="calicon form-control">
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
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 신청자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqName" id="reqName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 사용가능포인트 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqName" id="reqName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 신청포인트 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqName" id="reqName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 신청항목 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqName" id="reqName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 관련증빙 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqName" id="reqName" type="file" value="" placeholder="" class="">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>