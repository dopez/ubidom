<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 8, 9], "1C"); //      계정+거래처별장부

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("※ 해당항목 더블클릭 시 전표내역 POP");
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //25
                gridMain.setHeader("계정명,세목명,거래처,승인일자,No,전표일자,No,발의자,발의부서,귀속부서,세목명,차변,대변,잔액,과표,적요,번호,시작일,종료일" + 
                				   "수량,환율,이율,원가구분,화폐단위,수량단위");
                gridMain.attachFooter(",#cspan,#cspan,월계,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0");
                gridMain.attachFooter(",#cspan,#cspan,누계,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,0,0,0");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,center,center,center,center,center,center,right,right,center,center,center,center,center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ron,ron,ron,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str,int,int,int,str,str,str,str,str,str,str,str,str,str,str,str");
                gridMain.init();
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
                gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
                function doOnRowDblClicked(rowId,colId){
        			
        				gfn_big_load_popup(1120,500,'전표등록내역','acnt/stmtDtlPOP');
        			
        		}
            })
                
            function fn_insert() {
            		gridMain.addRow(gridMain.getUID(),"1,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
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
                                    전표일자 </label>
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

                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 계정과목 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('계정과목','common/accCodePOP')">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('계정과목','common/accCodePOP')">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 거래처 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('거래처','common/customPOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>