<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            $(document)
                .ready(
                    function() {

                        ubi.init(1, [1,8,9], "1C"); 

                        o = ubi.getDataSet();

                        //form//
                        o.layout.cells("b").attachObject("bootContainer2");

                        //grid
                        var gridMain = o.slayout.cells("a").attachGrid();
                        gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //col 8
                        gridMain.setHeader("구분,자재코드,자재명,규격,단위,포장단위,발주단위,입고단위", null, []);
                        gridMain.setInitWidths("100,150,300,300,100,100,100,100");
                        gridMain.setColAlign("center,left,left,left,center,center,center,center");
                        gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro");
                        gridMain.setColSorting("str,str,str,str,str,str,str,str");
                        gridMain.init();
                    })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">

                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                자재코드 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="mtrlCode" id="mtrlCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-md-offset-1 col-sm-4 col-md-4">
                                <input name="mtrlName" id="mtrlName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="col-sm-1 col-md-1 control-label" for="textinput"> 구분 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>자재</option>
                                    <option>자재2</option>
                                    <option>자재3</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>