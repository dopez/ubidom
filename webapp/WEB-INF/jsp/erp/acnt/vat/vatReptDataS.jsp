<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(0, [0], "1C");
                //전표상세현황조회
                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                subLayout.cells("a").attachObject("bootContainer2");
                /* subLayout.cells("a").setHeight(0); */

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
                //textarea
                $('.wrap').on('keyup', 'textarea', function(e) {
                    $(this).css('height', 'auto');
                    $(this).height(this.scrollHeight);
                });
                $('.wrap').find('textarea').keyup();

            })
        </script>
        <style>
            .twrap textarea {
                width: 100%;
                resize: none;
                overflow-y: hidden;
                /* prevents scroll bar flash */
                
                padding: 1.1em;
                /* prevents text jump on Enter keypress */
                
                padding-bottom: 0.2em;
                line-height: 1.6;
            }
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="form-group form-group-sm">
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
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="text-align: center;">~</label>
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
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    관할세무서코드 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-2 col-md-2">
                                        <input type="text" class="form-control input-xs" name="" id="" value="">
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput"></label>
                                    <div class="col-sm-6 col-md-6">
                                        <input type="text" class="form-control input-xs" name="" id="" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-sm-offset-2 col-md-offset-2 col-sm-6 col-md-6">
                                    <div class="col-sm-9 col-md-9">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                                                <span class="sr-only">45% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-sm-offset-2 col-md-offset-2 col-sm-6 col-md-6">
                                    <div class="col-sm-9 col-md-9">
                                        <div class="twrap">
                                            <textarea class="input-xs" name="" id=""></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-sm-offset-2 col-md-offset-2 col-sm-6 col-md-6">
                                    <div class="col-sm-9 col-md-9">
                                        <div class="col-sm-6 col-md-6 col-sm-offset-6 col-md-offset-6">
                                            <input type="button" value="생성" id="" name="" class="form-control btn btn-default btn-xs">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>