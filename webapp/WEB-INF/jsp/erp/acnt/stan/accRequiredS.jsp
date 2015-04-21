<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(0, [1, 3], "2U"); //계정코드필수입력

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                subLayout.cells("b").attachObject("bootContainer2");
                subLayout.cells("a").setWidth(802);

                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //
                gridMain.setHeader("대분류명,중분류명,소분류명,계정,계정명,세목,세목명,계정코드");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ed,ed,ed,ed,ed,ed,ed,edn");
                gridMain.setColSorting("str,str,str,str,str,str,str,int");
                gridMain.init();
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="col-sm-2 col-md-2"><!-- 15 chcks -->
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">부서</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="1" placeholder="" class="" checked="checked">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">거래처</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="2" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">과표</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="3" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">L/C,어음·계좌</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="4" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">시작일</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="5" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">종료일</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="6" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">화폐단위</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="7" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">환율</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="8" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">매입구분</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="9" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">매출구분</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="10" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">원가구분</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="11" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">수량단위</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="12" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">수량</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="13" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">이율</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="14" placeholder="" class="">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-sm-7 col-md-7 control-label" for="textinput">매입전자</label>
                                <div class="col-sm-5 col-md-5">
                                    <input name="" id="" type="checkbox" value="15" placeholder="" class="">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>