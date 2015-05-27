<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
            var gridMst,gridDtl;
            var calStDate;
            $(document).ready(function() {

                Ubi.setContainer(4, [1, 2, 3, 4], "2E"); //Invoice/Packing List 등록

             	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();
                //form//
                layout.cells("b").attachObject("bootContainer2");
				layout.cells("b").setHeight(240);
                

                //grid	
                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("수주내역");
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); 
                gridMst.setHeader("No,수주번호,고객PO No,품목코드,품명,포장,단위,통화단위,단가,수량,금액,결제조건,인도조건,선적항,도착항,납기일자,선택");
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,left,left,left,left,center,center,center,right,right,right,center,center,center,center,center,center");
                gridMst.setColTypes("ron,ed,ed,ed,ed,ed,ed,ed,edn,edn,edn,ed,ed,ed,ed,dhxCalendar,ra");
                gridMst.setColSorting("int,str,str,str,str,str,str,str,int,int,int,str,str,str,str,date,na");
                gridMst.init();

                subLayout.cells("b").showHeader();
                subLayout.cells("b").setText("Invoice/Packing List 내역");
                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //16
                gridDtl.setHeader("No,인쇄,In No,품목코드,품명,단위,통화단위,단가,수량,금액,중량,CBM,결제조건,인도조건,선적항,도착항");
                gridDtl.attachFooter("&nbsp;,#cspan,합계,#cspan,#cspan,#cspan,#cspan,0,0,0,0");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,left,left,center,center,right,right,right,right,center,center,center,center,center");
                gridDtl.setColTypes("ron,ch,ro,ro,ro,ro,ro,ron,ron,ron,ron,ro,ro,ro,ro,ro");
                gridDtl.setColSorting("int,str,str,str,str,str,str,int,int,int,int,str,str,str,str,str");
                gridDtl.init();
                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                },{
                	input:"shipDate",
                	button:"calpicker2"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                //항목삽입
                toolbar.attachEvent("onClick", function(id) {
                    if (id == "btn1") {
                        fn_insert();
                    }

                });

                //edit cell
                gridDtl.attachEvent("onRowSelect", function(id, ind) {
                    gridDtl.editCell();
                });
                gridMst.attachEvent("onRowSelect", function(id, ind) {
                    gridMst.editCell();
                });
                
                gridMst.attachEvent("onCheck", doOnCheck);
                function doOnCheck(rowId, colId) {
                    if (colId == 16) {
                        gridDtl.addRow(gridDtl.getUID(), "TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST", 1);
                    }
                }
            })

            function fn_insert() {
                gridMst.addRow(gridMst.getUID(), "TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,", 1);

            }
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
        <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
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
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">담당</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 고객 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('고객코드','common/customPOP')">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">운송회사</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('운송회사','common/supplyCompCodePOP')">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">선박회사</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('선박회사','common/supplyCompCodePOP')">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                선적일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="shipDate" id="shipDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input type="button" id="calpicker2" class="calicon form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">Remarks</label>
                            <div class="col-sm-10 col-md-10">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>