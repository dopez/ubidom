<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            var calStDate;
            $(document).ready(function() {

                ubi.init(4, [1, 2, 3, 4], "2E"); //Invoice/Packing List 등록

                o = ubi.getDataSet();
                //form//
                o.layout.cells("b").attachObject("bootContainer2");
				o.layout.cells("b").setHeight(240);
                

                //grid	
                o.slayout.cells("a").showHeader();
                o.slayout.cells("a").setText("수주내역");
                gridMst = o.slayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); 
                gridMst.setHeader("No,수주번호,고객PO No,품목코드,품명,포장,단위,통화단위,단가,수량,금액,결제조건,인도조건,선적항,도착항,납기일자,선택");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,left,left,left,left,center,center,center,right,right,right,center,center,center,center,center,center");
                gridMst.setColTypes("ron,ed,ed,ed,ed,ed,ed,ed,edn,edn,edn,ed,ed,ed,ed,dhxCalendar,ch");
                gridMst.setColSorting("int,str,str,str,str,str,str,str,int,int,int,str,str,str,str,date,str");
                gridMst.init();

                o.slayout.cells("b").showHeader();
                o.slayout.cells("b").setText("Invoice/Packing List 내역");
                gridDtl = o.slayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //16
                gridDtl.setHeader("No,인쇄,In No,품목코드,품명,단위,통화단위,단가,수량,금액,중량,CBM,결제조건,인도조건,선적항,도착항");
                gridDtl.attachFooter("&nbsp;,#cspan,합계,#cspan,#cspan,#cspan,#cspan,0,0,0,0");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,left,left,center,center,right,right,right,right,center,center,center,center,center");
                gridDtl.setColTypes("ron,ch,ro,ro,ro,ro,ro,ron,ron,ron,ron,ro,ro,ro,ro,ro");
                gridDtl.setColSorting("int,str,str,str,str,str,str,int,int,int,int,str,str,str,str,str");
                gridDtl.init();
                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                },{
                	input:"shipDate",
                	button:"calpicker2"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <span> <img id="calpicker1"
								style="margin-top: 1px; width: 27px; height: 27px;"
								class="calicon"
								src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
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
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">담당</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">고객</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">운송회사</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">선박회사</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                선적일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="shipDate" id="shipDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <span> <img id="calpicker2"
								style="margin-top: 1px; width: 27px; height: 27px;"
								class="calicon"
								src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
							</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">Remarks</label>
                            <div class="col-sm-10 col-md-10">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>