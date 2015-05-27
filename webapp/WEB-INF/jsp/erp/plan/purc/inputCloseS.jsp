<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(2, [1, 2, 3, 4], "1C"); //입고마감등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //14
                gridMain.setHeader("No,입고일자,발주자,공급업체,구분,품목,규격,단위,입고수량,단가,공급가액,부가세,금액계,마감", null, []);
                gridMain.attachFooter("&nbsp;,소계,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,0,0,&nbsp;", []);
                gridMain.attachFooter("&nbsp;,합계,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,0,0,&nbsp;", []);

                gridMain.setInitWidths("50,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,left,center,left,left,center,right,right,right,right,right,center");
                gridMain.setColTypes("ron,dhxCalendar,ed,ed,ed,ed,ed,ed,edn,edn,edn,edn,edn,ch");
                gridMain.setColSorting("str,date,str,str,str,str,str,str,int,int,int,int,int,str");
                gridMain.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;

            })
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
                                <div class="col-sm-2 col-md-2">

                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                       <input type="button" id="calpicker1" class="calicon form-control">
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
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    마감자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="closeName" id="closeName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input type="button" id="btnPurcStatement" name="btnPurcStatement" class="btn btn-default btn-xs form-control" value="매입전표생성">
                                </div>
                                <!-- <div class=" col-md-offset-6 col-sm-8 col-md-2">
						<input type="button" id="btnPurcStatement" name="btnPurcStatement" value="매입전표생성">
					</div> -->
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>