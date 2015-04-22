<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMst;
            var t = new Date().getFullYear();
            var m = +new Date().getMonth() + 1;
            $(document).ready(function() {
                Ubi.setContainer(1, [1, 8, 9], "2E");
                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();
                //      고정자산감가상각명세서
                layout.cells("b").attachObject("bootContainer");

                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //6
                gridMst.setHeader("No,구분,계정,취득원가,전기말상각누계액,"+
                					"상각기초가액,당기증가,당기감소,감가상각누계 당기감소액, 당기상각액,"+
                					"당기말상각누계액,기말잔액");
                gridMst.setInitWidths("100,100,100,100,120,"+
                						"110,100,100,200,100,"+
                						"120,100");
                gridMst.setColAlign("center,center,left,right,right"+
                					",right,right,right,right,right"+
                					",right,right");
                gridMst.setColTypes("ron,ro,ro,ron,ron,"+
                					"ron,ron,ron,ron,ron,"+
                					"ron,ron");
                gridMst.setColSorting("int,str,str,int,int,"+
                						"int,int,int,int,int,"+
                						"int,int");
                gridMst.init();
                
                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //6
                gridDtl.setHeader("No,계정코드,계정명,세목명,코드,"+
			                		"자산명,취득일,처분일,취득부서,수량,"+
			                		"취득원가,내용년수,상각율,상각종류,자산상태,"+
			                		"상각기초가액,비용구분");
                gridDtl.setInitWidths("100,100,100,100,100"+
                						",100,100,100,100,100"+
                						",100,100,100,100,100,"+
                						"110,100");
                gridDtl.setColAlign("center,left,left,left,left,"+
                					"left,center,center,left,right,"+
                					"right,center,right,center,left,"+
                					"right,center");
                gridDtl.setColTypes("ron,ro,ro,ro,ro,"+
                					"ro,ro,ro,ro,ron,"+
                					"ron,ron,ron,ro,ro,"+
                					"ron,ro");
                gridDtl.setColSorting("int,str,str,str,str,"+
                						"str,date,date,str,int,"+
                						"int,int,int,str,str,"+
                						"int,str");
                gridDtl.init();

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
                                        상각연월 </label>
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
                                    <div class="col-sm-2 col-md-2">
                                        <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                            <input type="button" id="" class="form-control btn btn-default btn-xs" value="상단출력(집계)" onclick="">
                                        </div>
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                            <input type="button" id="" class="form-control btn btn-default btn-xs" value="전체출력" onclick="">
                                        </div>
                                    </div>
                                </div>
                         </div>
                    </div>
                </form>
            </div>
        </div>