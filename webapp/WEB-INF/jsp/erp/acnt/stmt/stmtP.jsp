<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 9], "1C"); //      전표출력

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //8
                gridMain.setHeader("No,계정,거래처,귀속부서,관리번호,원가구분,금액,#cspan");
                gridMain.attachHeader("#rspan,적요,#cspan,#cspan,#cspan,#cspan,차변금액,대변금액");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ron,ron");
                gridMain.setColSorting("int,str,str,str,str,str,int,int");
                gridMain.init();
            })
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-8 col-md-8">
                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 col-md-2 control-label" for="textinput">전표일자</label>
                                <div class="col-sm-2 col-md-2">
                                    <div class="col-sm-10 col-md-10">
                                        <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                    </div>
                                    <div class="col-sm-2 col-md-2">
                                        <input type="button" id="calpicker1" class="calicon form-control">
                                    </div>
                                </div>
                                <div class="col-sm-1 col-md-1">
                                    <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                        <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">발의부서</label>
                                <div class="col-sm-1 col-md-1">
                                    <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">담당자</label>
                                <div class="col-sm-1 col-md-1">
                                    <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                    검색구분 </label>
                                <div class="col-sm-8 col-md-8">
                                	<input type="radio" class="" name="searchGbn" id="" value="1" checked="checked">전체 
                                	<input type="radio" class="" name="searchGbn" id="" value="2">담당자
                                </div>    
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>