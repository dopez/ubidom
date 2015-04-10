<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                ubi.init(2, [1, 2, 3, 4, 5, 6], "1C"); //업무일지등록

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = o.slayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //5
                gridMain.setHeader("No,고객,종류,내용,첨부");
                gridMain.setInitWidths("100,100,100,100,100");
                gridMain.setColAlign("center,left,center,left,center");
                gridMain.setColTypes("ron,ed,coro,txt,ed");
                gridMain.setColSorting("int,str,str,str,str");
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
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="input-group date" id="date">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker1" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
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
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
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
            </form>
        </div>