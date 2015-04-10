<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMain;
            $(document).ready(function() {

                ubi.init(1, [1, 8, 9], "1C"); /*시험장비이력조회 */

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = o.slayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //12col
                gridMain.setHeader("No,장비코드,장비명,규격,사용용도,구입일자,구입처,전화번호,구입금액,제작일자,사용기간,사용유무");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,left,left,left,center,center,center,center,right,center,center,center");
                gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ron,ro,ro,ro");
                gridMain.setColSorting("int,str,str,str,str,date,str,str,int,date,date,str");
                gridMain.init();
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; ">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                시험장비코드
                            </label>
                            <div class="col-sm-4 col-md-4">
                                <input name="buyerName" id="buyerName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>