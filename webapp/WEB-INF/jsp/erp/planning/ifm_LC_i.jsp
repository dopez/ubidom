<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                ubi.init(3, [1, 8, 9], "1C"); //L/C등록

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");
                o.layout.cells("b").setHeight(344);
                

                //grid	
				o.slayout.cells("a").showHeader();
				o.slayout.cells("a").setText("제비용");
                gridMain = o.slayout.cells("a").attachGrid();
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
                },{
                    input: "blDate",
                    button: "calpicker3"
                },{
                    input: "pmtDate",
                    button: "calpicker4"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                
                
            })
        </script>
        <style>
            .calicon {
                width: 32px;
                height: 28px;
            }
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
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
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                L/C종류
                            </label>
                            <div class="col-sm-3 col-md-3">
                                <div class="col-sm-10 col-md-10">
                                    <input name="LCKind" id="LCKind" type="text" value="" placeholder="" class="form-control input-xs">
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
                                개설은행
                            </label>
                            <div class="col-sm-3 col-md-3">
                                <div class="col-sm-10 col-md-10">
                                    <input name="openBank" id="openBank" type="text" value="" placeholder="" class="form-control input-xs">
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
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> Open Date </label>
					<div class="col-sm-3 col-md-3">
							<div class="col-sm-11 col-md-11">
								<input name="opDate" id="opDate" type="text"
									value="" placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-1 col-md-1">
								<span>
						       <img id="calpicker1" style="margin-top:1px;width:24px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
							</div>
					</div>
				</div>
			</div>
		</div>
                <div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> Expiry Date </label>
					<div class="col-sm-3 col-md-3">
							<div class="col-sm-11 col-md-11">
								<input name="exDate" id="exDate" type="text"
									value="" placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-1 col-md-1">
								<span>
						       <img id="calpicker2" style="margin-top:1px;width:24px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
							</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
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
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> B/L 도착일자 </label>
					<div class="col-sm-3 col-md-3">
							<div class="col-sm-11 col-md-11">
								<input name="blDate" id="blDate" type="text"
									value="" placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-1 col-md-1">
								<span>
						       <img id="calpicker3" style="margin-top:1px;width:24px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
							</div>
					</div>
				</div>
			</div>
		</div>
<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 결제일자 </label>
					<div class="col-sm-3 col-md-3">
							<div class="col-sm-11 col-md-11">
								<input name="pmtDate" id="pmtDate" type="text"
									value="" placeholder="" class="form-control input-xs">
							</div>
							<div class="col-sm-1 col-md-1">
								<span>
						       <img id="calpicker4" style="margin-top:1px;width:24px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
							</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
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