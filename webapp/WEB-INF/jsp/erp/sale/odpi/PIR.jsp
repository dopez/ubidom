<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 8, 9], "1C"); //PI현황

            	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //16

                gridMain.setHeader("No,PI No,고객,매출구분,담당,고객PO No,결제조건,인도조건,선적항,도착항,선적일자,결제은행,특이사항,품목코드,품명,포장,단위,통화단위,단가,수량,금액,구분");
                gridMain.attachFooter("&nbsp;,소계,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,&nbsp;");
                gridMain.attachFooter("&nbsp;,합계,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,&nbsp;");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center,left,left,center,center,center,right,right,right,center");
                gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ron,ron,ron,ro");
                gridMain.setColSorting("int,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,int,int,int,str");
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
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
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
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 고객 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('고객코드','common/customPOP')">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>