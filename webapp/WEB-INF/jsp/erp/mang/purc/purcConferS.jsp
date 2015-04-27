<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout
        var gridMst;
        var gridDtl;
        var calMain;
        $(document).ready(function() {

        	Ubi.setContainer(2,[1,2,3,4], "2E"); //구매품의등록

            layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();

            //form//
            layout.cells("b").attachObject("bootContainer2");

            //up
			subLayout.cells("a").showHeader();
			subLayout.cells("a").setText("접수내역");
            gridMst = subLayout.cells("a").attachGrid();
            gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //11 col
            gridMst.setHeader("No,의뢰일자,의뢰부서,의뢰자,접수자,의뢰금액,품의금액,공급업체,비고,첨부,선택");
            gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
            gridMst.setColAlign("center,center,center,center,center,right,right,left,center,center,center");
            gridMst.setColTypes("ron,dhxCalendar,ed,ed,ed,edn,edn,ed,ed,ed,ra");
            gridMst.setColSorting("int,date,str,str,str,int,int,str,str,str,na");
            gridMst.init();

            //down
			subLayout.cells("b").showHeader();
			subLayout.cells("b").setText("접수상세내역");
            gridDtl = subLayout.cells("b").attachGrid();
            gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //11col
            gridDtl.setHeader("No,품명,규격,단위,수량,단가,금액,납기일자,납품장소,용도,선택");
            gridDtl.attachFooter("&nbsp;,합계,#cspan,#cspan,0,0,0");
            gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,100");
            gridDtl.setColAlign("center,left,left,center,right,right,right,center,center,center,center");
            gridDtl.setColTypes("ron,ed,ed,ed,edn,edn,edn,dhxCalendar,ed,ed,ra");
            gridDtl.setColSorting("int,str,str,str,int,int,int,date,str,str,na");
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
            toolbar.attachEvent("onClick", function(id) {
    			if(id == "btn2"){
    				fn_insert();
    			}
    		});
            //popUp
            gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
            function doOnRowDblClicked(rowId,colId){
    			if(colId==7){
    				gfn_load_popup('공급업체','common/supplyCompPOP');
    			}
    		}
            gridDtl.attachEvent("onRowSelect", function(id,ind){
             	gridDtl.editCell();
             	});
             gridMst.attachEvent("onRowSelect", function(id,ind){
             	gridMst.editCell();
             	});
             	
             gridMst.attachEvent("onCheck",doOnCheck);
             function doOnCheck(rowId,colId){
        		if(colId==10){
        			gridDtl.addRow(gridDtl.getUID(),"TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
        		}
        	}
        })
            
        function fn_insert() {
        		gridMst.addRow(gridMst.getUID(),"1,TEST,TEST,TEST,TEST,TEST,TEST,,TEST,TEST,",1);
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