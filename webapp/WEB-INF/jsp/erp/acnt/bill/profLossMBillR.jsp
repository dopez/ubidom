<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var t = new Date().getFullYear();
            var m = +new Date().getMonth() + 1;
            $(document).ready(function() {
                Ubi.setContainer(1, [1, 8, 9], "1C");
                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();
                //손익계정월명세서
                layout.cells("b").attachObject("bootContainer");

                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //
                gridMain.setHeader("No,계정,합계,"+
                					"1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월");
                gridMain.attachFooter(",계,0,"+
                					"0,0,0,0,0,0,0,0,0,0,0,0");
                gridMain.attachFooter(",총계,0,"+
                					"0,0,0,0,0,0,0,0,0,0,0,0");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,right,right,right,right,right,right,right,right,right,right,right,right,right");
                gridMain.setColTypes("ron,ro,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron,ron");
                gridMain.setColSorting("int,str,int,int,int,int,int,int,int,int,int,int,int,int,int");
                gridMain.init();

                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.setDateFormat("%Y/%m");
                calMain.hideTime();
                byId("stDate").value = t + "/" + m;
            });
            function calYearAdder(n) {
                if (n == 1) {
                    if (m > 11) {
                        m = 1;
                        t = t + 1
                        byId("stDate").value = t + "/" + m;
                    } else {
                    	m++;
                        byId("stDate").value = t + "/" + m;
                    }
                } else {
                    if (m < 2) {
                        m = 12;
                        t = t - 1
                        byId("stDate").value = t + "/" + m;
                    } else {
                    	m--;
                        byId("stDate").value = t + "/" + m;
                    }
                }
            }


        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;"></div>
        <div id="bootContainer">
            <div class="container">
                <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    결산연월 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-6 col-md-6">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <input type="button" id="" class="form-control btn btn-default btn-xs" value="▲" onclick="calYearAdder(1)">
                                    </div>
                                    <div class="col-sm-3 col-md-3">
                                        <input type="button" id="" class="form-control btn btn-default btn-xs" value="▼" onclick="calYearAdder(2)">
                                    </div>
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                부서코드 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>