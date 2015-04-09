<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            var calMain;
            $(document).ready(function() {

                ubi.init(2, [1, 2, 3, 4, 5, 6], "3E"); //PURCHASE ORDER 등록

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");

                //grid	
                o.slayout.cells("a").showHeader();
                o.slayout.cells("a").setText("발주품의내용");
                gridMst = o.slayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //5
                gridMst.setHeader("No,Seller,Current Unit,Amount,선택", null, []);
                gridMst.setInitWidths("50,100,100,100,100");
                gridMst.setColAlign("center,left,left,right,center");
                gridMst.setColTypes("ron,ed,ed,edn,ra");
                gridMst.setColSorting("str,str,str,int,str");
                gridMst.init();

                //grid2
                o.slayout.cells("b").showHeader();
                o.slayout.cells("b").setText("Commodity And Description");
                gridDtl = o.slayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9
                gridDtl.setHeader("Commodity,Unit,P/U,Current Unit,Unit Price,Order Qty,Amount,결재구분,Remark", null, []);
                gridDtl.attachFooter("&nbsp;,Total,#cspan,#cspan,0,0,0,&nbsp;,#cspan", null, []);
                gridDtl.setInitWidths("50,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,left,center,left,right,right,right,center,center");
                gridDtl.setColTypes("ed,ed,ed,ed,edn,edn,edn,ed,ed");
                gridDtl.setColSorting("str,str,str,str,int,int,int,str,str");
                gridDtl.init();

                //form2
                o.slayout.cells("c").attachObject("commdtDesc");

                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }, {
                    input: "shipDate1",
                    button: "calpicker2"
                }, {
                    input: "shipDate2",
                    button: "calpicker3"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;

            })
        </script>
        <style>

        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> Date </label>
                            <div class="col-sm-2 col-md-2">
                                
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker1" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
                                
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    <input name="dontNo" id="dontNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    <select class="form-control input-xs">
                                        <option>V</option>
                                        <option>A</option>
                                        <option>E</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Seller </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="sellerName" id="sellerName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div id="commdtDesc" style="position: relative; width: 100%; height: 100%; padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px; overflow: auto;">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain02">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Price Term </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="prcT" id="prcT" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Shipment </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="Shipment" id="Shipment" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Shipping Date(ETD) </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="input-group date" id="date">
                                    <div class="col-sm-9 col-md-9">
                                        <input name="shipDate1" id="shipDate1" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <span>
						       <img id="calpicker2" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
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
                                Container </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="Container" id="Container" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Shipping Date(ETD) </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="input-group date" id="date">
                                    <div class="col-sm-9 col-md-9">
                                        <input name="shipDate2" id="shipDate2" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <span>
						       <img id="calpicker3" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
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
                                Partial Shipment </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="pShip" id="pShip" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Transshipment </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="tShip" id="tShip" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Payment </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>payment1</option>
                                    <option>payment2</option>
                                    <option>payment3</option>
                                </select>
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Packing </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="pck" id="pck" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Origin </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>korea</option>
                                    <option>japan</option>
                                    <option>US</option>
                                </select>
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Insurance </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="isrnc" id="isrnc" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Shipping Company or Forwarder </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="SCorF" id="SCorF" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                Special Conditions </label>
                            <div class="col-sm-6 col-md-6">
                                <input name="SC1" id="SC1" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <div class="col-sm-offset-2 col-md-offset-2 col-sm-6 col-md-6">
                                <input name="SC2" id="SC2" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">

                            <div class="col-sm-offset-2 col-md-offset-2 col-sm-6 col-md-6">
                                <input name="SC3" id="SC3" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>