<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(1, [1, 8, 9], "1C"); //자산분류등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");
                layout.cells("b").setHeight(65);

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                gridMain.setHeader("No,내용년수,상각율,비고");
                gridMain.setInitWidths("100,100,100,100");
                gridMain.setColAlign("center,center,right,center");
                gridMain.setColTypes("ron,edn,edn,ed");
                gridMain.setColSorting("int,int,int,str");
                gridMain.init();
                //calRangeDate
                document.getElementById("inTarget").disabled = true;
                document.getElementById("btnCopy").disabled = true;

                var forTaborder = document.getElementById("inSource");
                forTaborder.onchange = function() {
                    if (this.value != "" || this.value.length > 0) {
                        document.getElementById("inTarget").disabled = false;
                        document.getElementById("btnCopy").disabled = false;
                    }
                }

            });
            function fn_popup_purcGbn() {
                gfn_load_popup('자산분류', 'acnt/assetCodePOP');
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
                                    자산분류
                                    <br>(Source) </label>
                                <div class="col-sm-2 col-md-2">
                                    <input type="text" class="form-control input-xs" name="" id="inSource" value="" ondblclick="fn_popup_purcGbn()">
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    자산분류
                                    <br>(Target) </label>
                                <div class="col-sm-2 col-md-2">
                                    <input type="text" class="form-control input-xs" name="" id="inTarget" value="" ondblclick="fn_popup_purcGbn()">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                        <input type="button" class="form-control btn btn-default btn-xs" name="" id="btnCopy" value="복&nbsp;사">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>