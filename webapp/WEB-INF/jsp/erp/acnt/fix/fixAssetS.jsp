<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(1, [1,2,3,4], "1C"); //고정자산취득등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
                gridMain.setHeader("No,자산코드,자산명,취득일자,품의번호,"+
                					"수량,취득금액,내용년수,상각방법,상각율,"+
                					"잔존가액,취득부서,상태구분,재평가년수,재평가금액,"+
                					"처리계정");
                gridMain.setInitWidths("100,100,100,100,100,100,"+
                						"100,100,100,100,100,100,"+
                						"100,100,100,100,100,100,"+
                						"100");
                gridMain.setColAlign("center,center,left,center,left"+
                						",right,right,center,left,right"+
                						",right,left,center,center,right"+
                						",left");
                gridMain.setColTypes("edn,edn,ed,dhxCalendarA,ed,"+
                						"edn,edn,edn,ed,edn,"+
                						"edn,ed,ed,edn,edn"+
                						",ed");
                gridMain.setColSorting("int,int,str,date,str,"+
                						"int,int,int,str,int,"+
                						"int,str,str,int,int,"+
                						"str");
                gridMain.init();
        		});
            function fn_popup_purcGbn() {
            	gfn_load_popup('자산분류','acnt/assetCodePOP');
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
                                    자산분류 </label>
                                <div class="col-sm-2 col-md-2">
                                  <input type="text" class="form-control input-xs" name="" id="" value="" ondblclick="fn_popup_purcGbn()">
                                </div>
                            </div>
						</div>
                    </div>
                </form>
            </div>
        </div>