<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        	var layout, toolbar, subLayout
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

            	Ubi.setContainer(2,[1,2,3,4], "2E"); //구매의뢰접수등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //up
				subLayout.cells("a").showHeader();
				subLayout.cells("a").setText("의뢰내역");
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //15 col
                gridMst.setHeader("No,의뢰일자,의뢰부서,의뢰자,공급업체,품명,규격,단위,수량,단가,금액,납기일자,용도,첨부,선택", null,[]);
                
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,left,left,left,center,right,right,right,center,center,center,center");
                gridMst.setColTypes("ron,dhxCalendar,ed,ed,ed,ed,ed,ed,edn,edn,edn,dhxCalendar,ed,ed,ra");
                gridMst.setColSorting("int,date,str,str,str,str,str,str,int,int,int,date,str,str,na");
                gridMst.init();

                //down
  				subLayout.cells("b").showHeader();
				subLayout.cells("b").setText("접수내역");
                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //10col
                gridDtl.setHeader("No,의뢰번호,품명,규격,단위,입고수량,단가,금액,납기일자,용도");
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,center,right,right,right,center,center");
                gridDtl.setColTypes("ron,edn,ed,ed,ed,edn,edn,edn,dhxCalendar,ed");
                gridDtl.setColSorting("int,int,str,str,str,int,int,int,date,str");
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
        			if(id == "btn1"){
        				fn_insert();
        			}
        		});
                gridDtl.attachEvent("onRowSelect", function(id,ind){
                 	gridDtl.editCell();
                 	});
                 gridMst.attachEvent("onRowSelect", function(id,ind){
                 	gridMst.editCell();
                 	});
                 	
                 gridMst.attachEvent("onCheck",doOnCheck);
                 function doOnCheck(rowId,colId){
            		if(colId==14){
            			gridDtl.addRow(gridDtl.getUID(),"TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
            		}
            	}
            })
			 function fn_insert() {
			 		gridMst.addRow(gridMst.getUID(),"TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,",1);
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
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 접수자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>