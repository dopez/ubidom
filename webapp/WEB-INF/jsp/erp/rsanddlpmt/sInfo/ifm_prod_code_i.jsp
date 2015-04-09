<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            var calStDate;
            $(document)
                .ready(
                    function() {

                        ubi.init(1, [1, 2, 3, 4], "2U"); //제품코드등록

                        o = ubi.getDataSet();

                        //form//
                        o.layout.cells("b").attachObject("bootContainer2");

                        //left grid//
                        gridMain = o.slayout.cells("a").attachGrid();
                        gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                        gridMain.setHeader("제품코드, 제품명", null, [
                            "text-align:center;", "text-align:center;"
                        ]);
                        gridMain.setInitWidths("100,150");
                        gridMain.setColAlign("left,left");
                        gridMain.setColTypes("ro,ro");
                        gridMain.setColSorting("str,str");
                        gridMain.init();

                        //right form//
                        o.slayout.cells("b").attachObject("productCodeInfo");
                        o.slayout.cells("a").setWidth("252");

                        o.btn.attachEvent("onClick", function(id) {
                            if (id = "srh")
                                btn_serach();
                        });

                        //set date//
                        calStDate = new dhtmlXCalendarObject([{
                            input: "expirationDate",
                            button: "calpicker1"
                        }, {
                            input: "regDate",
                            button: "calpicker2"
                        }, {
                            input: "stopDate",
                            button: "calpicker3"
                        }]);
                        calStDate.loadUserLanguage("ko");
                        calStDate.hideTime();
                        var t = dateformat(new Date());
                        byId("regDate").value = t;

                    })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">

                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                제품코드 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-md-offset-1 col-sm-4 col-md-4">
                                <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div id="productCodeInfo" style="position: relative; width: 100%; height: 100%; ">
            <form id="frmMain" class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;">
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            제품코드 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>제품</option>
                                <option>제품2</option>
                                <option>제품3</option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            대분류 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>제품</option>
                                <option>제품2</option>
                                <option>제품3</option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            중분류 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>제품</option>
                                <option>제품2</option>
                                <option>제품3</option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            소분류 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>제품</option>
                                <option>제품2</option>
                                <option>제품3</option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            일련번호 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="pSeqNo" id="pSeqNo" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            제품명 </label>
                        <div class="col-sm-10 col-md-6">
                            <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            규격 </label>
                        <div class="col-sm-10 col-md-6">
                            <input name="pSzie" id="pSzie" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            단위 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="pMeasure" id="pMeasure" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 포장단위 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="packMeasure" id="packMeasure" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            유통기간구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>1.제조일자</option>
                                <option>2.개봉일자</option>
                            </select>
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 유효기간 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-11 col-md-11">
                                <input name="expirationDate" id="expirationDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <span>
						       <img id="calpicker1" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            LEAD TIME </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="leadTime" id="leadTime" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 안전재고 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="safeStock" id="safeStock" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            

                                
                                    <input type="radio" name="sfStockGbn" value="1" checked="checked">변동
                                
                                
                                    <input type="radio" name="sfStockGbn" value="2">고정
                                


                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            순중량</label>
                        <div class="col-sm-2 col-md-2">
                            <input name="netWeight" id="netWeight" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 총중량 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="grossWeight" id="grossWeight" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            검사유무</label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>검사</option>
                                <option>미검사</option>
                            </select>
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 보관온도 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-4 col-md-4">
                                <input name="fromTemp" id="fromTemp" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="col-sm-4 col-md-4" style="text-align: center; vertical-align: middle;">~</label>

                            <div class="col-sm-4 col-md-4">
                                <input name="toTemp" id="toTemp" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                        <label class="col-sm-2 col-md-2" style="vertical-align: middle;">
                            ˚C </label>


                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            등록일자 </label>
                        <div class="col-sm-2 col-md-2">

                            <div class="col-sm-11 col-md-11">
                                <input name="regDate" id="regDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <span>
						       <img id="calpicker2" style="margin-top:1px;width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                            </div>

                        </div>

                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>사용</option>
                                <option>미사용</option>
                            </select>


                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            HS CODE </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="hsCode" id="hsCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용중지일자 </label>
                        <div class="col-sm-2 col-md-2">

                            <div class="col-sm-11 col-md-11">
                                <input name="stopDate" id="stopDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <span> <img id="calpicker3"
							style="margin-top: 1px; width: 27px; height: 27px;"
							class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif"
							border="0">
						</span>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            회계구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>원재료</option>
                                <option>재료</option>
                            </select>

                        </div>
                    </div>
                </div>
            </form>
        </div>