<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var girdMst;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(1, [1,8,9], "2U"); //총계정원장

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                subLayout.cells("a").setWidth(102);
                girdMst = subLayout.cells("a").attachGrid();
                girdMst.setImagePath("/component/dhtmlxGrid/imgs/"); //9
                girdMst.setHeader("계정");
                girdMst.setInitWidths("100");
                girdMst.setColAlign("center");
                girdMst.setColTypes("ro");
                girdMst.setColSorting("str");
                girdMst.init();
                
                
                subLayout.cells("b").showHeader();
                subLayout.cells("b").setText("※ 해당항목 더블클릭 시 전표내역 POP");
                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //9
                gridDtl.setHeader("계정,승인일자,전표일자,번호,차변,대변,잔액");
                gridDtl.attachFooter(",월계,#cspan,#cspan,0,0,0");
                gridDtl.attachFooter(",누계,#cspan,#cspan,0,0,0");
                gridDtl.setInitWidths("100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,right,right,right");
                gridDtl.setColTypes("ro,ro,ro,ro,ron,ron,ron");
                gridDtl.setColSorting("str,str,str,str,int,int,int");
                gridDtl.init();
                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }, {
                    input: "edDate",
                    button: "calpicker2"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                
                toolbar.attachEvent("onClick", function(id) {
        			if(id == "btn1"){
        				fn_insert();
        			}
        		});
                //popUp
                gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			
        				gfn_big_load_popup(1120,500,'전표등록내역','acnt/stmtDtlPOP');
        			
        		}
            })
                
            function fn_insert() {
            		gridDtl.addRow(gridDtl.getUID(),"1,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
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
                                    승인일자 </label>
                                <div class="col-sm-6 col-md-6">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                                        </div>
                                    </div>
                                    <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-sm-10 col-md-10">
                                            <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                                        </div>
                                        <div class="col-sm-2 col-md-2">
                                            <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
                    </div>
                </form>
            </div>
        </div>