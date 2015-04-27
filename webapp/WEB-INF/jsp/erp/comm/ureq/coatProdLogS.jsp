<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [2, 1, 3, 4, 5, 6], "1C"); //코팅생산일지등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //17
                gridMain.setHeader("No,모재코드,모재명,약품,수량,#cspan,#cspan,조건,온도,진공도,에칭,어시스트,두께,Rate,에칭,방식,비고", null, []);
                gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,양품,불량,계,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,left,left,left,right,right,right,center,center,center,center,center,center,right,center,center,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str");
                gridMain.init();
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
                toolbar.attachEvent("onClick", function(id) {
        			if(id == "btn5"){
        				fn_insert();
        			}
        		});
                //popUp
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			if(colId==1){
        				gfn_load_popup('모재코드','common/metalCodePOP');
        			}else if(colId==3){
        				gfn_load_popup('약품코드','common/coatingDrugCodePOP');
        			}
        		}
            })
                
            function fn_insert() {
            		gridMain.addRow(gridMain.getUID(),"1,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
        	}

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
                            <div class="col-sm-8 col-md-8">
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
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 등록자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqName" id="reqName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 설비코드 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('설비코드','common/equiCodePOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>