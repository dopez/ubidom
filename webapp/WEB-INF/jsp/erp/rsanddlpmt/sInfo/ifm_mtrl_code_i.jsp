<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var gridMain,layout,toolbar,subLayout;
            var calStDate
            $(document)
                .ready(
                    function() {

                    	Ubi.setContainer(1, [1, 2, 3, 4], "2U"); //자재코드등록

                        layout = Ubi.getLayout();
                        toolbar = Ubi.getToolbar();
                        subLayout = Ubi.getSubLayout();

                        //form//
                        layout.cells("b").attachObject("bootContainer2");

                        //left grid//
                        gridMain = subLayout.cells("a").attachGrid();
                        gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                        gridMain.setHeader("자재코드,자재명", null, [
                            "text-align:center;", "text-align:center;"
                        ]);

                        gridMain.setInitWidths("100,150");
                        gridMain.setColAlign("left,left");
                        gridMain.setColTypes("ro,ro");
                        gridMain.setColSorting("str,str");
                        gridMain.init();

                        //right form
                        subLayout.cells("b").attachObject("productCodeInfo");
                        subLayout.cells("a").setWidth("252");

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

        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
            <div class="container">
            
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class="col-sm-3 col-md-2 control-label" for="textinput">
                                자재코드 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="mtrlCode" id="mtrlCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-md-offset-1 col-sm-offset-1 col-sm-4 col-md-4">
                                <input name="mtrlName" id="mtrlName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            
            </div>
            </form>
        </div>
        <div id="productCodeInfo" style="position: relative; width: 100%; height: 100%;">
            <form id="frmMain" class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
            <div class="container">
            
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            자재코드 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="mtrlCode" id="mtrlCode" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>자재</option>
                                <option>자재2</option>
                                <option>자재3</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            자재명 </label>
                        <div class="col-sm-10 col-md-6">
                            <input name="mtrlName" id="mtrlName" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            규격 </label>
                        <div class="col-sm-10 col-md-6">
                            <input name="mtrlSzie" id="mtrlSzie" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            단위 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="mtrlMeasure" id="mtrlMeasure" type="text" value="" placeholder="" class="form-control input-xs">
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
                            발주단위 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="orderMeasure" id="orderMeasure" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 입고단위 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="inMeasure" id="inMeasure" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            출고단위1 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="outMeasure1" id="outMeasure1" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 출고단위2 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="outMeasure2" id="outMeasure2" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            최소발주량 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="minOrderQty" id="minOrderQty" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 공급사2 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="spplComp2" id="spplComp2" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-2 col-md-2">
                            <input type="radio" name="spplComp2Gbn" value="1" checked="checked">내자
							<input type="radio" name="spplComp2Gbn" value="2">외자
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            공급사1 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="spplComp1" id="spplComp1" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <div class="col-sm-1 col-md-1">
   							<input type="radio" name="spplComp2Gbn" value="1" checked="checked">내자
							<input type="radio" name="spplComp2Gbn" value="2">외자
                        </div>
                        <label class="col-sm-1 col-md-1 control-label" for="textinput"> 원산지 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="originPlc" id="originPlc" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            제조사 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="manufacturer" id="manufacturer" type="text" value="" placeholder="" class="form-control input-xs">
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
                            유통기간구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>1.제조일자</option>
                                <option>2.개봉일자</option>
                            </select>
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
                            LEAD TIME </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="leadTime" id="leadTime" type="text" value="" placeholder="" class="form-control input-xs">
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
                            순중량</label>
                        <div class="col-sm-2 col-md-2">
                            <input name="netWeight" id="netWeight" type="text" value="" placeholder="" class="form-control input-xs">
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
                            검사유무</label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>검사</option>
                                <option>미검사</option>
                            </select>
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> Class</label>
                        <div class="col-sm-2 col-md-2">
                            <input name="cLass" id="cLass" type="text" value="" placeholder="" class="form-control input-xs">
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
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> Packing Group </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="pGroup" id="pGroup" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            UN No </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="UnNo" id="UnNo" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 유독물 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="toxic" id="toxic" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            약물구분 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option>산</option>
                                <option>알칼리</option>
                                <option>혼적가능</option>
                                <option>단독선적</option>
                            </select>
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 위험물 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="hazard" id="hazard" type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">

                        <label class="col-sm-2 col-md-2 control-label" for="textinput">
                            입고장소 </label>
                        <div class="col-sm-2 col-md-2">
                            <select class="form-control input-xs">
                                <option></option>
                                <option></option>
                                <option></option>
                            </select>
                        </div>
                        <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 취급제한물질 </label>
                        <div class="col-sm-2 col-md-2">
                            <input name="restrictHandling" id="restrictHandling" type="text" value="" placeholder="" class="form-control input-xs">
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
            </div>
            
            </form>
        </div>