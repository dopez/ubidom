<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
        var gridMain;
        var calMain;
        $(document).ready(function() {

            Ubi.setContainer(1, [1,2,3,4,5,6,7,8,9,10], "1C"); //계정코드입력

            layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();

            //form//
            layout.cells("b").attachObject("bootContainer2");

                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //13
                gridMain.setHeader("대분류명,중분류명,소분류명,계정,계정명,세목,세목명,계정코드,타계정,차대구분,사용구분,사용분류,경비사용유무");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ed,ed,ed,ed,ed,ed,ed,edn,edn,ra,coro,coro,coro");
                gridMain.setColSorting("str,str,str,str,str,str,str,int,int,na,na,na,na");
                gridMain.init();
            })
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
               <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">계정분류</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('계정분류','common/accCodePOP')">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>