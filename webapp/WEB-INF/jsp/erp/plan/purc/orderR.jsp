<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 8, 9], "2E"); //발주조회

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //up

                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("발주내역");
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //7 col
                gridMst.setHeader("No,품의일자,품의자,공급업체,결재금액,발주,인쇄", null, []);
                gridMst.attachFooter("&nbsp;,합계,#cspan,#cspan,0,&nbsp;,#cspan", []);
                gridMst.setInitWidths("50,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,left,left,right,center,center");
                gridMst.setColTypes("ron,dhxCalendar,ed,ed,edn,ra,ra");
                gridMst.setColSorting("str,date,str,str,int,str,str");
                gridMst.init();

                //down
                subLayout.cells("b").showHeader();
                subLayout.cells("b").setText("발주상세내역");

                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9col
                gridDtl.setHeader("No,품명,규격,단위,수량,단가,금액,납기일자,납품장소", null, []);
                gridDtl.attachFooter("&nbsp;,합계,#cspan,#cspan,0,0,0,&nbsp;,#cspan", null, []);


                gridDtl.setInitWidths("50,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,right,right,right,center,center");
                gridDtl.setColTypes("ron,ed,ed,ed,edn,edn,edn,dhxCalendar,ed");
                gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,");
                gridDtl.init();

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
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 의뢰부서 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="deptName" id="deptName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 공급업체 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="supplCompName" id="supplCompName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>