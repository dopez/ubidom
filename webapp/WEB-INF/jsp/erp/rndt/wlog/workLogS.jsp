<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(4, [1, 2, 3, 4, 5, 6], "1C"); //업무일지등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //6
                gridMain.setHeader("No,내용,첨부", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                gridMain.setInitWidths("50,800,50");
                gridMain.setColAlign("center,left,center");
                gridMain.setColTypes("ro,txt,ed");
                gridMain.setColSorting("str,str,str");
                gridMain.init();

                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-3 col-md-2 control-label" for="textinput"> 일자 </label>
                                <div class="col-sm-2 col-md-2">

                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <input type="button" id="calpicker1" class="calicon form-control">
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
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-3 col-md-2 control-label" for="textinput"> 담당 </label>
                                <div class="col-sm-1 col-md-1">
                                    <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                        <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-3 col-md-2 control-label" for="textinput"> 종류 </label>
                                <div class="col-sm-4 col-md-4">
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <input type="radio" name="dairyGbn" value="1" checked="checked">개발
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <input type="radio" name="dairyGbn" value="2">개선
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <input type="radio" name="dairyGbn" value="3">일반
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-3 col-md-2 control-label" for="textinput"> 관리번호 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="mngNo" id="mngNo" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('관리번호','common/manageNumPOP')">
                                </div>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                        <input name="pjtName" id="pjtName" type="text" value="" placeholder="과제명" class="form-control input-xs">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>