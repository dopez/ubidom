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
				subLayout.cells("a").showHeader();
				subLayout.cells("a").setText("1. 기간, 2. 거래처, 3. 항목");
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
                gridMain.setHeader("No,발생일자,거래처,비용항목,비용명,"+
                					"Inv No,거래처명,대표자재상품,대표자재상품명,금액,"+
                					"VAT,총금액");
                gridMain.attachFooter(",소계,#cspan,#cspan,#cspan,"+
                					"#cspan,#cspan,#cspan,#cspan,0,"+
                					"0,0");
                gridMain.attachFooter(",합계,#cspan,#cspan,#cspan,"+
                					"#cspan,#cspan,#cspan,#cspan,0,"+
                					"0,0");
                gridMain.setInitWidths("100,100,100,100,100,"+
                						"100,100,100,100,100,"+
                						"100,100");
                gridMain.setColAlign("center,center,center,center,center,"+
                						"center,center,center,center,right,"+
                						"right,right");						
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
                                    항목
                                </label>
                                <div class="col-sm-2 col-md-2">
                                   <input type="text" id="" class="form-control input-xs" onclick="gfn_load_popup('비용코드','common/accCodePOP')">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                   <input type="text" id="" class="form-control input-xs" onclick="gfn_load_popup('비용코드','common/accCodePOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    조회순서
                                </label>
                                <div class="col-sm-1 col-md-1">
                                   <input type="text" id="" class="form-control input-xs" placeholder="1-2-3" name="" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>