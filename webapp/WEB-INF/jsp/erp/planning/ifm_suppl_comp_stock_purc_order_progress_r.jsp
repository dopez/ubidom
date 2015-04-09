<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                ubi.init(3, [1, 8, 9], "1C"); //공급사별 재고 및 P/O 진행현황

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");

                //grid	

                gridMain = o.slayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //28
                gridMain.setHeader("공급사,품목코드,품명,단위,출고실적,#cspan,#cspan,예상출고,#cspan,재고,#cspan,과부족,#cspan,통관대기,#cspan,#cspan,#cspan,#cspan,#cspan,미선적현황,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,합계", null, []);
                gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,3개월전,1개월전,당월,차월,차차월,수량,사용일수,수량,일수,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,소계,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,&nbsp;,소계,#rspan", []);
                gridMain.setInitWidths("50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50");
                gridMain.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str");
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
        <style>
.calicon{
width: 27px;
height: 27px;
margin-top: 1px;
}
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						기간 </label>

					<div class="col-sm-6 col-md-6">
						<div class="col-sm-4 col-md-4">
							<div class="input-group date" id="date1">
								<div class="col-sm-10 col-md-10">
									<input type="text" class="form-control input-xs" name="stDate"
										id="stDate" value="">
								</div>
								<div class="col-sm-2 col-md-2">
									<span> <img id="calpicker1" class="calicon"
										src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
										onclick="setSens(1,'edDate', 'max')">
									</span>
								</div>
							</div>
						</div>
						<label class="col-sm-1 col-md-1 control-label" for="textinput"
							style="margin-right: 15px;">~</label>
						<div class="col-sm-4 col-md-4">
							<div class="input-group date" id="date2">
								<div class="col-sm-10 col-md-10">
									<input type="text" class="form-control input-xs" name="edDate"
										id="edDate" value="">
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
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                공급사
                            </label>
                            <div class="col-sm-3 col-md-3">
                                <div class="col-sm-10 col-md-10">
                                    <input name="suplCompName" id="suplCompName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
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
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                품목
                            </label>
                            <div class="col-sm-3 col-md-3">
                                <div class="col-sm-10 col-md-10">
                                    <input name="itemName" id="itemName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <button type="button" class="btn btn-default form-control" name="btnSearch" id="btnSearch" onclick="fn_search()">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>