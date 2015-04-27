<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(2, [1,8,9], "1C"); //고정자산취득조회

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
                gridMain.setHeader("No,자산코드,자산명,취득일자,품의번호,"+
                					"수량,취득금액,내용년수,상각방법,상각율,"+
                					"취득부서,상태구분,비고");
                gridMain.setInitWidths("100,100,100,100,100,100,"+
                						"100,100,100,100,100,100,"+
                						"100,100,100,100");
                gridMain.setColAlign("center,center,left,center,left"+
                						",right,right,center,left,right"+
                						"left,center,left");
                gridMain.setColTypes("ron,ron,ro,ro,ro,"+
                						"ron,ron,ron,ro,ron,"+
                						"ro,ro,ro,");
                gridMain.setColSorting("int,int,str,date,str,"+
                						"int,int,int,str,int,"+
                						"str,str,str");
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
        		});
            function fn_popup_purcGbn() {
            	gfn_load_popup('자산분류','acnt/assetCodePOP');
            }
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                        	<div class="form-group form-group-sm">
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
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    자산분류 </label>
                                <div class="col-sm-2 col-md-2">
                                  <input type="text" class="form-control input-xs" name="" id="" value="" ondblclick="fn_popup_purcGbn()">
                                </div>
                            </div>
						</div>
                    </div>
                </form>
            </div>
        </div>