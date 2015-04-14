<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        	var layout, toolbar, subLayout
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

            	Ubi.setContainer(2,[1,2,3,4,5,6], "2E"); //구매품의결재등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();


                //form//
                layout.cells("b").attachObject("bootContainer2");

                //up

				subLayout.cells("a").showHeader();
				subLayout.cells("a").setText("품의내역");
				
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9 col
                gridMst.setHeader("No,품의자,공급업체,품의금액,결재금액,선택,결재,#cspan,#cspan", null,[]);
                gridMst.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,작성,검토,승인", []);
                gridMst.attachFooter("&nbsp;,합계,#cspan,0,0,&nbsp;,#cspan,#cspan,#cspan", []);
                gridMst.setInitWidths("50,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,left,left,right,right,center,center,center,center");
                gridMst.setColTypes("ron,ed,ed,edn,edn,ra,ed,ch,ch,ch");
                gridMst.setColSorting("str,str,str,str,str,str,str,str,str");
                gridMst.init();

                //down
  				subLayout.cells("b").showHeader();
				subLayout.cells("b").setText("품의상세내역");

                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //12col
                gridDtl.setHeader("No,품명,규격,단위,수량,단가,금액,납기일자,구매제외사유,선택,#cspan,#cspan", null, []);
                gridDtl.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,구매,보류,취소", []);
                gridDtl.attachFooter("&nbsp;,합계,#cspan,#cspan,0,0,0,&nbsp;,#cspan,#cspan,#cspan,#cspan",[]);
                gridDtl.setInitWidths("50,100,200,100,150,150,200,200,100,100,100");
                gridDtl.setColAlign("center,center,left,center,left,left,left,left,center,center,center");
                gridDtl.setColTypes("ron,ed,ed,ed,edn,edn,edn,dhxCalendar,ed,ra,ra,ra");
                gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str");
                gridDtl.init();

                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;

            })

        </script>
        <style>

        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
        <div class="container">
            <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
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
                    </div>
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 결재자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="appvName" id="appvName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>