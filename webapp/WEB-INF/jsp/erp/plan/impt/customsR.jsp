<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(4, [1, 8, 9], "1C"); //통관현황

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	

                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //35
                gridMain.setHeader("No,Shipment,선적일자,입고일자,정산일자,"+
                					"Inv No,팔레트 NO,컨테이너 No,공급처명,SC No,"+
                					"재질,품목명,규격,수량(중량),단가,"+
                					"금액,신고용금액,화폐,환율,입고금액,"+
                					"단위당 원가,물대,비율,관세배부,비율,"+
                					"비용배부,비율,물대전표,비용전표,미착대체전표,"+
                					"TT일자,인도조건,입항예정일자,수입구분,비고");
                gridMain.attachFooter(",합계,#cspan,#cspan,#cspan,"+
                					"#cspan,#cspan,#cspan,#cspan,#cspan,"+
                					"#cspan,#cspan,#cspan,0,,"+
                					"0,0,,0,0,"+
                					",0,0,0,0,"+
                					"0,0");
                gridMain.setInitWidths("100,100,100,100,100,"+
                						"100,100,100,100,100,"+
                						"100,100,100,100,100,"+
                						"100,100,100,100,100,"+
                						"100,100,100,100,100,"+
                						"100,100,100,100,100,"+
                						"100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,"+
    					"center,center,center,center,center,"+
    					"center,center,center,right,center,"+
    					"right,right,center,right,right,"+
    					"center,right,right,right,right,"+
    					"right,right,center,center,center,"+
    					"center,center,center,center,center");						
                gridMain.setColTypes("str");
                gridMain.setColSorting("str");
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

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    기간 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                        </div>
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    거래처
                                </label>
                                <div class="col-sm-2 col-md-2">
                                   <input type="text" id="" class="form-control input-xs" onclick="gfn_load_popup('거래처','common/customPOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    완료여부
                                </label>
                                <div class="col-sm-4 col-md-4">
                                   <input type="radio" id="" class="" name="complGbn" value="1" checked="checked">전체
                                   <input type="radio" id="" class="" name="complGbn" value="2">완료
                                   <input type="radio" id="" class="" name="complGbn" value="3">진행
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    품목구분
                                </label>
                                <div class="col-sm-4 col-md-4">
                                   <input type="radio" id="" class="" name="itemGbn" value="1" checked="checked">전체
                                   <input type="radio" id="" class="" name="itemGbn" value="2">상품
                                   <input type="radio" id="" class="" name="itemGbn" value="3">원재료
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>