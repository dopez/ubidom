<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(1, [1,8,9], "1C"); //유형고정자산총괄표

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //10
                gridMain.setHeader("No,자산분류,기초잔액,당기증가,당기감소,당기기말잔액,전기말상각누계,당기상각액,당기말상각누계,당기말미상각잔액");
                gridMain.attachFooter(",계,0,0,0,0,0,0,0,0");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,110");
                gridMain.setColAlign("center,center,right,right,right,right,right,right,right,right");
                gridMain.setColTypes("ron,ro,ron,ron,ron,ron,ron,ron,ron,ron");
                gridMain.setColSorting("int,str,int,int,int,int,int,int,int,int");
                gridMain.init();

                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmMain">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
	                        <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 기준일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
								       <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>