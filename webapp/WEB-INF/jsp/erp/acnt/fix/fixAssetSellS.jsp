<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(2, [1, 2, 3, 4], "1C"); //고정자산처분등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();


                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                gridMain.setHeader("No,처분구분,처리년월,자산코드,자산명,"+
                					"취득일,수량,취득금액,상각누계액,당기잔액,"+
                					"처분금액,처분내용,처분거래처");
                gridMain.setInitWidths("100,100,100,100,100,"+
                						"100,100,100,100,100,"+
                						"100,100,100");
                gridMain.setColAlign("center,center,center,left,left,"+
                						"center,right,right,right,right,"+
                						"right,left,left");
                gridMain.setColTypes("ron,ed,ed,ed,ed,"+
                						"dhxCalendarA,edn,edn,edn,edn,"+
                						"edn,ed,ed");
                gridMain.setColSorting("int,str,str,str,str,"+
                						"date,int,int,int,int,"+
                						"int,str,str");
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
            function fn_popup_asset() {
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
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 처분일자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 자산분류 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input type="text" class="form-control input-xs" name="" id="" value="" ondblclick="fn_popup_asset()">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>