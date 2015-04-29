<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(2, [2, 3, 4, 5, 6], "1C"); //일반품의등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");
                layout.cells("b").setHeight(175);

                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("품의내용");
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //10 col
                gridMain.setHeader("No,내용", null, []);
                gridMain.setInitWidths("100,880");
                gridMain.setColAlign("center,left");
                gridMain.setColTypes("ro,txt");
                gridMain.setColSorting("str,str");
                gridMain.init();

              //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "setDate",
                    button: "calpicker1"
                }, {
                    input: "stDate",
                    button: "calpicker2"
                }, {
                    input: "edDate",
                    button: "calpicker3"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("setDate").value = t;
                byId("stDate").value = t;
                byId("edDate").value = t;
                
                //결재 항목
                gfn_appv_table_append();
            })
        </script>
        <div id="container" style="position: relative; widtd: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                        일자 </label>
                                    <div class="col-sm-2 col-md-2">
                                        <div class="col-sm-10 col-md-10">
                                            <input name="setDate" id="setDate" type="text" value="" placeholder="" class="form-control input-xs">
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
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                        작성자 </label>
                                    <div class="col-sm-2 col-md-2">
                                        <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                        제목 </label>
                                    <div class="col-sm-6 col-md-6">
	                                    <div class="col-sm-9 col-md-9">
	                                        <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
	                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                        관련부서 </label>
                                    <div class="col-sm-6 col-md-6">
	                                    <div class="col-sm-9 col-md-9">
	                                        <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('관련부서','common/requestPOP')">
	                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group form-group-sm">
                                    <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                        처리기한 </label>
                                    <div class="col-sm-6 col-md-6">
                                        <div class="col-sm-4 col-md-4">
                                            <div class="col-sm-10 col-md-10">
                                                <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                            </div>
                                            <div class="col-sm-2 col-md-2">
                                                <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                            </div>
                                        </div>
                                        <label class="col-sm-1 col-md-1 control-label" for="textinput">~</label>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="col-sm-10 col-md-10">
                                                <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                            </div>
                                            <div class="col-sm-2 col-md-2">
                                                <input type="button" id="calpicker3" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="form-group form-group-sm">
                                <jsp:include page="appvTable.jsp"></jsp:include>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>