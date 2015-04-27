<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(2, [1, 2, 3, 4, 5, 6], "1C"); //시험검사의뢰등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //11
                gridMain.setHeader("No,공급업체,품목코드,품명,규격,단위,수량,단가,금액,납기일자,납품장소", null, []);
                gridMain.attachFooter("소계,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,&nbsp;,&nbsp;", []);
                gridMain.attachFooter("합계,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0,&nbsp;,&nbsp;", []);
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,left,left,left,left,center,right,right,right,center,center");
                gridMain.setColTypes("ron,ed,ed,ed,ed,ed,edn,edn,edn,dhxCalendar,ed");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
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
                toolbar.attachEvent("onClick", function(id) {
        			if(id == "btn5"){
        				fn_insert();
        			}
        		});
                //popUp
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			if(colId==1){
        				gfn_load_popup('공급업체','common/supplyCompPOP');
        			}
        			else if(colId==2){
        				gfn_load_popup('품목코드','common/itemCodePOP');
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
                <form class="form-horizontal" style="padding-top: 10px;padding-bottom: 5px; margin: 0px;" id="frmSearch">
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
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 품의자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reqName" id="reqName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>