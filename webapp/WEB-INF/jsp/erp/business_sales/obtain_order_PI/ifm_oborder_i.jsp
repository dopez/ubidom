<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                ubi.init(2, [1, 2, 3, 4, 5, 6], "1C"); //수주등록

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");
                o.layout.cells("b").setHeight(204);

                //grid	
                gridMain = o.slayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //17
                gridMain.setHeader("No,품목코드,품명,포장,단위,통화단위,단가,수량,금액,납기일자,납품장소,재고수량,출고요청,생산의뢰,품검요청,개발요청,구분");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,left,left,center,center,right,right,right,right,center,center,right,center,center,center,center,center");
                gridMain.setColTypes("ron,ed,ed,ed,ed,ed,edn,edn,edn,dhxCalendar,ed,edn,ch,ch,ch,ch,ch");
                gridMain.setColSorting("int,str,str,str,str,str,int,int,int,date,str,int,str,str,str,str,str");
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
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <span> <img id="calpicker1" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
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
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 고객 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 매출구분 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 고객PO No </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 결제조건 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 인도조건 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 선적항 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 도착항 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 특이사항 </label>
                            <div class="col-sm-6 col-md-6">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                <input type="button" id="" name="" value="Excel Upload"> </label>
                        </div>
                    </div>
                </div>
            </form>
        </div>