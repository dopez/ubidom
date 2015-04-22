<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(0, [0], "1C");
                //전표상세현황조회
                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                subLayout.cells("a").attachObject("bootContainer2");
                /* subLayout.cells("a").setHeight(0); */

                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                /* byId("edDate").value = t; */
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
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-2 col-md-2">
                                    <input type="button" value="디스켓작성" id="" name="" class="form-control btn btn-default btn-xs">
                                </div>
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-8 col-md-8">
                                    <label id="forDesc" class="control-label" for="textinput">
                                    1. A 드라이브에 디스켓을 넣으세요.
                                    </label>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-sm-offset-4 col-md-offset-4 col-sm-8 col-md-8">
                                    <label id="forDesc" class="control-label" for="textinput">
                                    2. '디스켓작성' 버튼을 누르세요.
                                    </label>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-sm-offset-4 col-md-offset-4 col-sm-8 col-md-8">
                                    <label id="forDesc" class="control-label" for="textinput">
                                    (디스켓에 사업자번호로 된 파일로 신고자료가 저장됩니다.)
                                    </label>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-2 col-md-2">
                                    <input type="button" value="디스켓Label출력" id="" name="" class="form-control btn btn-default btn-xs">
                                </div>
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-8 col-md-8">
                                    <label id="forDesc" class="control-label" for="textinput">
                                    3. '디스켓Label출력' 버튼을 누르세요.
                                    </label>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-sm-offset-4 col-md-offset-4 col-sm-8 col-md-8">
                                    <label id="forDesc" class="control-label" for="textinput">
                                    (디스켓에 붙일 Label이 출력됩니다.)
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>