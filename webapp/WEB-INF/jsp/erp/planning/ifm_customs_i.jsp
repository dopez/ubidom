<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMst, gridDtl;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(1, [1, 2, 3, 4, 5, 6], "3U"); //통관등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();


                //form//
                layout.cells("b").attachObject("bootContainer2");
                subLayout.cells("a").attachObject("frmMainLeft");
                subLayout.cells("a").setHeight(500);
                subLayout.cells("a").setWidth(856);
                //grid	
                rightLayout = subLayout.cells("b").attachLayout("2E");
                rightLayout.cells("a").attachObject("customsDesc");
                rightLayout.cells("a").hideHeader();
                rightLayout.cells("a").setHeight(180);
                rightLayout.cells("b").hideHeader();

                gridMst = rightLayout.cells("b").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9
                gridMst.setHeader("PO No,비용항목,거래처,발생일자,금액,부가세 구분,부가세", null, []);
                gridMst.setInitWidths("100,100,100,100,100,100,100,");
                gridMst.setColAlign("center,center,center,center,right,center,right");
                gridMst.setColTypes("edn,ed,ed,dhxCalendar,edn,ed,edn");
                gridMst.setColSorting("int,str,str,date,int,str,int");
                gridMst.init();

                gridDtl = subLayout.cells("c").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9
                gridDtl.setHeader("Inv No,PO No,품목코드,품명,수량,단가,금액,신고금액,통화단위,환율,입고금액,단위원가,물대,비율,관세배부,비율,비용배부,비율,입고량", null, []);
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,right,right,right,right,right,right,right,right,right,right,center,right,center,right,right");
                gridDtl.setColTypes("edn,edn,ed,ed,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn,edn");
                gridDtl.setColSorting("int,int,str,str,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int");
                gridDtl.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "spDate",
                    button: "calpicker1"
                }, {
                    input: "rptDate",
                    button: "calpicker2"
                }, {
                    input: "portEntDate",
                    button: "calpicker3"
                }, {
                    input: "crryDate",
                    button: "calpicker4"
                }, {
                    input: "cstPmtDate",
                    button: "calpicker5"
                }, {
                    input: "inputExpctDate",
                    button: "calpicker6"
                }, {
                    input: "inputDate",
                    button: "calpicker7"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());


            })
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-7 col-md-7">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    신고번호 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="suplCompName" id="suplCompName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-8 col-md-8">

                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-2 col-md-2">
                                        <input name="purcOrder" id="purcOrder" type="text" value="" placeholder="Purchase Order" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-3 col-md-3">
                                        <input name="chkReq" id="chkReq" type="text" value="" placeholder="검사의뢰확인" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-4 col-md-4">
                                        <input name="btnCalculateSave" id="btnCalculateSave" type="button" value="원가계산저장 ▶" placeholder="" class="form-control btn-default btn-xs">
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-offset-3 col-sm-offset-3 col-sm-2 col-md-2">
                                <div class="col-sm-5 col-md-5">
                                    <input name="btnStateGo" id="btnStateGo" type="button" value="전표발행" placeholder="" class="form-control btn-default btn-xs">
                                </div>
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-5 col-md-5">
                                    <input name="btnStateCancle" id="btnStateCancle" type="button" value="발행취소" placeholder="" class="form-control btn-default btn-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="frmMainLeft">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain02">
                    <div class="row">
                        <div class="row">
                            <div class="form-group form-group-sm">

                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    Seller </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="Seller" id="Seller" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">

                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 선적일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="spDate" id="spDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker1" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    B/L No </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="Seller" id="Seller" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 신고일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="rptDate" id="rptDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker2" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> Invoice No </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="Seller" id="Seller" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 입항일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="portEntDate" id="portEntDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker3" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 반입일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="crryDate" id="crryDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker4" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    인도조건 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="incondi" id="incondi" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    Shipment </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="shipmt" id="shipmt" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    결제방법 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="pmtWay" id="pmtWay" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    결제금액(\) </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="amount" id="amount" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class=" col-sm-2 col-md-2" for="textinput">
                                    (물대) </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    감정가격 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="appraisePrice" id="appraisePrice" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    결제 </label>
                                <div class="col-sm-3 col-md-2">


                                    <input type="radio" name="pmtOrder" value="1" checked="checked">선결제


                                    <input type="radio" name="pmtOrder" value="2">후결제


                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    부과세과표 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="levyRatal" id="levyRatal" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    세관 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="customs" id="customs" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    관세사 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="cBroker" id="cBroker" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 관세납부일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="cstPmtDate" id="cstPmtDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker5" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    부가세 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="vat" id="vat" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    관세 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="cstAmount" id="cstAmount" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 입고예정일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="inputExpctDate" id="inputExpctDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker6" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    세액합계 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="taxTotal" id="taxTotal" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class="col-sm-offset-4 col-md-offset-4 col-sm-2 col-md-2 control-label" for="textinput"> 입고일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="inputDate" id="inputDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <span>
						       <img id="calpicker7" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    1.비용전표 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="costStmt" id="costStmt" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    3.미착대체전표 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="notArrivedStmt" id="notArrivedStmt" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    2.물대전표 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="mdStmt" id="mdStmt" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
        <div id="customsDesc" style="background-color: gray;">
            <pre class="pre-scrollable">
        	전표발행 : 3건 
        	1. 보험료제외한 비용전표 =>최종발행일
                2. 물대전표 
                3. 미착대체전표 =>월말일자
		관세 : 납부일=신고일 =>비용전표에 포함 구 외 수기전표입력
		미착품, 부가세, 보험료 모두 수기전표입력
		수입제비용 PO에 해당하는 비용만 PO No 를 입력
		        	
        	</pre>
        </div>